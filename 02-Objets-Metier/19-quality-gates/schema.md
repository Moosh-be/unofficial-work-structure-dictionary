# Schema : Objet Quality Gate (OBJ-019)

## 1. Présentation

Cet objet représente un point de contrôle qualité formel dans le cycle de vie du projet. Il encode les critères, le passage et les réserves.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_gate` | UUID | Oui | Identifiant unique de la porte. |
| `titre` | String | Oui | Nom de la porte (ex: Gate de conception). |
| `phase` | String | Oui | Phase associée (`Démarrage`, `Conception`, `Développement`, `Recette`, `Livraison`, `Clôture`). |
| `critères_passage` | Text | Oui | Liste des critères à satisfaire. |
| `resultat` | Enum | Oui | Résultat (`Passé`, `Passé avec réserves`, `Refusé`). |
| `réserves` | Text | Non | Réserves ou conditions de passage. |
| `date_gate` | Date | Oui | Date du point de contrôle. |
| `comité` | UUID[] | Oui | Membres du comité de revue. |
| `animateur` | UUID | Oui | Personne ayant animé la revue. |
| `document_joint` | String | Non | Chemin vers le PV de revue. |

## 3. Contraintes et règles de gestion

- **Critères obligatoires** : Tous les critères de passage doivent être listés avant le gate.
- **Décision formelle** : Le résultat doit être consigné dans un PV.

## 4. Relations

- **Lié à** : `OBJ-005-Milestones` (Jalon associé au gate).
- **Lié à** : `OBJ-004-Individus` (Membres du comité).
- **Lié à** : `OBJ-010-Documents` (PV de revue).
- **Lié à** : `OBJ-012-TestCases` (Résultats de test en appui).
