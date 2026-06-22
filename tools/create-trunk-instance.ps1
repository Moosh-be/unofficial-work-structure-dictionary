#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Crée une instance d'un tronc commun dans le dictionnaire d'objets métier.

.DESCRIPTION
    Ce script génère un nouvel objet métier basé sur un tronc commun existant.
    Il crée le dossier, le schema.md, et met à jour l'index.

.PARAMETER Tronc
    Nom du tronc (entite-vie, evenement, acteur, artefact, financier, gouvernance)

.PARAMETER Titre
    Titre de l'instance à créer

.PARAMETER IdCode
    Code court pour l'identifiant (ex: INC, DEC, WP)

.PARAMeter Champ
    Champs supplémentaires sous forme de hashtable

.EXAMPLE
    ./create-trunk-instance.ps1 -tronc "entite-vie" -titre "Panne BD" -idCode "INC" -champ @{severite="Critique"}

.EXAMPLE
    ./create-trunk-instance.ps1 -tronc "evenement" -titre "Gate conception" -idCode "QG"
#>

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("entite-vie", "evenement", "acteur", "artefact", "financier", "gouvernance")]
    [string]$tronc,

    [Parameter(Mandatory=$true)]
    [string]$titre,

    [Parameter(Mandatory=$true)]
    [string]$idCode,

    [Parameter(Mandatory=$false)]
    [hashtable]$champ = @{}
)

# --- Configuration ---
$BASE_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent | Split-Path -Parent
$OBJET_DIR = Join-Path $BASE_DIR "02-Objets-Metier"
$INDEX_FILE = Join-Path $OBJET_DIR "01-index\schema.md"
$TRONC_FILE = Join-Path (Join-Path $BASE_DIR "troncs") "$tronc.schema.json"

# Génération UUID
$uuid = [guid]::NewGuid().ToString()

# Nom du dossier : nn-codetitre (sans espaces)
$nomDossier = $idCode + "-" + ($titre -replace '\s+', '-' -replace '[^a-zA-Z0-9\-]', '')
$dossier = Join-Path $OBJET_DIR $nomDossier

# Tronc par défaut pour le statut
$statutsParDefaut = @{
    "entite-vie" = "Nouveau,En cours,Fermé"
    "evenement"  = "Planifié,En cours,Réalisé,Annulé"
    "acteur"     = "Actif,Inactif,Expiré"
    "artefact"   = "Brouillon,En révision,Livrée,Archivé"
    "financier"  = "Estimé,Engagé,Dépensé,Clôturé"
    "gouvernance"= "Proposé,En examen,Validé,Refusé"
}

$statuts = $statutsParDefaut[$tronc]

# --- Création du dossier ---
Write-Host "Création de l'objet tronqué : $titre" -ForegroundColor Cyan
Write-Host "  Tronc       : $tronc" -ForegroundColor Gray
Write-Host "  ID          : $uuid" -ForegroundColor Gray
Write-Host "  Dossier     : $nomDossier" -ForegroundColor Gray

New-Item -ItemType Directory -Force -Path $dossier | Out-Null

# --- Construction du schema.md ---
$schemaContent = @"
# Schema : Objet tronqué — $titre

> **Tronc utilisé :** $tronc
> **Code ID :** $idCode
> **Créé le :** $(Get-Date -Format "yyyy-MM-dd")

## 1. Présentation

Cet objet a été généré automatiquement à partir du tronc commun `"$tronc"`.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_$idCode` | UUID | Oui | Identifiant unique — $uuid |
| `titre` | String | Oui | Intitulé — $titre |
| `description` | Text | Non | Description détaillée |
| `statut` | Enum | Oui | État ($statuts) |
| `date_creation` | Date/Time | Oui | Date de création |

## 3. Champs personnalisés

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
"@

if ($champ.Count -gt 0) {
    foreach ($p in $champ.GetEnumerator()) {
        $schemaContent += @"
| `$`${p.Key}` | String | Non | ${p.Value} |

"@
    }
}
else {
    $schemaContent += @"
| (aucun) | — | — | Aucun champ personnalisé |

"@
}

$schemaContent += @"
## 4. Contraintes et règles de gestion

- **Intégrité** : Cet objet est basé sur le tronc `"$tronc"`. Voir `troncs-communs.md` pour les règles associées.
- **Statut** : Le statut ne peut évoluer que selon l'enum défini ci-dessus.

## 5. Relations

- **Basé sur le tronc** : $tronc
- **Voir aussi** : `troncs-communs.md`

---

_généré automatiquement par create-trunk-instance.ps1 — $(Get-Date -Format "yyyy-MM-dd HH:mm")_
"@

Set-Content -Path (Join-Path $dossier "schema.md") -Value $schemaContent -Encoding UTF8

# --- Mise à jour de l'index ---
$entry = "| $idCode-$nomDossier | $titre | $tronc | Objet tronqué généré — $titre |"
$indexReadme = Join-Path $OBJET_DIR "01-index\README.md"

if (Test-Path $indexReadme) {
    $content = Get-Content $indexReadme -Raw
    $newEntry = "`n| $idCode-$nomDossier | $titre | $tronc | Objet tronqué généré — $titre |"
    # Chercher le début du tableau dans le README
    if ($content -match '(?<=\| Code.*\n\|------.*\n)') {
        $content = $content -replace '(?<=\| Code.*\n\|------.*\n)', "$&$newEntry"
        Set-Content -Path $indexReadme -Value $content -Encoding UTF8
        Write-Host "  Index mis à jour ✅" -ForegroundColor Green
    }
    else {
        Write-Host "  ⚠️ Index non mis à jour — éditer manuellement $indexReadme" -ForegroundColor Yellow
    }
}
else {
    Write-Host "  ⚠️ Pas de README dans l'index — créer $indexReadme manuellement" -ForegroundColor Yellow
}

Write-Host "  ✅ Objet créé dans : $dossier" -ForegroundColor Green
