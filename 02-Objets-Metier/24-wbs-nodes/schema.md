# Schema : Objet WBS Node (OBJ-024)

## 1. Présentation

Cet objet représente un nœud dans la structure de répartition (WBS). Il encode la hiérarchie, les estimations et l'avancement planifié.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_wbs_node` | UUID | Oui | Identifiant unique du nœud WBS. |
| `titre` | String | Oui | Intitulé du lot de travail. |
| `description` | Text | Oui | Description des travaux à effectuer. |
| `code_wbs` | String | Oui | Code WBS (ex: 1.2.3.1). |
| `niveau` | Integer | Oui | Niveau dans la WBS (0 = projet). |
| `parent_id` | UUID | Non | Nœud WBS parent (null = racine). |
| `type_nœud` | Enum | Non | Type (`Projet`, `Phase`, `Lot principal`, `Lot secondaire`, `Nœud élémentaire`). |
| `delai_estime` | Number | Oui | Durée estimée (en jours ouvrés). |
| `cout_estime` | Number | Non | Coût estimé du lot. |
| `avancement_planifiee` | Number | Non | Pourcentage planifié. |
| `avancement_reelle` | Number | Non | Pourcentage d'avancement réel (roll-up des fils). |
| `statut` | Enum | Oui | État (`Planifié`, `En cours`, `Terminé`, `Annulé`). |
| `date_debut_prevue` | Date | Non | Date de début planifiée. |
| `date_fin_prevue` | Date | Non | Date de fin planifiée. |

## 3. Contraintes et règles de gestion

- **Hiérarchie valide** : Le `parent_id` doit pointer vers un nœud de niveau inférieur ou null.
- **Cohérence** : `avancement_reelle` = roll-up automatique des nœuds fils.
- **Cohérence** : `delai_estime` ≥ 1.

## 4. Relations

- **Lié à** : `OBJ-015-Assignation` (Responsable du nœud).
- **Lié à** : `OBJ-006-Resources` (Ressources planifiées).
- **Lié à** : `OBJ-009-Budgets` (Coûts planifiés).
- **Lié à** : `OBJ-025-Dependencies` (Dépendances entre nœuds WBS).
- **Lié à** : `OBJ-005-Milestones` (Jalons associés).
- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages liés au nœud WBS).
