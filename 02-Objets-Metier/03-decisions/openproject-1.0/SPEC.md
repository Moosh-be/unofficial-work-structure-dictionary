# Spécification — Décisions (OBJ-003)
**Contexte :** OpenProject
**Version :** 1.0
**Date :** 2026-07-19

## Champ | Type | Obligatoire | Contrainte | Description | Lien | Source
--------|------|-------------|------------|-------------|------|------
`id_decision` | UUID | Oui | Format UUID v4 | Identifiant unique de la décision. Généré automatiquement. | — | OpenProject
`titre` | String | Oui | Max 255 caractères | Intitulé court de la décision. Affiché en vue liste et Gantt. | — | OpenProject
`description` | Text | Non | Max 10000 caractères | Description détaillée. Peut inclure Markdown. | — | OpenProject
`statut` | Enum | Oui | [New, In Review, Approved, Rejected, Postponed] | État du workflow de la décision. | — | OpenProject §4.2
`type_decision` | Enum | Oui | [Stratégique, Tactique, Opérationnelle, Technique, Gouvernance] | Nature de la décision. Détermine le workflow et les approbations requises. | — | OpenProject
`decisionnaire` | UUID | Oui | Doit pointer vers un objet OBJ-004 valide | Personne ou instance qui prend la décision (ex: COPIL, Sponsor, PM). | OBJ-004 | OpenProject
`justification` | Text | Non | Max 5000 caractères | Raisonnement de la décision. Rempli après approbation. | — | OpenProject
`impact_cout` | Number | Non | >= 0, précision 2 décimales | Impact budgétaire estimé de la décision. | OBJ-009 | PM²
`impact_delai` | Number | Non | >= 0, précision 2 décimales | Impact sur le planning en jours ou semaines. | OBJ-014 | PM²
`date_decision` | Date | Oui | Format ISO 8601 | Date de la décision effective (différente de la création). | — | OpenProject
`date_creation` | DateTime | Oui | Format ISO 8601 avec timezone | Date de création de l'entrée décision. | — | OpenProject
`parent_id` | UUID | Non | Null si racine | Projet parent dans l'arborescence OpenProject. | OBJ-036 | OpenProject §3.1

## Workflow OpenProject

| Phase | Transition | Condition |
|-------|------------|-----------|
| **New** | → In Review | Le demandeur soumet la décision |
| **In Review** | → Approved / Rejected / Postponed | Le decisionnaire examine |
| **Approved** | → Clôturé | La décision est actée |
| **Rejected** | → Clôturé | La décision est refusée |
| **Postponed** | → In Review / Clôturé | Reporté à une prochaine instance |

## Contraintes de gestion

1. **Workflow obligatoire** : Le statut suit strictement le workflow OpenProject.
2. **Justification conditionnelle** : Obligatoire si `type_decision` = Stratégique ou Tactique.
3. **Lien projet** : Chaque décision est rattachée à un projet via l'arborescence OpenProject.
4. **Immuabilité** : Une fois Approved, seul le commentaire peut être ajouté.

## Relations

| Objet lié | Code | Rôle | Cardinalité |
|-----------|------|------|-------------|
| Individus | OBJ-004 | Decisionnaire | 1:1 |
| Budgets | OBJ-009 | Impact coût | 1:1 |
| Calendrier | OBJ-014 | Impact délai | 1:1 |
| Project | OBJ-036 | Projet parent | 1:1 |

## Sources

- **OpenProject** — WorkPackage types, custom fields, workflow
- **PM²** — Impact évaluation (§5.3)
