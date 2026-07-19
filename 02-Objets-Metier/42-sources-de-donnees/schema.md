# Schema : Objet Source de Données (OBJ-042)

## 1. Présentation

Cet objet représente une source de données utilisée par le projet. Il encode les informations sur l'origine des données, leur format, leur fréquence et leurs accès.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_source` | UUID | Oui | Identifiant unique de la source. |
| `nom` | String | Oui | Nom de la source (ex: ERP, CRM, Base KPI). |
| `description` | Text | Non | Description détaillée de la source. |
| `type` | Enum | Oui | Type (`Interne`, `Externe`, `Humaine`, `Systématique`). |
| `outil` | String | Oui | Outil qui produit/stoke la source (ex: SAP, Jira, SharePoint). |
| `url` | String | Non | URL d'accès ou de documentation de la source. |
| `format` | String | Non | Format des données (JSON, XML, CSV, Base SQL, API). |
| `frequence` | Enum | Non | Fréquence de mise à jour (`Temps réel`, `Journalière`, `Hebdomadaire`, `Mensuelle`, `Ad hoc`). |
| `fiable` | Boolean | Non | Source considérée comme fiable. |
| `responsable_id` | UUID | Non | Personne responsable de la source (OBJ-004). |
| `periode_debut` | Date | Non | Date de début de disponibilité de la source. |
| `periode_fin` | Date | Non | Date de fin de disponibilité (null = active). |
| `created_on` | DateTime | Oui | Date de création de l'entrée. |
| `updated_on` | DateTime | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Unicité** : Le `nom` doit être unique au sein du périmètre de traçabilité.
- **Fichiers** : Une source est liée à au moins un Document (OBJ-010) ou un Fichier (OBJ-032).
- **Période valide** : Si `periode_debut` et `periode_fin` sont renseignées, `periode_debut` ≤ `periode_fin`.

## 4. Relations

- **Lié à** : `OBJ-010-Documents` (Supports de la source).
- **Lié à** : `OBJ-032-Files` (Fichiers stockés).
- **Lié à** : `OBJ-004-Individus` (Responsable de la source).
- **Lié à** : `OBJ-041-Reports` (Reports alimentés par la source).
- **Lié à** : `OBJ-011-KPI` (KPI dérivés des données).
