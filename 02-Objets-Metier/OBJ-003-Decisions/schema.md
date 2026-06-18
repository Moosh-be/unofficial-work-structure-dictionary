# Schema : Objet Décision (OBJ-003)

## 1. Présentation
Cet objet représente l'unité élémentaire de décision au sein du système. Il encapsule les choix, les justifications et le contexte temporel associés à une action.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_decision` | UUID | Oui | Identifiant unique de la décision. |
| `titre` | String | Oui | Intitulé synthétique de la décision. |
| `description` | Text | Non | Contexte détaillé et éléments de langage. |
| `statut` | Enum | Oui | État de la décision (Ex: `En cours`, `Validée`, `Rejetée`). |
| `date_creation` | Date/Time | Oui | Horodatage de l'émission de la décision. |
| `acteur_id` | UUID | Oui | Référence vers l'entité/personne ayant pris la décision. |
| `justification` | Text | Non | Raisonnement logique ou base factuelle du choix. |
| `impact_niveau` | Integer | Non | Échelle de 1 à 5 sur l'ampleur des conséquences. |

## 3. Contraintes et règles de gestion
* **Immuabilité** : Une fois le statut passé à `Validée`, le contenu de la décision ne doit plus être modifié. Toute évolution nécessite une nouvelle version.
* **Traçabilité** : Chaque champ `justification` est obligatoire si `impact_niveau` est supérieur à 3.

## 4. Relations
* **Lié à** : `OBJ-002-Action` (L'action résultant de la décision).
* **Lié à** : `OBJ-001-Acteur` (L'entité responsable).