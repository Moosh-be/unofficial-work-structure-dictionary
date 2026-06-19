# Schema : Objet Dependency (OBJ-025)

## 1. Présentation

Cet objet représente une dépendance entre deux work packages ou éléments du projet. Il encode le type de lien et l'impact potentiel.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_dependency` | UUID | Oui | Identifiant unique de la dépendance. |
| `predecesseur_id` | UUID | Oui | Work package / tâche antérieur. |
| `successeur_id` | UUID | Oui | Work package / tâche suivant. |
| `type` | Enum | Oui | Type de dépendance (`FS`, `SS`, `FF`, `SF`). |
| `nature` | Enum | Oui | Type de lien (`Logique`, `Externe`, `Préférentielle`, `Interne`). |
| `lag` | Number | Non | Décalage (en jours) si applicable (positif ou négatif). |
| `statut` | Enum | Oui | État (`Actif`, `Inhibé`, `Cassé`). |
| `commentaires` | Text | Non | Notes sur la dépendance. |

## 3. Contraintes et règles de gestion

- **Circularité interdite** : Deux work packages ne peuvent pas dépendre l'un de l'autre (pas de boucle).
- **Cohérence de type** : Un lag négatif n'est valide que pour certains types de dépendance.

## 4. Relations

- **Lié à** : `OBJ-024-WorkPackages` (Les work packages liés).
- **Lié à** : `OBJ-008-Risks` (Dépendance externe = risque).
- **Lié à** : `OBJ-005-Milestones` (Impact sur les jalons).
