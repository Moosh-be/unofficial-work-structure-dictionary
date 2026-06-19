# Schema : Objet Change Request (OBJ-018)

## 1. Présentation

Cet objet représente une demande de changement du projet. Il encode la proposition, l'analyse d'impact et la décision prise.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_change` | UUID | Oui | Identifiant unique de la demande. |
| `titre` | String | Oui | Résumé du changement proposé. |
| `description` | Text | Oui | Description détaillée. |
| `demandeur` | UUID | Oui | Personne ayant initié la demande. |
| `type` | Enum | Oui | Catégorie (`Périmètre`, `Planning`, `Budget`, `Qualité`, `Ressources`). |
| `priorite` | Enum | Oui | Urgence (`Immédiate`, `Haute`, `Moyenne`, `Basse`). |
| `impact_cout` | Number | Non | Estimation du coût du changement. |
| `impact_delai` | Number | Non | Estimation du retard (en jours). |
| `decision` | Enum | Non | Résultat (`Accepté`, `Refusé`, `Reporté`). |
| `decisionnaire` | UUID | Non | Personne ayant tranché. |
| `date_decision` | Date | Non | Date de la décision. |
| `statut` | Enum | Oui | État (`Proposé`, `En analyse`, `En examen`, `Traitée`, `Annulée`). |

## 3. Contraintes et règles de gestion

- **Analyse obligatoire** : Un impact (coût ou délai) doit être renseigné avant examen.
- **Décision traçable** : Toute demande traitée doit avoir un décisionnaire et une date.

## 4. Relations

- **Lié à** : `OBJ-013-Requirements` (Le besoin modifié).
- **Lié à** : `OBJ-009-Budgets` (Impact budgétaire).
- **Lié à** : `OBJ-005-Milestones` (Impact sur les jalons).
- **Lié à** : `OBJ-003-Décisions` (Décision de changement).
