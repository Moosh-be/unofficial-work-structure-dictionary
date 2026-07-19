# Spécification — Project (OBJ-036)
**Contexte :** PM²
**Version :** 1.0
**Date :** 2026-07-19

## Champ | Type | Obligatoire | Contrainte | Description | Lien | Source
--------|------|-------------|------------|-------------|------|------
`id_project` | UUID | Oui | Format UUID v4 | Identifiant unique du projet. Format PROJ-YYYY-NNN. | — | PM² §4.2
`nom` | String | Oui | Max 200 caractères | Nom du projet. Unique au sein du programme/portefeuille. | — | PM² §4.2.1
`description` | Text | Oui | Max 10000 caractères | Description détaillée. Inclut le contexte et les objectifs. | — | PM² §4.2.2
`status` | Enum | Oui | [Initiation, Planification, Exécution, Clôture] | Phase du cycle de vie PM². | — | PM² §4.3
`type` | Enum | Oui | [Projet, Programme, Portefeuille] | Type hiérarchique PM². | — | PM² §4.2.3
`parent_id` | UUID | Non | Null si Portefeuille racine | Programme/Portefeuille parent. | OBJ-036 | PM²
`responsable_id` | UUID | Oui | Doit pointer vers un objet OBJ-004 valide | Project Manager nommé dans le Charter. | OBJ-004 | PM² §4.2.5
`date_debut` | Date | Oui | Format ISO 8601 | Date de début officiellement actée (signée dans le Charter). | — | PM² §4.2.6
`date_fin` | Date | Oui | Format ISO 8601, >= date_debut | Date de fin prévue dans le Charter. | — | PM² §4.2.7
`budget_total` | Number | Oui | > 0, précision 2 décimales | Budget alloué (ligne budgétaire dédiée). | OBJ-009 | PM² §4.2.8
`devise` | String | Oui | Code ISO 4217 | Devise du budget. | — | ISO 4217
`charter_signed` | Boolean | Oui | — | Indique si le Project Charter a été signé. | — | PM² §4.4
`charter_date` | Date | Non | Format ISO 8601 | Date de signature du Charter. | — | PM² §4.4.1
`created_on` | DateTime | Oui | Format ISO 8601 avec timezone | Date de création dans le registre. | — | PM²
`updated_on` | DateTime | Oui | Format ISO 8601 avec timezone | Dernière modification. | — | PM²

## Cycle de vie PM²

| Phase | Description | Artefacts produits |
|-------|-------------|-------------------|
| **Initiation** | Définition du Charter, nomination du PM | Project Charter, Stakeholder Register |
| **Planification** | Élaboration du plan de projet | Project Plan, WBS, Budget Plan |
| **Exécution** | Mise en œuvre des travaux | Reports périodiques, Change Requests |
| **Clôture** | Finalisation et archivage | Project Closure Report, Lessons Learned |

## Contraintes de gestion

1. **Charter obligatoire** : Le projet ne peut entrer en Exécution sans Charter signé.
2. **Budget obligatoire** : La ligne budgétaire est formalisée dans le Charter.
3. **Hiérarchie formelle** : Portefeuille → Programme → Projet (pas de sous-projets).
4. **Reports périodiques** : Les reports de pilotage sont obligatoires à chaque phase.

## Relations

| Objet lié | Code | Rôle | Cardinalité |
|-----------|------|------|-------------|
| Individus | OBJ-004 | PM nommé dans le Charter | 1:1 |
| Budgets | OBJ-009 | Ligne budgétaire dédiée | 1:1 |
| Decisions | OBJ-003 | Décisions du projet | 1:N |
| WorkPackages | OBJ-026 | Unités de travail | 1:N |
| Stakeholders | OBJ-007 | Parties prenantes | 1:N |

## Sources

- **PM²** — Project Charter, §4.2.1 à §4.2.10
- **PM²** — Cycle de vie, §4.3
- **PM²** — Project Closure, §4.4
