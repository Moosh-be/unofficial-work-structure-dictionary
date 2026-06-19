# Schema : Objet Query (OBJ-039)

## 1. Présentation

Cet objet représente une requête sauvegardée. Il encode les critères de filtrage, le tri, les colonnes et le mode d'affichage.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_query` | UUID | Oui | Identifiant unique de la requête. |
| `nom` | String | Oui | Nom de la requête. |
| `description` | Text | Non | Description ou contexte de la requête. |
| `createur_id` | UUID | Oui | Personne ayant créé la requête. |
| `est_partagee` | Boolean | Oui | Requète partagée avec le projet. |
| `est_publique` | Boolean | Non | Visible par les Guests (lecture seule). |
| `type_affichage` | Enum | Oui | Mode d'affichage (`Liste`, `Kanban`, `Gantt`, `Calendrier`, `Tableau`). |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Critères de la requête (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `filters` | JSON | Oui | Critères de filtrage. |
| `sort_order` | JSON | Oui | Ordre de tri. |
| `columns` | JSON | Oui | Colonnes affichées. |
| `group_by` | JSON | Non | Groupement. |

### Exemple de critères

```json
{
  "filters": {
    "status": ["New", "In Progress"],
    "type": ["Bug", "Task"],
    "priority": ["High", "Very High"],
    "assigned_to": ["user-123", "user-456"],
    "date_range": {"from": "2026-06-01", "to": "2026-06-30"}
  },
  "sort_order": {
    "field": "priority",
    "direction": "desc"
  },
  "columns": ["subject", "status", "priority", "assigned_to", "scheduled_end"],
  "group_by": "status"
}
```

## 4. Contraintes et règles de gestion

- **Noms uniques** : `nom` doit être unique pour le créateur (partagées peuvent avoir des doublons).
- **Filtres valides** : Les valeurs de filtres doivent correspondre aux enums du projet.

## 5. Relations

- **Lié à** : `OBJ-004-Individus` (Le créateur).
- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages filtrés par la requête).
