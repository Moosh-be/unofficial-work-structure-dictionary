# Schema : Objet Document (OBJ-010)

## 1. Présentation

Cet objet représente un document produit ou utilisé par le projet. Il encode les métadonnées de traçabilité et de gestion documentaire.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_document` | UUID | Oui | Identifiant unique du document. |
| `titre` | String | Oui | Intitulé du document. |
| `description` | Text | Non | Description ou résumé du contenu. |
| `type` | Enum | Oui | Catégorie (`Technique`, `Fonctionnel`, `Manager`, `Contractuel`, `Pédagogique`, `Source de Données`). |
| `statut` | Enum | Oui | État (`Brouillon`, `En revue`, `Validé`, `Archivé`). |
| `version` | String | Oui | Numéro de version (ex: 1.0, 1.1). |
| `auteur` | UUID | Oui | Créateur du document. |
| `chemin_stockage` | String | Oui | Chemin ou URL vers le fichier. |
| `date_creation` | Date/Time | Oui | Date de création. |
| `date_mise_a_jour` | Date/Time | Oui | Dernière modification. |
| `liens_documents` | UUID[] | Non | Documents liés ou versions précédentes. |
| `outil_source` | String | Non | Outil qui produit/stoke la source (ex: SAP, Jira, SharePoint). |
| `url_source` | String | Non | URL d'accès ou de documentation de la source. |
| `format_source` | String | Non | Format des données (JSON, XML, CSV, Base SQL, API). |
| `frequence` | Enum | Non | Fréquence de mise à jour (`Temps réel`, `Journalière`, `Hebdomadaire`, `Mensuelle`, `Ad hoc`). |
| `fiable` | Boolean | Non | Source considérée comme fiable. |
| `source_id` | UUID | Non | Référence vers un Document parent si la source est elle-même un document (lien de provenance). |
| `redondant` | Boolean | Non | Document redondant (copié pour simplifier la structure ou améliorer la résilience). |
| `source_redundance` | UUID[] | Non | Si redondant, identifiants du(s) Document(s) source original(aux). |
| `lien_fichier` | UUID | Non | Référence vers le File (OBJ-032) associé. |

## 3. Contraintes et règles de gestion

- **Unicité** : Le couple `titre` + `version` doit être unique au sein d'un contexte.
- **Intégrité** : `chemin_stockage` doit pointer vers un fichier existant ou accessible.
- **Historique** : Les versions précédentes doivent être conservées en archivage.

## 4. Relations

- **Lié à** : `OBJ-002-Livrables` (Documents livrés).
- **Lié à** : `OBJ-003-Décisions` (Documents de décision).
- **Lié à** : `OBJ-004-Individus` (L'auteur).
- **Lié à** : `OBJ-007-Stakeholders` (Destinataires).
