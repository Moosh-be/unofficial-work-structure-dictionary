# Schema : Objet Index (OBJ-001)

## 1. Présentation

L'index est le référentiel central qui liste et référence l'ensemble des objets métier. Il constitue le point d'entrée du dictionnaire de données.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_index` | UUID | Oui | Identifiant unique de l'entrée index. |
| `code_objet` | String | Oui | Code de l'objet métier (ex: OBJ-002). |
| `nom_objet` | String | Oui | Nom lisible de l'objet. |
| `description` | Text | Non | Description courte de l'objet. |
| `chemin_fichier` | String | Oui | Chemin relatif vers le dossier de l'objet. |
| `statut` | Enum | Oui | État de l'objet (`Actif`, `Archivé`, `Brouillon`). |
| `date_mise_a_jour` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Unicité** : Chaque `code_objet` doit être unique au sein de l'index.
- **Intégrité** : Toute entrée indexée doit pointer vers un dossier existant.
- **Synchronisation** : L'index doit refléter l'état actuel du référentiel.

## 4. Relations

- **Référence** : Chaque objet métier référencé (OBJ-002 à OBJ-015).
