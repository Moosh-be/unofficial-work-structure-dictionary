# Schema : Objet Deliverable Acceptance (OBJ-016)

## 1. Présentation

Cet objet représente le processus formel de réception et acceptation d'un livrable. Il encode la traçabilité de la validation et les décisions associées.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_acceptance` | UUID | Oui | Identifiant unique de l'acceptation. |
| `livrable_id` | UUID | Oui | Livrable concerné. |
| `commanditaire_id` | UUID | Oui | Personne autorisée à accepter. |
| `date_soumission` | Date | Oui | Date de présentation du livrable. |
| `date_decision` | Date | Non | Date de la décision d'acceptation. |
| `decision` | Enum | Oui | Résultat (`Accepté`, `Accepté avec réserves`, `Refusé`). |
| `commentaires` | Text | Non | Justification de la décision. |
| `reserves` | Text | Non | Conditions ou réserves (si applicable). |
| `preuve_acceptation` | String | Non | Chemin vers la preuve signée. |

## 3. Contraintes et règles de gestion

- **Ordonnancement** : Une acceptation ne peut être `Accepté` que si tous les critères sont validés.
- **Preuve** : L'acceptation doit être documentée (email signé, formulaire, PV).

## 4. Relations

- **Lié à** : `OBJ-002-Livrables` (Le livrable accepté).
- **Lié à** : `OBJ-007-Stakeholders` (Le commanditaire).
- **Lié à** : `OBJ-013-Requirements` (Les critères d'acceptation).
