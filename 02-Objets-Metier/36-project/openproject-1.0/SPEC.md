# Spécification — Project (OBJ-036)
**Contexte :** OpenProject
**Version :** 1.0
**Date :** 2026-07-19

## Champ | Type | Obligatoire | Contrainte | Description | Lien | Source
--------|------|-------------|------------|-------------|------|------
`id_project` | UUID | Oui | Format UUID v4 | Identifiant unique du projet. | — | OpenProject
`nom` | String | Oui | Max 255 caractères | Nom du projet. Unique au sein du Portfolio parent. | — | OpenProject
`description` | Text | Non | Max 10000 caractères | Description détaillée. | — | OpenProject
`status` | Enum | Oui | [New, In Progress, Finished, Suspended] | État natif OpenProject. | — | OpenProject §3.1
`type` | Enum | Oui | [Projet, Portfolio, Sous-projet] | Type hiérarchique. | — | OpenProject
`parent_id` | UUID | Non | Null si Portfolio racine | Projet/Portfolio parent. | OBJ-036 | OpenProject §3.1
`responsable_id` | UUID | Oui | Doit pointer vers un objet OBJ-004 valide | Project Manager. | OBJ-004 | OpenProject
`date_debut` | Date | Non | Format ISO 8601 | Date de début. | — | OpenProject
`date_fin` | Date | Non | Format ISO 8601, >= date_debut | Date de fin. | — | OpenProject
`budget_total` | Number | Non | >= 0, précision 2 décimales | Budget total (roll-up des WorkPackages). | OBJ-009 | OpenProject
`devise` | String | Non | Code ISO 4217 | Devise. | — | ISO 4217
`created_on` | DateTime | Oui | Format ISO 8601 avec timezone | Date de création. | — | OpenProject
`updated_on` | DateTime | Oui | Format ISO 8601 avec timezone | Dernière modification. | — | OpenProject

## Configuration OpenProject

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `config.work_package_types` | Array<String> | Oui | Types disponibles (Task, Milestone, Phase, etc.) |
| `config.workflows` | Object | Non | Workflows par type (New → In Progress → Done) |
| `config.custom_fields` | Array<String> | Non | Champs personnalisés |
| `config.gantt_enabled` | Boolean | Non | Vue Gantt activée |
| `config.time_tracking_enabled` | Boolean | Non | Suivi du temps activé |

## Contraintes de gestion

1. **Hiérarchie native** : Pas de boucle (Portfolio → Projet → Sous-projet).
2. **Unicité** : Le `nom` est unique au sein d'un Portfolio.
3. **Héritage** : Les configurations se propagent du parent vers l'enfant.

## Relations

| Objet lié | Code | Rôle | Cardinalité |
|-----------|------|------|-------------|
| Individus | OBJ-004 | Project Manager | 1:1 |
| Groups | OBJ-030 | Groupes OpenProject | 1:N |
| WorkPackages | OBJ-026 | WorkPackages | 1:N |

## Sources

- **OpenProject** — Project entity, hierarchy, configuration
- **OpenProject** — WorkPackage types, custom fields
