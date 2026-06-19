# Schema : Objet Type (OBJ-031)

## 1. Présentation

Cet objet représente un type de WorkPackage. Il encode la définition, le workflow et les champs personnalisés associés.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_type` | UUID | Oui | Identifiant unique du type. |
| `nom` | String | Oui | Nom du type. |
| `description` | Text | Non | Description du type. |
| `is_in_gantt` | Boolean | Non | Visible dans le diagramme de Gantt. |
| `is_in_progress` | Boolean | Non | Apparaît dans le suivi de progression. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Workflow associé (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `workflow` | JSON | Oui | Définition du workflow de statuts. |

### Exemple de workflow

```json
{
  "statuts": ["New", "In Progress", "Pending", "Closed"],
  "transitions": [
    {"from": "New", "to": "In Progress", "role": "Developer"},
    {"from": "In Progress", "to": "Closed", "role": "Developer"},
    {"from": "In Progress", "to": "Pending", "role": "Manager"},
    {"from": "Pending", "to": "In Progress", "role": "Developer"}
  ]
}
```

## 4. Champs personnalisés (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `custom_fields` | JSON | Non | Champs spécifiques à ce type. |

## 5. Contraintes et règles de gestion

- **Unicité** : Le `nom` doit être unique au sein d'un projet.
- **Workflow valide** : Toutes les transitions doivent pointer vers des statuts existants.

## 6. Relations

- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages de ce type).
- **Lié à** : `OBJ-032-Files` (Documentation du type).
