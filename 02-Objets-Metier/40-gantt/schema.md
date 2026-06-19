# Schema : Objet Gantt (OBJ-040)

## 1. Présentation

Cet objet représente la vue planning Gantt du projet. Il encode les configurations, les dépendances et la visualisation temporelle.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_gantt` | UUID | Oui | Identifiant unique de la vue Gantt. |
| `nom` | String | Oui | Nom de la vue Gantt. |
| `projet_id` | UUID | Oui | Projet associé. |
| `date_debut` | Date | Oui | Date de début du calendrier. |
| `date_fin` | Date | Oui | Date de fin du calendrier. |
| `zoom` | Enum | Oui | Niveau de zoom (`Mois`, `Semaine`, `Jour`). |
| `afficher_critical_path` | Boolean | Oui | Afficher le chemin critique. |
| `afficher_floats` | Boolean | Oui | Afficher les marges. |
| `createur_id` | UUID | Oui | Personne ayant créé la vue. |
| `est_partagee` | Boolean | Oui | Vue partagée avec le projet. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Configuration de la vue (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `configuration` | JSON | Oui | Paramètres d'affichage. |

### Exemple de configuration

```json
{
  "workpackage_types_visible": ["Task", "Milestone", "Phase"],
  "group_by": "wbs_node",
  "columns": ["subject", "start", "end", "progress", "assigned_to"],
  "color_by": "status",
  "show_dependencies": true,
  "show_critical_path": true,
  "show_assignments": true
}
```

## 4. Contraintes et règles de gestion

- **Dates valides** : `date_debut` < `date_fin`.
- **Projet actif** : La vue Gantt n'est possible que pour un projet `Active`.

## 5. Relations

- **Lié à** : `OBJ-036-Project` (Le projet).
- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages affichés).
- **Lié à** : `OBJ-025-Dependencies` (Dépendances affichées).
- **Lié à** : `OBJ-005-Milestones` (Jalons affichés).
