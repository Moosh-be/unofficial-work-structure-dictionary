# Spécification — Risks (OBJ-008)
**Contexte :** OpenProject
**Version :** 1.0
**Date :** 2026-07-19

## Champ | Type | Obligatoire | Contrainte | Description | Lien | Source
--------|------|-------------|------------|-------------|------|------
`id_risk` | UUID | Oui | Format UUID v4 | Identifiant unique du risque. | — | OpenProject
`titre` | String | Oui | Max 255 caractères | Intitulé court du risque. | — | OpenProject
`description` | Text | Oui | Max 10000 caractères | Description détaillée du risque. | — | OpenProject
`priorite` | Enum | Oui | [High, Medium, Low] | Niveau de priorité du risque. Équivalent de score. | — | OpenProject
`categorie` | Enum | Oui | [Technique, Organisationnelle, Financière, Externe, Humaine] | Type de risque. Configurable par projet. | — | OpenProject
`statut` | Enum | Oui | [Open, In Progress, Closed] | État natif OpenProject. | — | OpenProject §3.1
`plan_reponse` | Enum | Non | [Eviter, Atténuer, Transférer, Accepter] | Stratégie de réponse. | — | PM²
`responsable` | UUID | Oui | Doit pointer vers un objet OBJ-004 valide | Personne responsable du suivi du risque. | OBJ-004 | OpenProject
`date_creation` | DateTime | Oui | Format ISO 8601 avec timezone | Date de création. | — | OpenProject
`date_echeance` | Date | Non | Format ISO 8601 | Date butoir de suivi du risque. | OBJ-014 | OpenProject
`parent_id` | UUID | Oui | Doit pointer vers un objet OBJ-036 valide | Projet parent dans l'arborescence OpenProject. | OBJ-036 | OpenProject §3.1

## Workflow OpenProject

| Phase | Description | Transition autorisée |
|-------|-------------|---------------------|
| **Open** | Risque identifié, en cours de traitement | → In Progress, → Closed |
| **In Progress** | Actions de mitigation en cours | → Open, → Closed |
| **Closed** | Risque clôturé (réalisé, inhibé ou traité) | Aucune |

## Contraintes de gestion

1. **Priorité automatique** : La priorité du WorkPackage reflète le niveau de risque.
2. **Actions enfants** : Les actions de mitigation sont des WorkPackages enfants liés.
3. **Hiérarchie native** : Chaque risque est rattaché à un projet via l'arborescence OpenProject.

## Relations

| Objet lié | Code | Rôle | Cardinalité |
|-----------|------|------|-------------|
| Individus | OBJ-004 | Responsable du risque | 1:1 |
| Project | OBJ-036 | Projet parent | 1:1 |

## Sources

- **OpenProject** — WorkPackage Risk, custom fields, workflow
- **PM²** — Risk management, §5.2
