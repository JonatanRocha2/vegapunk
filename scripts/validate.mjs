import { readdir, readFile } from "node:fs/promises";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const root = new URL("../skills/", import.meta.url);
const rootPath = fileURLToPath(root);
const readmePath = fileURLToPath(new URL("../README.md", import.meta.url));
const englishReadmePath = fileURLToPath(new URL("../README.en.md", import.meta.url));
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

  if (languageNames.size !== 12) {
    console.error(`FAIL ${language}: expected 12 skills, found ${languageNames.size}`);
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

if (failures) process.exit(1);
console.log(`Validated ${names.size} skills.`);
