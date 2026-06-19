# Schema : Objet Sprint (OBJ-035)

## 1. Présentation

Cet objet représente un sprint (itération agile) du projet. Il encode les WorkPackages sélectionnés, les dates et les métriques de vélocité.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_sprint` | UUID | Oui | Identifiant unique du sprint. |
| `nom` | String | Oui | Nom du sprint (ex: Sprint 1, Sprint 2). |
| `description` | Text | Non | Description ou objectif du sprint. |
| `status` | Enum | Oui | État (`Planned`, `Active`, `Review`, `Closed`). |
| `date_debut` | Date | Oui | Date de début planifiée. |
| `date_fin` | Date | Oui | Date de fin planifiée. |
| `duree_jours` | Integer | Oui | Durée en jours ouvrés. |
| `objectif` | Text | Non | Objectif du sprint. |
| `velocite_planifiee` | Number | Non | Points planifiés. |
| `velocite_reelle` | Number | Non | Points réalisés. |
| `is_completed` | Boolean | Non | Sprint complètement terminé. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. WorkPackages du sprint (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `workpackage_ids` | UUID[] | Oui | Liste des WorkPackages sélectionnés. |

## 4. Métriques de burndown (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `burndown_data` | JSON | Non | Données de progression (jour par jour). |

### Exemple de burndown

```json
{
  "jour_1": 40,
  "jour_2": 35,
  "jour_3": 30,
  ...
}
```

## 5. Contraintes et règles de gestion

- **Durée valide** : `duree_jours` ≥ 5 et ≤ 30.
- **Dates cohérentes** : `date_debut` < `date_fin`.
- **Non chevauchement** : Deux sprints `Active` ne peuvent pas chevaucher.

## 6. Relations

- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages du sprint).
- **Lié à** : `OBJ-027-TimeEntries` (Temps passé pendant le sprint).
- **Lié à** : `OBJ-005-Milestones` (Sprint comme jalon).
- **Lié à** : `OBJ-024-WBSNode` (Sprint comme lot WBS).
