#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Crée un objet composé à partir de plusieurs troncs communs.

.DESCRIPTION
    Ce script assemble des troncs communs existants pour créer un nouvel
    objet composé. Il inclut les références UUID des objets sources
    et génère un schema.md décrivant la structure composite.

.PARAMETER Nom
    Nom de l'objet composé

.PARAMETER Troncs
    Liste des troncs à assembler (séparés par des virgules)

.PARAMeter References
    UUIDs des objets sources (un par tronc)

.PARAMeter Usage
    Description de l'usage de l'objet composé

.EXAMPLE
    ./compose-object.ps1 -nom "ChangeIncident" -troncs "entite-vie,gouvernance,financier" -references "INC-001,DEC-001,CST-001" -usage "Incident nécessitant une décision et un coût"

.EXAMPLE
    ./compose-object.ps1 -nom "ReleasePackage" -troncs "evenement,artefact,gouvernance" -references "VER-001,ART-001,ACC-001" -usage "Release complète avec acceptation client"
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$nom,

    [Parameter(Mandatory=$true)]
    [string[]]$troncs,

    [Parameter(Mandatory=$true)]
    [string[]]$references,

    [Parameter(Mandatory=$false)]
    [string]$usage = ""
)

# --- Configuration ---
$BASE_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent | Split-Path -Parent
$OBJET_DIR = Join-Path $BASE_DIR "02-Objets-Metier"
$TRONC_DIR = Join-Path $BASE_DIR "troncs"

if ($troncs.Count -ne $references.Count) {
    Write-Error "Le nombre de troncs doit correspondre au nombre de références."
    exit 1
}

# Nom du dossier
$nomDossier = ($nom -replace '\s+', '-' -replace '[^a-zA-Z0-9\-]', '')
$dossier = Join-Path $OBJET_DIR $nomDossier

# --- Création du dossier ---
Write-Host "Création de l'objet composé : $nom" -ForegroundColor Cyan
Write-Host "  Troncs        : $($troncs -join ', ')" -ForegroundColor Gray
Write-Host "  Références    : $($references -join ', ')" -ForegroundColor Gray
Write-Host "  Dossier       : $nomDossier" -ForegroundColor Gray

New-Item -ItemType Directory -Force -Path $dossier | Out-Null

# --- Construction du schema.md ---
$schemaContent = @"
# Schema : Objet composé — $nom

> **Type :** Objet composé (troncs multiples)
> **Usage :** $usage
> **Créé le :** $(Get-Date -Format "yyyy-MM-dd")

## 1. Présentation

Cet objet est une composition de plusieurs troncs communs. Il représente
une entité de terrain qui ne correspond à aucun objet seul mais rassemble
les morceaux pertinents de plusieurs troncs.

## 2. Troncs assemblés

| # | Tronc | Référence | UUID source |
|---|-------|-----------|-------------|
"@

for ($i = 0; $i -lt $troncs.Count; $i++) {
    $schemaContent += "| $($i+1) | $($troncs[$i]) | $($references[$i]) | (à compléter) |`n"
}

$schemaContent += @"

## 3. Schéma composite

| Champ | Type | Obl. | Tronc d'origine | Description |
| :--- | :--- | :--- | :--- | :--- |
| `id_$nomDossier` | UUID | Oui | — | Identifiant unique de l'objet composé |
| `titre` | String | Oui | entite-vie | Résumé de l'objet |
| `description` | Text | Non | entite-vie | Description détaillée |
| `statut` | Enum | Oui | entite-vie | État composite |
| `date_creation` | Date/Time | Oui | entite-vie | Date de création |
| `troncs_assembles` | JSON | Oui | — | Référence des troncs et UUIDs |
| `notes_composition` | Text | Non | — | Commentaire sur la composition |

### Exemple de `troncs_assembles` (JSON)
"@

$schemaContent += @"

```json
{
"@

for ($i = 0; $i -lt $troncs.Count; $i++) {
    $schemaContent += @"
  "$($troncs[$i])": {
    "reference": "$($references[$i])"
  }
"@
    if ($i -lt $troncs.Count - 1) {
        $schemaContent += ","
    }
    $schemaContent += "`n"
}

$schemaContent += @"
}
```

## 4. Contraintes et règles de gestion

- **Cohérence** : L'objet composé ne peut être créé que si toutes les références
  pointent vers des objets existants dans leur tronc d'origine.
- **Synchronisation** : Les modifications apportées aux objets sources doivent
  être reflétées dans l'objet composé (sauf si copié).
- **Indépendance** : La suppression d'un objet source ne supprime pas
  l'objet composé — mais marque la référence comme "brisée".

## 5. Relations

- **Basé sur les troncs** : $($troncs -join ', ')
- **Références externes** : $($references -join ', ')
- **Voir aussi** : `troncs-communs.md`

---

_généré automatiquement par compose-object.ps1 — $(Get-Date -Format "yyyy-MM-dd HH:mm")_
"@

Set-Content -Path (Join-Path $dossier "schema.md") -Value $schemaContent -Encoding UTF8

Write-Host "  ✅ Objet composé créé dans : $dossier" -ForegroundColor Green
Write-Host ""
Write-Host "  Prochaines étapes :" -ForegroundColor Cyan
Write-Host "    1. Remplir les UUIDs sources dans schema.md" -ForegroundColor Gray
Write-Host "    2. Ajouter les champs spécifiques au besoin" -ForegroundColor Gray
Write-Host "    3. Mettre à jour l'index (02-Objets-Metier/01-index/README.md)" -ForegroundColor Gray
