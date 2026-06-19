# Schema : Objet Procurement (OBJ-020)

## 1. Présentation

Cet objet représente un achat ou contrat avec un fournisseur externe. Il encode les informations contractuelles, de suivi et de paiement.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_procurement` | UUID | Oui | Identifiant unique de l'achat. |
| `titre` | String | Oui | Intitulé de l'achat. |
| `type` | Enum | Oui | Type (`Travaux`, `Fournitures`, `Études`, `Licence`). |
| `fournisseur` | String | Oui | Nom du fournisseur. |
| `montant_contrat` | Number | Oui | Montant total du contrat. |
| `devise` | String | Oui | Devise (EUR, USD, etc.). |
| `date_signature` | Date | Non | Date de signature du contrat. |
| `date_debut` | Date | Non | Date de début d'exécution. |
| `date_fin` | Date | Non | Date de fin d'exécution. |
| `statut` | Enum | Oui | État (`En cours`, `Terminé`, `En retard`, `Résilié`). |
| `responsable_achat` | UUID | Oui | Personne responsable du suivi. |
| `liens_contrats` | String | Non | Chemin vers le document contractuel. |

## 3. Contraintes et règles de gestion

- **Montant positif** : Le `montant_contrat` doit être > 0.
- **Périmètre valide** : `date_debut` < `date_fin` si les deux sont renseignées.

## 4. Relations

- **Lié à** : `OBJ-009-Budgets` (Suivi des paiements).
- **Lié à** : `OBJ-002-Livrables` (Livrables du fournisseur).
- **Lié à** : `OBJ-010-Documents` (Contrats, factures).
- **Lié à** : `OBJ-004-Individus` (Le responsable achat).
