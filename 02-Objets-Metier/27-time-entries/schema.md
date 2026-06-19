# Schema : Objet Time Entry (OBJ-027)

## 1. Présentation

Cet objet représente une saisie de temps passé sur un WorkPackage. Il encode l'identité du travailleur, la durée, la date et la nature du travail effectué.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_time_entry` | UUID | Oui | Identifiant unique de la saisie de temps. |
| `workpackage_id` | UUID | Oui | WorkPackage concerné. |
| `user_id` | UUID | Oui | Personne ayant effectué le travail. |
| `hours` | Number | Oui | Durée saisie (en heures). |
| `activity` | Enum | Oui | Type d'activité (`Development`, `Bugfix`, `Testing`, `Meeting`, `Planning`, `Documentation`, `Other`). |
| `comment` | Text | Non | Description du travail effectué. |
| `spent_on` | Date | Oui | Date du travail effectué. |
| `created_on` | Date/Time | Oui | Date de création de la saisie. |
| `updated_on` | Date/Time | Oui | Dernière modification. |
| `is_billable` | Boolean | Non | Temps facturable (si applicable). |
| `cost_rate` | Number | Non | Taux horaire appliqué. |

## 3. Contraintes et règles de gestion

- **Durée positive** : `hours` doit être > 0.
- **Date valide** : `spent_on` ne peut pas être dans le futur.
- **Cohérence** : `user_id` doit être membre du projet.

## 4. Relations

- **Lié à** : `OBJ-026-WorkPackage` (Le WorkPackage sur lequel le temps a été passé).
- **Lié à** : `OBJ-004-Individus` (La personne).
- **Lié à** : `OBJ-009-Budgets` (Coûts réels).
- **Lié à** : `OBJ-024-WBSNode` (Temps agrégé par nœud WBS).
