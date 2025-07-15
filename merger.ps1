param(
    [Parameter(Mandatory = $true)][ValidateSet("generic", "rottenwoods", "noclateo", "crater")]
    [string]$map,

    [Parameter(Mandatory = $true)][ValidateSet("gladius", "adel", "gnoster", "maris", "libra", "fulghor", "caligo", "heolstor")]
    [string]$boss,

    [Parameter(Mandatory = $true)][ValidateSet("wylder", "guardian", "ironeye", "duchess", "raider", "revenant", "recluse", "executor")]
    [string]$character
)

function Capitalize($word) {
    return $word.Substring(0, 1).ToUpper() + $word.Substring(1).ToLower()
}

$mapFile = "Map_$(Capitalize $map).json"
$bossFile = "Boss_$(Capitalize $boss).json"
$characterFile = "Character_$(Capitalize $character).json"

# Load, validate and combine files
$files = @($mapFile, $bossFile, $characterFile)
$results = @()
foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        Write-Error "❌ Missing required file: $file"
        exit 1
    }

    try {
        $fileContent = Get-Content $file
        $fileData = $fileContent | ConvertFrom-Json
        $results = $results + $fileData
    }
    catch {
        Write-Error "❌ Invalid JSON syntax in file: $file"
        exit 1
    }
}


$outputFile = "Merged_Map-$(Capitalize $map)_Boss-$(Capitalize $boss)_Character-$(Capitalize $character).json"

$mergedJson = $results | ConvertTo-Json

$mergedJson | Out-File -Encoding utf8 -FilePath $outputFile
Write-Host "✅ Merged JSON written to $outputFile"
