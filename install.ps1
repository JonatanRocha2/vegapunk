param(
    [ValidateSet("pt-br", "en")]
    [string]$Language = "en",
    [switch]$WithCavemanProxy,
    [switch]$NoCaveman
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command node -ErrorAction SilentlyContinue) -or
    -not (Get-Command npx -ErrorAction SilentlyContinue)) {
    throw "Node.js 22.20 or newer with npx is required: https://nodejs.org/"
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

$Skills = if ($Language -eq "en") {
    @(
        "software-architecture", "cloud-architecture", "aws-architecture",
        "gcp-architecture", "azure-architecture", "terraform-infrastructure",
        "kubernetes-operations", "devops-cicd", "sre-incident-response",
        "cloud-security-review", "finops-cost-review", "code-review"
    )
} else {
    @(
        "software-architecture-pt-br", "cloud-architecture-pt-br",
        "aws-architecture-pt-br", "gcp-architecture-pt-br",
        "azure-architecture-pt-br", "terraform-infrastructure-pt-br",
        "kubernetes-operations-pt-br", "devops-cicd-pt-br",
        "sre-incident-response-pt-br", "cloud-security-review-pt-br",
        "finops-cost-review-pt-br", "code-review-pt-br"
    )
}

$SkillArguments = @("--yes", "skills@1.5.23", "add", "JonatanRocha2/vegapunk", "--skill")
$SkillArguments += $Skills
$SkillArguments += @("-a", "codex", "-g", "--yes")
Invoke-Checked -Program "npx" -Arguments $SkillArguments

if (-not $NoCaveman) {
    Invoke-Checked -Program "npx" -Arguments @(
        "--yes", "skills@1.5.23", "add",
        "https://github.com/JuliusBrussee/caveman/tree/b5ec6351396b643a17cbbec4a6eee8b3fb9dd782",
        "--skill", "caveman", "-a", "codex", "-g", "--yes"
    )
}

if ($WithCavemanProxy) {
    Invoke-Checked -Program "npm" -Arguments @("install", "-g", "@caveman-ai/cli@1.2.5")
    Invoke-Checked -Program "caveman" -Arguments @("setup", "--install")
}

Write-Output "Vegapunk $Language skills installed for Codex. Restart Codex if needed."
