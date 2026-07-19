# Schema : Objet Équipe (OBJ-044)

## 1. Présentation

Cet objet représente une équipe de travail dans le projet. Il encode l'organisation humaine et fonctionnelle, distincte des permissions (Groupes).

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_equipe` | UUID | Oui | Identifiant unique de l'équipe. |
| `nom` | String | Oui | Nom de l'équipe (ex: "Équipe Technique", "Comité de Pilotage"). |
| `description` | Text | Non | Description de la mission de l'équipe. |
| `type` | Enum | Oui | Type (`Projet`, `Technique`, `Métier`, `Pilotage`, `Externe`, `Autre`). |
| `responsable_id` | UUID | Non | Responsable de l'équipe (OBJ-004). |
| `groupe_associe_id` | UUID | Non | Groupe de permissions associé (OBJ-030). |
| `is_active` | Boolean | Oui | Équipe active (true = opérationnelle, false = dissoute). |
| `created_on` | DateTime | Oui | Date de création de l'équipe. |
| `updated_on` | DateTime | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Unicité** : Le `nom` doit être unique au sein d'un projet.
- **Responsable** : Une équipe sans responsable est une équipe à risque.
- **Lien groupe** : Une équipe peut être liée à un Groupe (OBJ-030) pour la gestion des permissions.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (Membres de l'équipe).
- **Lié à** : `OBJ-043-Ressources` (Ressources de l'équipe).
- **Lié à** : `OBJ-038-Roles` (Rôles au sein de l'équipe).
- **Lié à** : `OBJ-030-Groups` (Groupe de permissions associé).
- **Lié à** : `OBJ-015-Assignation` (Assignations des membres de l'équipe).
