# Schema : Objet Version (OBJ-028)

## 1. Présentation

Cet objet représente une version (release) du projet. Il encode les métadonnées de livraison, le statut et les WorkPackages inclus.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_version` | UUID | Oui | Identifiant unique de la version. |
| `nom` | String | Oui | Nom de la version (ex: v1.0, v2.1-alpha). |
| `description` | Text | Non | Description de la version. |
| `status` | Enum | Oui | État (`Planned`, `In Progress`, `Code Freeze`, `Released`, `Archived`). |
| `date_prevue` | Date | Non | Date de livraison planifiée. |
| `date_reelle` | Date | Non | Date effective de mise en production. |
| `is_public` | Boolean | Oui | Visible par les utilisateurs externes. |
| `effective_date` | Date | Non | Date d'effet (déploiement effectif). |
| `wiki_page_id` | String | Non | Lien vers la page de notes de release. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Unicité** : Le `nom` doit être unique au sein d'un projet.
- **Ordonnancement** : Une version `Released` doit avoir une `date_reelle` renseignée.
- **Code Freeze** : Impossible d'ajouter des WorkPackages après `Code Freeze`.

## 4. Relations

- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages inclus dans la version).
- **Lié à** : `OBJ-002-Livrables` (Livrables livrés avec la version).
- **Lié à** : `OBJ-010-Documents` (Notes de release).
- **Lié à** : `OBJ-019-QualityGates` (Validation avant release).
