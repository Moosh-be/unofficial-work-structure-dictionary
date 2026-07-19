# Schema : Objet WorkPackage (OBJ-026)

## 1. Présentation

Cet objet représente l'entité universelle de travail d'OpenProject. Il unifie tous les types d'unités de travail (tâches, bugs, besoins, jalons, etc.) sous un même modèle.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_workpackage` | UUID | Oui | Identifiant unique du WorkPackage. |
| `nom` | String | Oui | Nom du WorkPackage. |
| `subject` | String | Non | Titre/sujet court (alias de nom). |
| `description` | Text | Non | Champs descriptif détaillé. |
| `type_wp` | Enum | Oui | Type de workpackage (`Programme`, `Projet`, `Produit`, `Domaine`, `Epic`, `Feature`, `Tâche`, `Sous-tâche`, `Bug`, `Requirement`, `Milestone`, `Phase`). |
| `wp_parent` | UUID | Non | WorkPackage parent (reporting). |
| `couleur` | String | Non | Couleur associée (hex: `#FF5733`). |
| `responsable_id` | UUID | Oui | Responsable du WorkPackage (OBJ-004). |
| `status` | Enum | Oui | État (`New`, `In Progress`, `Pending`, `Closed`, `Rejected`, `Timed Out`). |
| `priority` | Enum | Oui | Priorité (`Low`, `Medium`, `High`, `Very High`, `Immediate`). |
| `category` | String | Non | Catégorie de classification. |
| `assigned_to` | UUID | Non | Personne assignée. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |
| `done_by` | Date/Time | Non | Date de clôture. |
| `scheduled_start` | Date | Non | Date de début planifiée. |
| `scheduled_end` | Date | Non | Date de fin planifiée. |
| `done` | Date/Time | Non | Date effective de clôture. |
| `budget` | Number | Non | Budget estimé (coût). |
| `auto_estimate` | Boolean | Non | Estimation automatique activée. |
| `freeze_dates` | Boolean | Non | Dates figées (empêche les modifications). |
| `lock_version` | Integer | Non | Version pour verrouillage optimiste. |
| `identifier` | String | Non | Identifiant court (ex: WP-123). |

## 3. Champs personnalisés

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `custom_fields` | JSON | Non | Champs personnalisés dynamiques. |

## 4. Contraintes et règles de gestion

- **Type cohérent** : Le `type` détermine les champs spécifiques disponibles.
- **Hiérarchie** : `reporting_to` doit pointer vers un WorkPackage de niveau supérieur ou null.
- **Dates valides** : `scheduled_start` ≤ `scheduled_end` si les deux sont renseignées.
- **Verrouillage** : Un WorkPackage `Closed` ne peut être modifié que si `freeze_dates` = false.

## 5. Relations

- **Lié à** : `OBJ-004-Individus` (Personne assignée).
- **Lié à** : `OBJ-015-Assignation` (Historique des assignations).
- **Lié à** : `OBJ-027-TimeEntries` (Temps passés).
- **Lié à** : `OBJ-028-Versions` (Versions associées).
- **Lié à** : `OBJ-032-Files` (Fichiers joints).
- **Lié à** : `OBJ-025-Dependencies` (Relations avec d'autres WorkPackages).
- **Lié à** : `OBJ-003-Decisions` (Décisions liées).
- **Lié à** : `OBJ-024-WBSNode` (Nœud WBS parent).
- **Lié à** : `OBJ-026-WorkPackage` (Relations internes entre WorkPackages).
