# Schema : Objet Lessons Learned (OBJ-023)

## 1. Présentation

Cet objet représente un retour d'expérience capturé pendant le projet. Il encode les enseignements, les catégories et les actions correctives.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_lesson` | UUID | Oui | Identifiant unique du retour d'expérience. |
| `titre` | String | Oui | Résumé de l'enseignement. |
| `description` | Text | Oui | Description détaillée. |
| `categorie` | Enum | Oui | Type (`Bonne pratique`, `Point d'attention`, `Erreur`, `Idée amélioration`). |
| `contexte` | Text | Oui | Contexte dans lequel l'enseignement a été tiré. |
| `auteur` | UUID | Oui | Personne ayant capturé le feedback. |
| `date_capture` | Date/Time | Oui | Date de capture. |
| `action_corrective` | Text | Non | Action décidée suite à l'enseignement. |
| `statut_action` | Enum | Non | État de l'action (`À faire`, `En cours`, `Faite`, `Non retenue`). |
| `projets_cibles` | String | Non | Projets sur lesquels appliquer cet enseignement. |
| `valide` | Boolean | Non | Validation par le comité de projet. |

## 3. Contraintes et règles de gestion

- **Contexte obligatoire** : Chaque lesson learned doit pouvoir être replacé dans un contexte.
- **Action tracée** : Tout enseignement important doit avoir une action associée.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (L'auteur).
- **Lié à** : `OBJ-022-Incidents` (Lesson tirée d'un incident).
- **Lié à** : `OBJ-019-QualityGates` (Lesson tirée d'un gate).
- **Lié à** : `OBJ-010-Documents` (Supports ou comptes-rendus).
