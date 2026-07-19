# Schema : Objet Ressource Humaine (OBJ-043)

## 1. Présentation

Cet objet représente une personne dans le contexte du projet. Il encode l'identité, l'équipe d'appartenance et le rôle majeur de la personne dans le périmètre du projet.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_ressource` | UUID | Oui | Identifiant unique de la ressource. |
| `individu_id` | UUID | Oui | Référence vers l'individu (OBJ-004). |
| `nom` | String | Oui | Nom de famille. |
| `prenom` | String | Oui | Prénom. |
| `email` | String | Non | Email professionnel. |
| `equipe_id` | UUID | Non | Référence vers l'équipe (OBJ-044). |
| `equipe` | String | Non | Nom de l'équipe (raccourci lisible). |
| `role_majeur_id` | UUID | Non | Référence vers le rôle majeur (OBJ-038). |
| `role_majeur` | String | Non | Nom du rôle majeur (raccourci lisible). |
| `disponibilite` | Enum | Non | Disponibilité (`Disponible`, `Partiellement disponible`, `Indisponible`). |
| `taux_alloue` | Number | Non | Pourcentage de temps alloué au projet (0-100%). |
| `date_entree` | Date | Non | Date d'entrée dans le périmètre du projet. |
| `date_sortie` | Date | Non | Date de sortie du périmètre du projet (null = actif). |
| `created_on` | DateTime | Oui | Date de création de l'entrée. |
| `updated_on` | DateTime | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Unicité** : Le couple (individu_id, equipe_id) doit être unique au sein d'un projet.
- **Taux alloué** : La somme des taux alloués d'une ressource sur toutes les affectations ne doit pas dépasser 100%.
- **Période valide** : Si `date_entree` et `date_sortie` sont renseignées, `date_entree` ≤ `date_sortie`.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (L'individu correspondant).
- **Lié à** : `OBJ-044-Equipes` (L'équipe d'appartenance).
- **Lié à** : `OBJ-038-Roles` (Le rôle majeur).
- **Lié à** : `OBJ-015-Assignation` (Les affectations de la ressource).
- **Lié à** : `OBJ-037-Members` (L'accès projet de la ressource).
