# Schema : Objet Requirement (OBJ-013)

## 1. Présentation

Cet objet représente un besoin ou une exigence du projet. Il encode la description, le niveau de priorité et la traçabilité.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_requirement` | UUID | Oui | Identifiant unique du besoin. |
| `titre` | String | Oui | Intitulé court de l'exigence. |
| `description` | Text | Oui | Description détaillée. |
| `type` | Enum | Oui | Type (`Fonctionnelle`, `Non-fonctionnelle`, `Contrainte`, `Metier`). |
| `priorite` | Enum | Oui | Priorité (`Critique`, `Haute`, `Moyenne`, `Faible`). |
| `statut` | Enum | Oui | État (`Proposé`, `Validé`, `En cours`, `Implémenté`, `Validé test`). |
| `source` | String | Non | Origine du besoin (stakeholder, réglementation, etc.). |
| `granularite` | Integer | Non | Niveau de détail (1 = stratégique, 3 = détaillé). |
| `date_creation` | Date/Time | Oui | Date de création. |
| `date_mise_a_jour` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Unicité** : Le `titre` doit être unique au sein d'un niveau de granularité.
- **Traçabilité** : Toute exigence validée doit être couverte par au moins un test case.
- **Évolutivité** : Toute modification d'exigence validée doit être tracée.

## 4. Relations

- **Lié à** : `OBJ-002-Livrables` (Le livrable qui implémente le besoin).
- **Lié à** : `OBJ-012-TestCases` (Les tests de validation).
- **Lié à** : `OBJ-007-Stakeholders` (Le sourceur du besoin).
- **Lié à** : `OBJ-010-Documents` (Documentation associée).
