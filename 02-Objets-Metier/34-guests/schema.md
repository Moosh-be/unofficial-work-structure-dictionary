# Schema : Objet Guest (OBJ-034)

## 1. Présentation

Cet objet représente un membre externe avec accès restreint au projet. Il encode les permissions, la durée et le WorkPackage lié.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_guest` | UUID | Oui | Identifiant unique du guest. |
| `nom` | String | Oui | Nom du guest. |
| `email` | String | Oui | Email de contact. |
| `organisation` | String | Non | Organisation d'appartenance. |
| `role` | String | Oui | Rôle du guest (ex: "Client", "Fournisseur", "Consultant"). |
| `permission_level` | Enum | Oui | Niveau d'accès (`Read Only`, `Read + Comment`, `Contributor`). |
| `workpackage_ids` | UUID[] | Non | WorkPackages accessibles. |
| `date_debut` | Date | Non | Date de début d'accès. |
| `date_fin` | Date | Non | Date de fin d'accès. |
| `status` | Enum | Oui | État (`Active`, `Suspendue`, `Expired`). |
| `invite_by` | UUID | Oui | Personne qui a invité. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Email unique** : L'email doit être unique au sein du projet.
- **Accès temporaire** : `date_fin` doit être renseignée si l'accès est temporaire.
- **Permissions minimales** : Un guest ne peut jamais avoir `Admin` ou `Manage`.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (Si le guest est aussi un individu connu).
- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages accessibles).
- **Lié à** : `OBJ-020-Procurement` (Si guest = fournisseur).
