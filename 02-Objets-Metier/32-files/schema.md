# Schema : Objet File (OBJ-032)

## 1. Présentation

Cet objet représente un fichier attaché à un WorkPackage ou au projet. Il encode les métadonnées, l'accès et l'historique du fichier.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_file` | UUID | Oui | Identifiant unique du fichier. |
| `nom_fichier` | String | Oui | Nom du fichier. |
| `description` | Text | Non | Description du contenu. |
| `taille` | Number | Oui | Taille en octets. |
| `mime_type` | String | Oui | Type MIME du fichier. |
| `checksum` | String | Oui | Hash SHA-256 pour intégrité. |
| `uploaded_by` | UUID | Oui | Personne ayant uploadé. |
| `uploaded_on` | Date/Time | Oui | Date d'upload. |
| `version` | Integer | Oui | Numéro de version. |
| `is_current` | Boolean | Oui | Version courante du fichier. |
| `storage_path` | String | Oui | Chemin de stockage physique. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Relations du fichier (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `associations` | JSON | Oui | Liens vers les WorkPackages/cibles. |

### Exemple d'associations

```json
{
  "workpackage_ids": ["wp-123", "wp-456"],
  "version_ids": ["ver-789"]
}
```

## 4. Contraintes et règles de gestion

- **Intégrité** : `checksum` doit correspondre au contenu du fichier.
- **Unicité de version** : Un seul fichier `is_current=true` par nom de fichier.
- **Taille** : Respecter la limite maximale du projet.

## 5. Relations

- **Lié à** : `OBJ-026-WorkPackage` (WorkPackage associé).
- **Lié à** : `OBJ-028-Versions` (Version associée).
- **Lié à** : `OBJ-004-Individus` (Uploadé par).
