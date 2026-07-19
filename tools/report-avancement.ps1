#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Génère un rapport d'état d'avancement de tous les objets métier.

.DESCRIPTION
    Scanne 02-Objets-Metier/ et produit un rapport Markdown dans docs/
    indiquant pour chaque objet :
    - Le statut des fichiers conceptuels (README, schema)
    - Le nombre de versions contextualisées (contexte-version)
    - Pour chaque version : présence de README, SPEC, templates (json/xml/csv/sql),
      examples, datasets, compare.md
    - Un score d'avancement global

.PARAMETER OutputPath
    Chemin du fichier rapport (défaut : docs/report-avancement.md)

.EXAMPLE
    ./report-avancement.ps1
    ./report-avancement.ps1 -OutputPath "docs/mon-rapport.md"
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$OutputPath = "docs/report-avancement.md"
)

# --- Configuration ---
$BASE_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent
$OBJETS_DIR = Join-Path $BASE_DIR "02-Objets-Metier"
$REPORT_DATE = Get-Date -Format "yyyy-MM-dd HH:mm"

# --- Chemins relatifs attendus pour chaque version ---
$EXPECTED_FILES = @{
    "README.md"         = $true  # Obligatoire
    "SPEC.md"           = $true  # Obligatoire
    "data.json"         = $true  # Template
    "data.xml"          = $true  # Template
    "data.csv"          = $true  # Template
    "data.sql"          = $true  # Template
    "compare.md"        = $false # Optionnel
}

# --- Collecte des objets métier ---
$objetDirs = Get-ChildItem -Path $OBJETS_DIR -Directory | Where-Object {
    $_.Name -notmatch "^OBJ-" -and
    $_.Name -ne "01-index" -and
    $_.Name -ne "02-objets-métiers" -and
    $_.Name -ne "troncs-communs.md"
}

$reportLines = @()

$reportLines += "# Rapport d'Avancement des Objets Métier"
$reportLines += ""
$reportLines += "> **Généré le :** $REPORT_DATE"
$reportLines += "> **Source :** 02-Objets-Metier/"
$reportLines += ""
$reportLines += "---"
$reportLines += ""

# --- Tableau récapitulatif ---
$reportLines += "## Tableau récapitulatif"
$reportLines += ""
$reportLines += "| # | Objet | Objet/Schema | Contextes | Templates | Examples | Datasets | Score |"
$reportLines += "|---|-------|-------------|-----------|-----------|----------|----------|-------|"

$globalScore = 0
$globalMax = 0
$totalObjects = 0

foreach ($obj in $objetDirs | Sort-Object { $_.Name -match '^\d+' ? [int]($Matches[0]) : 0 }) {
    $totalObjects++
    $objetName = $obj.Name

    # Extrait le code objet (ex: "08" de "08-risks")
    $objNum = 0
    if ($objetName -match '^\d+') {
        $objNum = [int]$Matches[0]
    }

    # Vérifie README.md + schema.md (niveau conceptuel)
    $hasReadme = Test-Path (Join-Path $obj.FullName "README.md")
    $hasSchema = Test-Path (Join-Path $obj.FullName "schema.md")
    $objetOk = $hasReadme -and $hasSchema
    $objetStatut = if ($objetOk) { "OK" } else { "À faire" }

    # Explore les versions contextualisées
    $contextDirs = Get-ChildItem -Path $obj.FullName -Directory | Where-Object {
        $_.Name -match '^[a-z]+-\d+\.\d+$'
    } | Sort-Object Name

    $contextCount = $contextDirs.Count
    $totalTemplates = 0
    $totalExamples = 0
    $totalDatasets = 0
    $contextDetail = @()

    $contextScore = 0
    $contextMaxPerVersion = 0

    foreach ($ctx in $contextDirs) {
        $ctxName = $ctx.Name

        # Fichiers attendus
        $ctxFiles = @{}
        foreach ($fName in $EXPECTED_FILES.Keys) {
            $fPath = Join-Path $ctx.FullName $fName
            $ctxFiles[$fName] = (Test-Path $fPath)
        }

        # Templates (data.{json,xml,sql,csv})
        $templateFiles = @("data.json", "data.xml", "data.csv", "data.sql")
        $foundTemplates = 0
        foreach ($tf in $templateFiles) {
            if ($ctxFiles.ContainsKey($tf) -and $ctxFiles[$tf]) { $foundTemplates++ }
        }
        $totalTemplates += $foundTemplates

        # Examples (pattern *-example-* ou *-lorem-* ou *-demo-*)
        $exampleFiles = Get-ChildItem -Path $ctx.FullName -File | Where-Object {
            $_.Name -match '-example-|-lorem-|-demo-'
        }
        $exampleCount = $exampleFiles.Count
        $totalExamples += $exampleCount

        # Datasets (pattern *-pm2-* ou *-pmi-* ou *-eu-* ou *-safer-* mais PAS -example-)
        $datasetFiles = Get-ChildItem -Path $ctx.FullName -File | Where-Object {
            $_.Name -match '^[a-z].*-pm2-|^[a-z].*-pmi-|^[a-z].*-eu-|^[a-z].*-safer-'
        }
        $datasetCount = $datasetFiles.Count
        $totalDatasets += $datasetCount

        # Score de ce contexte
        $expectedCount = $EXPECTED_FILES.Count
        $contextMaxPerVersion += $expectedCount
        $foundTotal = 0
        foreach ($key in $EXPECTED_FILES.Keys) {
            if ($ctxFiles.ContainsKey($key) -and $ctxFiles[$key]) { $foundTotal++ }
        }
        $contextScore += $foundTotal

        # Détail pour affichage
        $statusList = @()
        foreach ($fName in $EXPECTED_FILES.Keys) {
            $icon = if ($ctxFiles[$fName]) { "✅" } else { "⬜" }
            $statusList += "$icon $fName"
        }
        $detail = "  **$ctxName** : $($statusList -join ', ')"
        $detail += " | $exampleCount exemple(s) | $datasetCount dataset(s)"
        $contextDetail += $detail
    }

    # Score pour l'objet
    # Conceptuel : 2 points (README + schema)
    # Templates : 4 points (json, xml, csv, sql)
    # Examples : 1 point (au moins 1)
    # Contextes : 10 points par contexte avec SPEC + templates complets
    $objetScore = 0
    if ($objetOk) { $objetScore += 2 }
    $objetScore += $totalTemplates
    if ($totalExamples -gt 0) { $objetScore += 1 }
    $objetScore += ($contextCount * 10)

    $objetMax = 2 + 4 + 1 + ($contextCount * 10)
    $globalScore += $objetScore
    $globalMax += $objetMax

    # Score en pourcentage pour le tableau
    $scorePct = if ($objetMax -gt 0) { [math]::Round(($objetScore / $objetMax) * 100) } else { 0 }

    # Statut global
    $overallStatut = "À faire"
    if ($contextCount -gt 0) {
        $hasAllTemplates = ($totalTemplates -eq $contextCount * 4)
        $hasSpec = ($contextDetail | Where-Object { $_ -match "✅ SPEC.md" }).Count -eq $contextCount
        $hasReadme = ($contextDetail | Where-Object { $_ -match "✅ README.md" }).Count -eq $contextCount
        if ($hasSpec -and $hasReadme -and $hasAllTemplates) {
            $overallStatut = "Complet"
        } elseif ($hasSpec -and $hasReadme) {
            $overallStatut = "Partiel"
        }
    }

    $reportLines += "| $objNum | $objetName | $objetStatut | $contextCount | $totalTemplates | $totalExamples | $totalDatasets | $scorePct% |"
}

$reportLines += ""

# --- Score global ---
$globalPct = if ($globalMax -gt 0) { [math]::Round(($globalScore / $globalMax) * 100) } else { 0 }
$reportLines += "## Score global d'avancement"
$reportLines += ""
$reportLines += "| Indicateur | Valeur |"
$reportLines += "|-----------|--------|"
$reportLines += "| Objets total | $totalObjects |"
# Compte total des contextes
$totalContexts = 0
foreach ($obj in $objetDirs) {
    $ctxs = Get-ChildItem -Path $obj.FullName -Directory | Where-Object { $_.Name -match '^[a-z]+-\d+\.\d+$' }
    $totalContexts += $ctxs.Count
}

$reportLines += "| Objets avec contexte(s) | $totalContexts |"
$reportLines += "| Avancement global | $globalPct% |"
$reportLines += ""

# --- Détail par objet ---
$reportLines += "---"
$reportLines += ""
$reportLines += "## Détail par objet"
$reportLines += ""

foreach ($obj in $objetDirs | Sort-Object { $_.Name -match '^\d+' ? [int]($Matches[0]) : 0 }) {
    $objetName = $obj.Name
    $contextDirs = Get-ChildItem -Path $obj.FullName -Directory | Where-Object {
        $_.Name -match '^[a-z]+-\d+\.\d+$'
    } | Sort-Object Name

    if ($contextDirs.Count -eq 0) {
        $reportLines += "### $objetName"
        $reportLines += ""
        $hasReadme = Test-Path (Join-Path $obj.FullName "README.md")
        $hasSchema = Test-Path (Join-Path $obj.FullName "schema.md")
        $reportLines += "- README.md : $(if($hasReadme){"✅"}else{"❌"})"
        $reportLines += "- schema.md : $(if($hasSchema){"✅"}else{"❌"})"
        $reportLines += "- **Aucun contexte/version**"
        $reportLines += ""
        continue
    }

    $reportLines += "### $objetName ($($contextDirs.Count) contexte(s))"
    $reportLines += ""
    $reportLines += "| Contexte | README | SPEC | Templates | Examples | Datasets |"
    $reportLines += "|---------|--------|------|-----------|----------|----------|"

    foreach ($ctx in $contextDirs) {
        $ctxName = $ctx.Name
        $hasReadme = Test-Path (Join-Path $ctx.FullName "README.md")
        $hasSpec = Test-Path (Join-Path $ctx.FullName "SPEC.md")

        $templates = @("data.json","data.xml","data.csv","data.sql")
        $templateCount = 0
        foreach ($tf in $templates) { if (Test-Path (Join-Path $ctx.FullName $tf)) { $templateCount++ } }

        $exampleFiles = Get-ChildItem -Path $ctx.FullName -File | Where-Object {
            $_.Name -match '-example-|-lorem-|-demo-'
        }
        $exampleCount = $exampleFiles.Count

        $datasetFiles = Get-ChildItem -Path $ctx.FullName -File | Where-Object {
            $_.Name -match '^[a-z].*-pm2-|^[a-z].*-pmi-|^[a-z].*-eu-|^[a-z].*-safer-'
        }
        $datasetCount = $datasetFiles.Count

        $reportLines += "| $ctxName | $(if($hasReadme){"✅"}else{"❌"}) | $(if($hasSpec){"✅"}else{"❌"}) | $templateCount/4 | $exampleCount | $datasetCount |"
    }
    $reportLines += ""
}

# --- Légende ---
$reportLines += "---"
$reportLines += ""
$reportLines += "## Légende"
$reportLines += ""
$reportLines += "| Icône | Signification |"
$reportLines += "|-------|--------------|"
$reportLines += "| ✅ | Fichier présent |"
$reportLines += "| ❌ | Fichier absent |"
$reportLines += "| ⬜ | Attendu mais absent |"
$reportLines += ""
$reportLines += "## Critères de complétude"
$reportLines += ""
$reportLines += "Un objet est considéré **Complet** lorsque :"
$reportLines += ""
$reportLines += "- ✅ README.md et schema.md existent au niveau conceptuel"
$reportLines += "- ✅ Au moins un contexte existe avec README.md + SPEC.md"
$reportLines += "- ✅ Tous les templates (data.json, data.xml, data.csv, data.sql) sont présents"
$reportLines += "- ✅ Au moins un exemple (lorem ipsum) est présent"
$reportLines += ""
$reportLines += "Un objet est **Partiel** s'il a des contextes mais manque des templates."
$reportLines += "Un objet est **À faire** s'il n'a aucun contexte ou pas de README/schema."
$reportLines += ""

# --- Écriture du rapport ---
$reportContent = $reportLines -join "`n"

# S'assure que le dossier docs existe
$docsDir = Join-Path $BASE_DIR "docs"
if (!(Test-Path $docsDir)) {
    New-Item -ItemType Directory -Force -Path $docsDir | Out-Null
}

$fullOutputPath = Join-Path $BASE_DIR $OutputPath
$fullOutputPath = $fullOutputPath -replace '/','\'

Set-Content -Path $fullOutputPath -Value $reportContent -Encoding UTF8

Write-Host ""
Write-Host "Rapport généré : $fullOutputPath" -ForegroundColor Green
Write-Host "Score global d'avancement : $globalPct% ($totalObjects objets)" -ForegroundColor Cyan
Write-Host ""
