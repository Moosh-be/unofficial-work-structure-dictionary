# Schema : Objet Group (OBJ-030)

## 1. Présentation

Cet objet représente un groupe de travail ou une équipe du projet. Il encode les permissions et les membres du groupe.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_group` | UUID | Oui | Identifiant unique du groupe. |
| `nom` | String | Oui | Nom du groupe. |
| `description` | Text | Non | Description du rôle du groupe. |
| `type` | Enum | Oui | Type (`System`, `Custom`). |
| `is_public` | Boolean | Non | Groupe visible par tous les membres. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Permissions du groupe (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `permissions` | JSON | Oui | Permissions du groupe (voir structure ci-dessous). |

### Structure des permissions

```json
{
  "view_work_packages": true,
  "edit_work_packages": true,
  "add_work_packages": true,
  "delete_work_packages": false,
  "manage_projects": false,
  "manage_members": false,
  "manage_workflows": false,
  "manage_custom_fields": false,
  "manage_time_entries": true
}
```

## 4. Contraintes et règles de gestion

- **Unicité** : Le `nom` doit être unique au sein d'un projet.
- **Groups système** : Les permissions des groupes `System` sont prédéfinies.

## 5. Relations

- **Lié à** : `OBJ-004-Individus` (Membres du groupe).
- **Lié à** : `OBJ-026-WorkPackage` (Permissions sur les WorkPackages).
- **Lié à** : `OBJ-007-Stakeholders` (Accès des stakeholders).
