# Changelog (OBJ-048)

Un Changelog est une entrée d'historique qui trace les modifications apportées à un élément de configuration, un document ou tout autre artefact versionné.

---

## Rôle

Le Changelog permet de :

- **tracer** les modifications successives d'un artefact (code, document, CI, configuration)
- **contextualiser** chaque changement : pourquoi, quoi, qui, quand
- **faciliter** la traçabilité en remontant à l'état antérieur d'un artefact
- **documenter** les changements critiques (version majeure, breaking change)

---

## Classification

Les types de changement :

- **Ajout** — Nouvel artefact ou nouvelle version
- **Modification** — Changement mineur (typo, ajustement)
- **Mise à jour** — Changement majeur (fonctionnalité, breaking change)
- **Suppression** — Retrait d'un artefact ou d'une version
- **Baselining** — Gel d'une version de référence

---

## Principe

> Un changelog sans contexte est une note sans histoire.

---

## Normes existantes

- **ITIL 4** — Change enablement et traçabilité des changements
- **ISO 9001** — Maîtrise des documents modifiés
- **Semantic Versioning (SemVer)** — Format de version et changelog (keep a changelog)

---

## Outils connus

- **Jira Changelog** — Historique complet des changements d'issues
- **Azure DevOps — Changesets** — Versioning des fichiers et CIs
- **Git Changelog** — Génération automatique depuis les commits
