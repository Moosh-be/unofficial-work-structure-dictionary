# Schema : Objet Budget (OBJ-009)

## 1. Présentation

Cet objet représente une enveloppe budgétaire du projet. Il encode les prévisions, engagements et réalisations financières.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_budget` | UUID | Oui | Identifiant unique du budget. |
| `titre` | String | Oui | Intitulé de l'enveloppe budgétaire. |
| `type` | Enum | Oui | Type (`CAPEX`, `OPEX`, `Contingence`, `Réserve management`). |
| `montant_total` | Number | Oui | Enveloppe autorisée. |
| `montant_engage` | Number | Non | Montants engagés (contrats signés). |
| `montant_depensé` | Number | Non | Montants réellement dépensés. |
| `devise` | String | Oui | Devise (EUR, USD, etc.). |
| `periode` | String | Oui | Période concernée (mois/année). |
| `responsable` | UUID | Oui | Personne responsable du budget. |

## 3. Contraintes et règles de gestion

- **Cohérence** : `montant_engage` ≤ `montant_total`.
- **Traçabilité** : Toute dépense doit être rattachée à un budget.
- **Actualisation** : Le budget doit être actualisé à chaque révision.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (Le responsable budgétaire).
- **Lié à** : `OBJ-002-Livrables` (Coût par livrable).
- **Lié à** : `OBJ-006-Resources` (Consommation de ressources).
