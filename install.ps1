param(
    [ValidateSet("pt-br", "en")]
    [string]$Language = "en",
    [switch]$WithCavemanProxy,
    [switch]$NoCaveman,
    [switch]$NoAwsToolkit,
    [switch]$NoRecommendedSkills,
    [switch]$AllowElevated
)

$ErrorActionPreference = "Stop"

# renovate: datasource=npm depName=skills
$SkillsCliVersion = "1.5.23"
# renovate: datasource=github-releases depName=JuliusBrussee/caveman
$CavemanVersion = "v2.3.1"
$CavemanCommit = "b5ec6351396b643a17cbbec4a6eee8b3fb9dd782"
# renovate: datasource=npm depName=@caveman-ai/cli
$CavemanCliVersion = "1.2.5"
# renovate: datasource=github-digest depName=aws/agent-toolkit-for-aws
$AwsToolkitRef = "main"
$AwsToolkitCommit = "ed19c44c46c9c3a12ef0ff5bbf88161b75d3efbe"
# renovate: datasource=github-digest depName=mattpocock/skills
$HandoffRef = "main"
$HandoffCommit = "6654f6b60cd9d5be8b54c6fafe44346dabeb3b76"
# renovate: datasource=github-digest depName=anthropics/skills
$FrontendDesignRef = "main"
$FrontendDesignCommit = "3b3fad96af16a10759d930941b4520ba0c40edae"

$CurrentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
$CurrentPrincipal = [Security.Principal.WindowsPrincipal]::new($CurrentIdentity)
$IsAdministrator = $CurrentPrincipal.IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)
if ($IsAdministrator -and -not $AllowElevated) {
    throw "Refusing elevated installation. Run as a normal user or pass -AllowElevated after reviewing the script."
}

if ($WithCavemanProxy -and $NoCaveman) {
    throw "-WithCavemanProxy cannot be combined with -NoCaveman."
}

if (-not (Get-Command node -ErrorAction SilentlyContinue) -or
    -not (Get-Command npx -ErrorAction SilentlyContinue) -or
    -not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Node.js 22.20 or newer with npx and Git are required."
}

$NodeVersion = [version]((& node --version).TrimStart("v"))
if ($NodeVersion -lt [version]"22.20.0") {
    throw "Node.js 22.20 or newer is required; found $NodeVersion"
}

function Invoke-Checked {
    param([string]$Program, [string[]]$Arguments)

    & $Program @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Program failed with exit code $LASTEXITCODE"
    }
}

function Install-PinnedSkill {
    param(
        [string]$Repository,
        [string]$Commit,
        [string]$Skill
    )

    $TempDirectory = Join-Path ([IO.Path]::GetTempPath()) "vegapunk-$Skill-$([guid]::NewGuid())"
    try {
        Invoke-Checked -Program "git" -Arguments @("init", "--quiet", $TempDirectory)
        Invoke-Checked -Program "git" -Arguments @(
            "-C", $TempDirectory, "fetch", "--quiet", "--depth", "1", $Repository, $Commit
        )
        Invoke-Checked -Program "git" -Arguments @(
            "-C", $TempDirectory, "checkout", "--quiet", "--detach", "FETCH_HEAD"
        )
        Invoke-Checked -Program "npx" -Arguments @(
            "--yes", "skills@$SkillsCliVersion", "add", $TempDirectory,
            "--skill", $Skill, "-a", "codex", "-g", "--copy", "--yes"
        )
    } finally {
        if (Test-Path -LiteralPath $TempDirectory) {
            Remove-Item -LiteralPath $TempDirectory -Recurse -Force
        }
    }
}

$Skills = if ($Language -eq "en") {
    @(
        "software-architecture", "cloud-architecture", "aws-architecture",
        "gcp-architecture", "azure-architecture", "terraform-infrastructure",
        "kubernetes-operations", "devops-cicd", "sre-incident-response",
        "cloud-security-review", "finops-cost-review", "network-engineering",
        "ansible-automation", "certification-study", "code-review",
        "semantic-commit", "learning-journal"
    )
} else {
    @(
        "software-architecture-pt-br", "cloud-architecture-pt-br",
        "aws-architecture-pt-br", "gcp-architecture-pt-br",
        "azure-architecture-pt-br", "terraform-infrastructure-pt-br",
        "kubernetes-operations-pt-br", "devops-cicd-pt-br",
        "sre-incident-response-pt-br", "cloud-security-review-pt-br",
        "finops-cost-review-pt-br", "network-engineering-pt-br",
        "ansible-automation-pt-br", "certification-study-pt-br",
        "code-review-pt-br", "semantic-commit-pt-br", "learning-journal-pt-br"
    )
}

$SkillArguments = @("--yes", "skills@$SkillsCliVersion", "add", "JonatanRocha2/vegapunk", "--skill")
$SkillArguments += $Skills
$SkillArguments += @("-a", "codex", "-g", "--yes")
Invoke-Checked -Program "npx" -Arguments $SkillArguments

if (-not $NoAwsToolkit) {
    $AwsToolkitTemp = Join-Path ([IO.Path]::GetTempPath()) "vegapunk-aws-$([guid]::NewGuid())"
    try {
        Invoke-Checked -Program "git" -Arguments @("init", "--quiet", $AwsToolkitTemp)
        Invoke-Checked -Program "git" -Arguments @(
            "-C", $AwsToolkitTemp, "fetch", "--quiet", "--depth", "1",
            "https://github.com/aws/agent-toolkit-for-aws.git", $AwsToolkitCommit
        )
        Invoke-Checked -Program "git" -Arguments @(
            "-C", $AwsToolkitTemp, "sparse-checkout", "init", "--cone"
        )
        Invoke-Checked -Program "git" -Arguments @(
            "-C", $AwsToolkitTemp, "sparse-checkout", "set", "skills/core-skills"
        )
        Invoke-Checked -Program "git" -Arguments @(
            "-C", $AwsToolkitTemp, "checkout", "--quiet", "--detach", "FETCH_HEAD"
        )
        Invoke-Checked -Program "npx" -Arguments @(
            "--yes", "skills@$SkillsCliVersion", "add",
            (Join-Path $AwsToolkitTemp "skills/core-skills"),
            "--skill", "*", "-a", "codex", "-g", "--copy", "--yes"
        )
    } finally {
        if (Test-Path -LiteralPath $AwsToolkitTemp) {
            Remove-Item -LiteralPath $AwsToolkitTemp -Recurse -Force
        }
    }
}

if (-not $NoRecommendedSkills) {
    Install-PinnedSkill `
        -Repository "https://github.com/mattpocock/skills.git" `
        -Commit $HandoffCommit `
        -Skill "handoff"
    Install-PinnedSkill `
        -Repository "https://github.com/anthropics/skills.git" `
        -Commit $FrontendDesignCommit `
        -Skill "frontend-design"
}

if (-not $NoCaveman) {
    Install-PinnedSkill `
        -Repository "https://github.com/JuliusBrussee/caveman.git" `
        -Commit $CavemanCommit `
        -Skill "caveman"
}

if ($WithCavemanProxy) {
    Invoke-Checked -Program "npm" -Arguments @("install", "-g", "@caveman-ai/cli@$CavemanCliVersion")
    Invoke-Checked -Program "caveman" -Arguments @("setup", "--install")
}

Write-Output "Vegapunk $Language skills installed for Codex. Restart Codex if needed."
