# Schema : Objet Assignation (OBJ-015)

## 1. Présentation
Cet objet représente l'unité élémentaire d'assignation d'une ressource à une tâche.

### Il y a plusieurs possibilités

Pol assigné à la tâche T pour toute la durée de la tâche.
Pol assigné à la tâche T pour UNE partie de la durée de la tâche.
Pol assigné à la tâche T pour occasionellement le temps de la durée de la tâche.

### Granularité et précision

La précision de l'information n'est pas la même si l'objectif est de détecter
- les chevauchement de planification
- la consommation de la ressource s'un projet
- le task switching
- le temps de travail total de la ressource


## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_assignation` | UUID | Oui | Identifiant unique de la décision. |
| `titre` | String | Non | Intitulé synthétique de l'assignation. |
| `description` | Text | Non | Contexte détaillé et éléments de langage. |
| `statut` | Enum | Oui | État de l'assignation (Ex: `Proposée`, `Acceptée`, `Rejetée`). |
| `date_creation` | Date/Time | Oui | Horodatage de l'émission de l'assignation. |
| `date_disponible_start` | Date/Time | Oui | Horodatage du début de disponiblité pour l'assignation. |
| `assigee_id` | UUID | Oui | Référence vers l'entité/personne assigné.e. |
| `task_id` | UUID | Oui | Référence vers l'entité/personne assigné.e. |
| `justification` | Text | Non | Raisonnement logique ou base factuelle du choix. |
| `impact_niveau` | Integer | Non | Échelle de 1 à 5 sur l'ampleur des conséquences. |

## 3. Contraintes et règles de gestion
* **Immuabilité** : Une fois le statut passé à `Validée`, le contenu de la décision ne doit plus être modifié. Toute évolution nécessite une nouvelle version.
* **Traçabilité** : Chaque champ `justification` est obligatoire si `impact_niveau` est supérieur à 3.

## 4. Relations
* **Lié à** : `OBJ-002-Action` (L'action résultant de la décision).
* **Lié à** : `OBJ-001-Acteur` (L'entité responsable).