# Spécification — Project (OBJ-036)
**Contexte :** Moosh
**Version :** 1.0
**Date :** 2026-07-19

## Champ | Type | Obligatoire | Contrainte | Description | Lien | Source
--------|------|-------------|------------|-------------|------|------
`id_project` | UUID | Oui | Format UUID v4, unique au sein du référentiel | Identifiant unique du projet. Généré automatiquement lors de la création. | — | Moosh §1.0
`nom` | String | Oui | Max 200 caractères, unique par portfolio/racine | Nom court du projet. Doit être suffisamment descriptif pour l'identification. | — | PM² §4.2.1
`description` | Text | Non | Max 10000 caractères | Description détaillée du projet. Peut inclure du Markdown. | — | PM² §4.2.2
`status` | Enum | Oui | [Draft, Active, On Hold, Closed, Archived] | État courant du projet. Contrôle le cycle de vie. | — | ISO 21502 §6.3
`type` | Enum | Oui | [Projet, Programme, Portfolio] | Nature de l'entité. Détermine la granularité et les relations autorisées. | — | PM² §4.2.3
`parent_id` | UUID | Non | Null si racine, sinon doit pointer vers un objet OBJ-036 existant | Projet parent dans la hiérarchie. Null si ce projet est à la racine. | OBJ-036 (auto-référence) | PM² §4.2.4
`responsable_id` | UUID | Oui | Doit pointer vers un objet OBJ-004 valide | Personne responsable (Project Manager). | OBJ-004 | PM² §4.2.5
`date_debut` | Date | Non | Format ISO 8601 (YYYY-MM-DD) | Date de début planifiée. Peut être renseignée a posteriori. | — | PM² §4.2.6
`date_fin` | Date | Non | Format ISO 8601, doit être >= date_debut si renseignée | Date de fin planifiée. Peuvent être mises à jour. | — | PM² §4.2.7
`budget_total` | Number | Non | > 0 si renseigné, précision 2 décimales | Budget prévisionnel total alloué au projet. | OBJ-009 | PM² §4.2.8
`devise` | String | Non | Code ISO 4217 (EUR, USD, GBP, ...) | Devise du budget. Par défaut EUR. | — | ISO 4217
`is_public` | Boolean | Non | — | Indique si le projet est visible publiquement. Par défaut false. | — | Moosh §1.0
`created_on` | DateTime | Oui | Format ISO 8601 avec timezone | Date et heure de création du projet. Généré automatiquement. | — | PM² §4.2.9
`updated_on` | DateTime | Oui | Format ISO 8601 avec timezone, >= created_on | Date et heure de la dernière modification. Mis à jour automatiquement. | — | PM² §4.2.10

## Configuration du projet (objet JSON imbriqué)

| Champ | Type | Obligatoire | Contrainte | Description |
|-------|------|-------------|------------|-------------|
| `config.work_package_types` | Array<String> | Oui | Au moins 1 élément | Types de work packages autorisés dans ce projet. Ex: ["Task", "Milestone", "Requirement", "Bug"] |
| `config.workflows` | Object | Non | Clés = types de WP, valeurs = enums de statuts | Définition des workflows par type de work package. |
| `config.custom_fields` | Array<String> | Non | — | Liste des noms de champs personnalisés disponibles. |
| `config.gantt_enabled` | Boolean | Non | Défaut: true | Active/désactive la vue Gantt pour ce projet. |
| `config.time_tracking_enabled` | Boolean | Non | Défaut: true | Active le suivi du temps. |
| `config.cost_tracking_enabled` | Boolean | Non | Défaut: true | Active le suivi des coûts. |
| `config.news_enabled` | Boolean | Non | Défaut: true | Active les news/annonces. |
| `config.sprint_enabled` | Boolean | Non | Défaut: false | Active le support des sprints. |

### Exemple de configuration

```json
{
  "work_package_types": ["Task", "Milestone", "Requirement", "Bug"],
  "workflows": {
    "Task": ["New", "In Progress", "Closed"],
    "Bug": ["New", "In Progress", "Fixed", "Verified", "Closed"]
  },
  "custom_fields": ["priority", "category", "effort"],
  "gantt_enabled": true,
  "time_tracking_enabled": true,
  "cost_tracking_enabled": true,
  "news_enabled": true,
  "sprint_enabled": false
}
```

## Santé du projet (objet JSON imbriqué, optionnel)

| Champ | Type | Obligatoire | Contrainte | Description |
|-------|------|-------------|------------|-------------|
| `health.spend_variance_pct` | Number | Non | [-100, +100], 1 décimale | Écart de dépense en pourcentage. |
| `health.schedule_variance_pct` | Number | Non | [-100, +100], 1 décimale | Écart de planning en pourcentage. |
| `health.open_risks` | Integer | Non | >= 0 | Nombre de risques ouverts. |
| `health.closed_work_packages_pct` | Number | Non | [0, 100], 1 décimale | Pourcentage de work packages fermés. |
| `health.team_satisfaction` | Number | Non | [1, 5], 1 décimale | Satisfaction de l'équipe (note sur 5). |

### Exemple de santé

```json
{
  "spend_variance_pct": 5.2,
  "schedule_variance_pct": -3.1,
  "open_risks": 12,
  "closed_work_packages_pct": 67.5,
  "team_satisfaction": 4.2
}
```

## Contraintes de gestion

1. **Unicité** : Le `nom` doit être unique au sein d'un portfolio ou racine.
2. **Hiérarchie valide** : Pas de boucle (un projet ne peut être son propre ancêtre).
3. **Budget cohérent** : `budget_total` > 0 si renseigné.
4. **Statut irréversible** : `Archived` ne peut être révoqué.
5. **Cohérence des dates** : `date_fin` >= `date_debut` si les deux sont renseignées.

## Relations

| Objet lié | Code | Rôle | Cardinalité |
|-----------|------|------|-------------|
| Individus | OBJ-004 | Responsable du projet | 1:1 |
| Groups | OBJ-030 | Groupes du projet | 1:N |
| Types | OBJ-031 | Types de work packages disponibles | 1:N |
| WorkPackage | OBJ-026 | WorkPackages du projet | 1:N |
| Budget | OBJ-009 | Budgets du projet | 1:N |
| Members | OBJ-037 | Membres du projet | 1:N |
| Risks | OBJ-008 | Risques du projet (via parent_id) | 1:N |

## Sources et références normatives

- **PM²** — Project lifecycle européen, §4.2.1 à §4.2.10
- **ISO 21502** — Project lifecycle et closure, §6.3
- **PMBOK® Guide** — Project integration management
- **PRINCE2** — Project lifecycle et stages
- **ISO 4217** — Codes des devises
