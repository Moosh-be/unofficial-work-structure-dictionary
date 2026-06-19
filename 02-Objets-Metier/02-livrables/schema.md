# Schema : Objet Livrable (OBJ-002)

## 1. Présentation

Cet objet représente tout livrable tangible produit par le projet. Il encode la définition, le statut de livraison et les conditions d'acceptation du livrable.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_livrable` | UUID | Oui | Identifiant unique du livrable. |
| `titre` | String | Oui | Intitulé du livrable. |
| `description` | Text | Non | Description détaillée du livrable. |
| `type` | Enum | Oui | Catégorie (`Principal`, `Intermédiaire`, `Gestion`, `Transversal`). |
| `statut` | Enum | Oui | État de livraison (`À produire`, `En cours`, `En revue`, `Livré`, `Accepté`). |
| `commanditaire_id` | UUID | Oui | Partie prenante destinataire. |
| `date_echeance` | Date | Oui | Date limite de livraison. |
| `critères_acceptation` | Text | Non | Critères objectifs de validation. |

## 3. Contraintes et règles de gestion

- **Traçabilité** : Chaque livrable doit pouvoir être relié à un besoin ou exigence.
- **Acceptation** : Le passage à `Accepté` nécessite une validation formelle du commanditaire.

## 4. Relations

- **Lié à** : `OBJ-013-Requirements` (Le livrable répond à un ou plusieurs besoins).
- **Lié à** : `OBJ-007-Stakeholders` (Le commanditaire).
- **Lié à** : `OBJ-010-Documents` (Pièces jointes ou artefacts du livrable).
