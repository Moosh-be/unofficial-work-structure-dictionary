# Schema : Objet Project (OBJ-036)

## 1. Présentation

Cet objet représente le projet racine. Il encode les métadonnées, la hiérarchie, la configuration et la santé du projet.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_project` | UUID | Oui | Identifiant unique du projet. |
| `nom` | String | Oui | Nom du projet. |
| `description` | Text | Non | Description détaillée. |
| `status` | Enum | Oui | État (`Draft`, `Active`, `On Hold`, `Closed`, `Archived`). |
| `type` | Enum | Oui | Type (`Projet`, `Programme`, `Portfolio`). |
| `parent_id` | UUID | Non | Projet parent (null si racine). |
| `responsable_id` | UUID | Oui | Personne responsable (Project Manager). |
| `date_debut` | Date | Non | Date de début planifiée. |
| `date_fin` | Date | Non | Date de fin planifiée. |
| `budget_total` | Number | Non | Budget prévisionnel total. |
| `devise` | String | Non | Devise du budget (EUR, USD, etc.). |
| `is_public` | Boolean | Non | Projet visible publiquement. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Configuration du projet (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `config` | JSON | Oui | Configuration spécifique du projet. |

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

## 4. Santé du projet (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `health` | JSON | Non | Indicateurs de santé du projet. |

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

## 5. Contraintes et règles de gestion

- **Unicité** : Le `nom` doit être unique au sein d'un portfolio ou racine.
- **Hiérarchie valide** : Pas de boucle (un projet ne peut être son propre ancêtre).
- **Budget cohérent** : `budget_total` > 0 si renseigné.

## 6. Relations

- **Lié à** : `OBJ-004-Individus` (Responsable du projet).
- **Lié à** : `OBJ-030-Groups` (Groupes du projet).
- **Lié à** : `OBJ-031-Types` (Types disponibles).
- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages du projet).
- **Lié à** : `OBJ-009-Budgets` (Budgets du projet).
- **Lié à** : `OBJ-037-Members` (Membres du projet).
