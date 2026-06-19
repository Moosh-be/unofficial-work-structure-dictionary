# Schema : Objet Incident (OBJ-022)

## 1. Présentation

Cet objet représente un incident survenu dans le projet. Il encode la description, l'impact, l'analyse et la résolution.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_incident` | UUID | Oui | Identifiant unique de l'incident. |
| `titre` | String |Oui | Résumé de l'incident. |
| `description` | Text | Oui | Description détaillée. |
| `severite` | Enum | Oui | Sévérité (`Critique`, `Majeure`, `Mineure`, `Très mineure`). |
| `impact` | Text | Non | Description de l'impact. |
| `date_detection` | Date/Time | Oui | Date et heure de détection. |
| `date_resolution` | Date/Time | Non | Date et heure de résolution. |
| `cause_ra` | Text | Non | Cause racine identifiée (méthode 5 Pourquoi, Ishikawa). |
| `resolution` | Text | Non | Actions correctives mises en œuvre. |
| `responsable` | UUID | Oui | Personne chargée du suivi. |
| `statut` | Enum | Oui | État (`Ouvert`, `En investigation`, `En résolution`, `Résolu`, `Clôturé`). |
| `incidents_liés` | UUID[] | Non | Incidents apparentés. |

## 3. Contraintes et règles de gestion

- **Traçabilité** : Un incident `Résolu` doit avoir une `cause_ra` renseignée.
- **Notification** : Les incidents critiques doivent déclencher une alerte.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (Le responsable).
- **Lié à** : `OBJ-008-Risks` (Si l'incident est la réalisation d'un risque).
- **Lié à** : `OBJ-023-LessonsLearned` (Capitalisation).
- **Lié à** : `OBJ-018-ChangeRequests` (Si l'incident provoque un changement).
