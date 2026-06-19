# Schema : Objet Document (OBJ-010)

## 1. Présentation

Cet objet représente un document produit ou utilisé par le projet. Il encode les métadonnées de traçabilité et de gestion documentaire.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_document` | UUID | Oui | Identifiant unique du document. |
| `titre` | String | Oui | Intitulé du document. |
| `description` | Text | Non | Description ou résumé du contenu. |
| `type` | Enum | Oui | Catégorie (`Technique`, `Fonctionnel`, `Manager`, `Contractuel`, `Pédagogique`). |
| `statut` | Enum | Oui | État (`Brouillon`, `En revue`, `Validé`, `Archivé`). |
| `version` | String | Oui | Numéro de version (ex: 1.0, 1.1). |
| `auteur` | UUID | Oui | Créateur du document. |
| `chemin_stockage` | String | Oui | Chemin ou URL vers le fichier. |
| `date_creation` | Date/Time | Oui | Date de création. |
| `date_mise_a_jour` | Date/Time | Oui | Dernière modification. |
| `liens_documents` | UUID[] | Non | Documents liés ou versions précédentes. |

## 3. Contraintes et règles de gestion

- **Unicité** : Le couple `titre` + `version` doit être unique au sein d'un contexte.
- **Intégrité** : `chemin_stockage` doit pointer vers un fichier existant ou accessible.
- **Historique** : Les versions précédentes doivent être conservées en archivage.

## 4. Relations

- **Lié à** : `OBJ-002-Livrables` (Documents livrés).
- **Lié à** : `OBJ-003-Décisions` (Documents de décision).
- **Lié à** : `OBJ-004-Individus` (L'auteur).
- **Lié à** : `OBJ-007-Stakeholders` (Destinataires).
