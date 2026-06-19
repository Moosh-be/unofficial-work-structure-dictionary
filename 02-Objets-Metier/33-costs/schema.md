# Schema : Objet Cost (OBJ-033)

## 1. Présentation

Cet objet représente une dépense directe du projet. Il encode le type, le montant, la date et le WorkPackage associé.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_cost` | UUID | Oui | Identifiant unique de la dépense. |
| `description` | Text | Oui | Description de la dépense. |
| `type` | Enum | Oui | Type (`Personnel`, `Matériel`, `Licence`, `Sous-traitance`, `Déplacement`, `Formation`, `Autre`). |
| `montant` | Number | Oui | Montant de la dépense. |
| `devise` | String | Oui | Devise (EUR, USD, etc.). |
| `date` | Date | Oui | Date de la dépense. |
| `workpackage_id` | UUID | Non | WorkPackage associé (si applicable). |
| `facture_reference` | String | Non | Référence de la facture. |
| `statut_paiement` | Enum | Non | État du paiement (`Non facturé`, `Facturé`, `Payé`, `En retard`). |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Montant positif** : `montant` doit être > 0.
- **Traçabilité** : Toute dépense > seuil doit avoir une `facture_reference`.

## 4. Relations

- **Lié à** : `OBJ-026-WorkPackage` (WorkPackage lié à la dépense).
- **Lié à** : `OBJ-009-Budgets` (Suivi budgétaire).
- **Lié à** : `OBJ-020-Procurement` (Contrats fournisseurs).
- **Lié à** : `OBJ-027-TimeEntries` (Temps passé → coûts).
