import { readdir, readFile } from "node:fs/promises";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const root = new URL("../skills/", import.meta.url);
const rootPath = fileURLToPath(root);
const readmePath = fileURLToPath(new URL("../README.md", import.meta.url));
const englishReadmePath = fileURLToPath(new URL("../README.en.md", import.meta.url));
const powershellInstallerPath = fileURLToPath(new URL("../install.ps1", import.meta.url));
const shellInstallerPath = fileURLToPath(new URL("../install.sh", import.meta.url));
const workflowPath = fileURLToPath(new URL("../.github/workflows/validate.yml", import.meta.url));
const renovatePath = fileURLToPath(new URL("../renovate.json", import.meta.url));
const languages = ["en", "pt-br"];
const names = new Set();
const namesByLanguage = new Map();
let failures = 0;

for (const language of languages) {
  const languagePath = join(rootPath, language);
  const entries = await readdir(languagePath, { withFileTypes: true });
  const languageNames = new Set();
  namesByLanguage.set(language, languageNames);

  for (const entry of entries.filter((item) => item.isDirectory())) {
    const file = join(languagePath, entry.name, "SKILL.md");
    let content;

    try {
      content = await readFile(file, "utf8");
    } catch {
      console.error(`FAIL ${language}/${entry.name}: missing SKILL.md`);
      failures += 1;
      continue;
    }

    const frontmatter = content.match(/^---\r?\n([\s\S]*?)\r?\n---\r?\n/);
    const name = frontmatter?.[1].match(/^name:\s*([^\r\n]+)$/m)?.[1].trim();
    const description = frontmatter?.[1].match(/^description:\s*(.+)$/m)?.[1].trim();
    const declaredLanguage = frontmatter?.[1].match(/^  language:\s*"?([^"\r\n]+)"?$/m)?.[1];
    const errors = [];

    if (!frontmatter) errors.push("invalid frontmatter");
    if (name !== entry.name) errors.push(`name must be ${entry.name}`);
    if (!name || !/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(name) || name.length > 64) {
      errors.push("invalid name");
    }
    if (!description || description.length > 1024) errors.push("invalid description");
    const expectedLanguage = language === "pt-br" ? "pt-BR" : "en";
    if (declaredLanguage !== expectedLanguage) {
      errors.push(`metadata.language must be "${expectedLanguage}"`);
    }
    if (names.has(name)) errors.push("duplicate name");
    names.add(name);
    languageNames.add(name);

    if (errors.length) {
      console.error(`FAIL ${language}/${entry.name}: ${errors.join(", ")}`);
      failures += 1;
    } else {
      console.log(`OK   ${language}/${entry.name}`);
    }
  }

  if (languageNames.size !== 16) {
    console.error(`FAIL ${language}: expected 16 skills, found ${languageNames.size}`);
    failures += 1;
  }
}

for (const englishName of namesByLanguage.get("en")) {
  if (!namesByLanguage.get("pt-br").has(`${englishName}-pt-br`)) {
    console.error(`FAIL missing pt-BR pair for ${englishName}`);
    failures += 1;
  }
}

for (const path of [readmePath, englishReadmePath]) {
  const readme = await readFile(path, "utf8");
  const rows = [...readme.matchAll(/^\| `([a-z0-9-]+)` \| `([a-z0-9-]+)` \|/gm)];
  const catalogNames = new Set(rows.flatMap((match) => [match[1], match[2]]));
  const missingFromReadme = [...names].filter((name) => !catalogNames.has(name));
  const missingFromDisk = [...catalogNames].filter((name) => !names.has(name));

  if (missingFromReadme.length || missingFromDisk.length) {
    console.error(
      `FAIL catalog mismatch in ${path}; README missing [${missingFromReadme.join(", ")}], disk missing [${missingFromDisk.join(", ")}]`,
    );
    failures += 1;
  }
}

const [powershellInstaller, shellInstaller, workflow, renovate] = await Promise.all([
  readFile(powershellInstallerPath, "utf8"),
  readFile(shellInstallerPath, "utf8"),
  readFile(workflowPath, "utf8"),
  readFile(renovatePath, "utf8"),
]);

const pins = {
  skills: [
    powershellInstaller.match(/^\$SkillsCliVersion = "([^"]+)"$/m)?.[1],
    shellInstaller.match(/^skills_cli_version=(\S+)$/m)?.[1],
    workflow.match(/^  SKILLS_CLI_VERSION: "([^"]+)"$/m)?.[1],
  ],
  cavemanRelease: [
    powershellInstaller.match(/^\$CavemanVersion = "([^"]+)"$/m)?.[1],
    shellInstaller.match(/^caveman_version=(\S+)$/m)?.[1],
    workflow.match(/^  CAVEMAN_VERSION: "([^"]+)"$/m)?.[1],
  ],
  cavemanCommit: [
    powershellInstaller.match(/^\$CavemanCommit = "([a-f0-9]{40})"$/m)?.[1],
    shellInstaller.match(/^caveman_commit=([a-f0-9]{40})$/m)?.[1],
    workflow.match(/^  CAVEMAN_COMMIT: "([a-f0-9]{40})"$/m)?.[1],
  ],
  cavemanCli: [
    powershellInstaller.match(/^\$CavemanCliVersion = "([^"]+)"$/m)?.[1],
    shellInstaller.match(/^caveman_cli_version=(\S+)$/m)?.[1],
  ],
  awsToolkitRef: [
    powershellInstaller.match(/^\$AwsToolkitRef = "([^"]+)"$/m)?.[1],
    shellInstaller.match(/^aws_toolkit_ref=(\S+)$/m)?.[1],
    workflow.match(/^  AWS_TOOLKIT_REF: "([^"]+)"$/m)?.[1],
  ],
  awsToolkitCommit: [
    powershellInstaller.match(/^\$AwsToolkitCommit = "([a-f0-9]{40})"$/m)?.[1],
    shellInstaller.match(/^aws_toolkit_commit=([a-f0-9]{40})$/m)?.[1],
    workflow.match(/^  AWS_TOOLKIT_COMMIT: "([a-f0-9]{40})"$/m)?.[1],
  ],
  handoffRef: [
    powershellInstaller.match(/^\$HandoffRef = "([^"]+)"$/m)?.[1],
    shellInstaller.match(/^handoff_ref=(\S+)$/m)?.[1],
    workflow.match(/^  HANDOFF_REF: "([^"]+)"$/m)?.[1],
  ],
  handoffCommit: [
    powershellInstaller.match(/^\$HandoffCommit = "([a-f0-9]{40})"$/m)?.[1],
    shellInstaller.match(/^handoff_commit=([a-f0-9]{40})$/m)?.[1],
    workflow.match(/^  HANDOFF_COMMIT: "([a-f0-9]{40})"$/m)?.[1],
  ],
  frontendDesignRef: [
    powershellInstaller.match(/^\$FrontendDesignRef = "([^"]+)"$/m)?.[1],
    shellInstaller.match(/^frontend_design_ref=(\S+)$/m)?.[1],
    workflow.match(/^  FRONTEND_DESIGN_REF: "([^"]+)"$/m)?.[1],
  ],
  frontendDesignCommit: [
    powershellInstaller.match(/^\$FrontendDesignCommit = "([a-f0-9]{40})"$/m)?.[1],
    shellInstaller.match(/^frontend_design_commit=([a-f0-9]{40})$/m)?.[1],
    workflow.match(/^  FRONTEND_DESIGN_COMMIT: "([a-f0-9]{40})"$/m)?.[1],
  ],
};

for (const [dependency, values] of Object.entries(pins)) {
  if (values.some((value) => !value) || new Set(values).size !== 1) {
    console.error(`FAIL inconsistent ${dependency} pins: ${values.join(", ")}`);
    failures += 1;
  }
}

const actionRefs = [...workflow.matchAll(/^\s*uses:\s*([^\s#]+)/gm)].map((match) => match[1]);
if (!actionRefs.length || actionRefs.some((reference) => !/@[a-f0-9]{40}$/.test(reference))) {
  console.error(`FAIL GitHub Actions must use full commit SHAs: ${actionRefs.join(", ")}`);
  failures += 1;
}
if (!/^\s+persist-credentials:\s+false$/m.test(workflow)) {
  console.error("FAIL checkout must disable persisted credentials");
  failures += 1;
}

try {
  JSON.parse(renovate);
} catch (error) {
  console.error(`FAIL invalid renovate.json: ${error.message}`);
  failures += 1;
}

if (failures) process.exit(1);
console.log(`Validated ${names.size} skills.`);
