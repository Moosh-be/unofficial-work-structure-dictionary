# Schema : Objet Configuration Item (OBJ-021)

## 1. Présentation

Cet objet représente un élément de configuration du projet. Il encode les métadonnées de version, statut et relations entre composants.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_ci` | UUID | Oui | Identifiant unique de l'élément de configuration. |
| `nom` | String | Oui | Nom de l'élément. |
| `type` | Enum | Oui | Type (`Document`, `Code`, `Design`, `Donnée`, `Matériel`, `Configuration`). |
| `version` | String | Oui | Version actuelle. |
| `baseline_id` | UUID | Non | Baseline de référence associée. |
| `statut` | Enum | Oui | État (`En développement`, `En revue`, `Baselined`, `Archivé`). |
| `chemin_stockage` | String | Oui | Chemin ou URL vers le CI. |
| `proprietaire` | UUID | Oui | Personne responsable du CI. |
| `historique_versions` | Text | Non | Historique des versions (format structuré). |
| `date_creation` | Date/Time | Oui | Date de création. |
| `date_mise_a_jour` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Unicité de version** : Chaque version doit être unique au sein d'un CI.
- **Baselining** : Un CI `Baselined` ne peut être modifié que via un changement formalisé.

## 4. Relations

- **Lié à** : `OBJ-010-Documents` (Version du document).
- **Lié à** : `OBJ-013-Requirements` (Besoins implémentés).
- **Lié à** : `OBJ-012-TestCases` (Tests associés).
- **Lié à** : `OBJ-018-ChangeRequests` (Modifications du CI).
