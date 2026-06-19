# Schema : Objet Member (OBJ-037)

## 1. Présentation

Cet objet représente un membre interne du projet. Il encode l'appartenance, le rôle et les permissions du membre.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_member` | UUID | Oui | Identifiant unique du membre. |
| `user_id` | UUID | Oui | Référence vers l'individu (OBJ-004). |
| `project_id` | UUID | Oui | Référence vers le projet. |
| `role` | Enum | Oui | Rôle dans le projet (`Admin`, `Manager`, `Developer`, `Tester`, `Observer`, `Reporter`). |
| `groups` | UUID[] | Non | Groupes du membre dans le projet. |
| `is_active` | Boolean | Oui | Membre actif dans le projet. |
| `date_join` | Date | Oui | Date d'entrée dans le projet. |
| `date_leave` | Date | Non | Date de sortie du projet. |
| `notification_pref` | Enum | Oui | Préférence de notification (`All`, `Assigned`, `Mentions`, `None`). |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Permissions du membre (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `permissions` | JSON | Non | Permissions spécifiques (surcharge du rôle par défaut). |

## 4. Contraintes et règles de gestion

- **Rôle valide** : Le `role` doit correspondre à un rôle du projet.
- **Unicité** : Un membre ne peut avoir qu'un seul rôle par projet.
- **Admin requis** : Tout projet doit avoir au moins un Admin.
- **Non-chevauchement** : Impossible d'avoir un membre deux fois dans le même projet.

## 5. Relations

- **Lié à** : `OBJ-004-Individus` (L'individu en tant que membre).
- **Lié à** : `OBJ-036-Project` (Le projet).
- **Lié à** : `OBJ-030-Groups` (Groupes du membre).
- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages assignés).
