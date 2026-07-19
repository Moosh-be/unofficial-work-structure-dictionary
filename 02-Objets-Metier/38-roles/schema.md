# Schema : Objet Role (OBJ-038)

## 1. Présentation

Cet objet représente un rôle fonctionnel dans le projet. Il encode la définition, les responsabilités et les personnes qui l'ont occupé.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_role` | UUID | Oui | Identifiant unique du rôle. |
| `nom` | String | Oui | Nom du rôle (ex: Project Manager, Tech Lead). |
| `code` | String | Oui | Identifiant court du rôle (ex: PM, TL). |
| `description` | Text | Oui | Description des responsabilités du rôle. |
| `url_documentation` | String | Non | URL vers la documentation du rôle (wiki, Confluence, etc.). |
| `niveau` | Enum | Oui | Niveau hiérarchique (`Decision`, `Management`, `Execution`, `Support`). |
| `statut` | Enum | Oui | État (`Defined`, `Assigned`, `Unassigned`, `Archived`). |
| `competences_requises` | Text | Non | Compétences nécessaires pour le rôle. |
| `temps_alloue` | Number | Non | Temps alloué au rôle (en % ou en jours/semaine). |
| `created_on` | Date/Time | Oui | Date de création du rôle. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Relations du rôle (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `permissions` | JSON | Oui | Permissions associées au rôle. |

### Exemple de permissions

```json
{
  "work_packages": ["view", "create", "edit"],
  "time_entries": ["create", "edit_own"],
  "documents": ["view", "create"],
  "budget": ["view"],
  "settings": []
}
```

## 4. Contraintes et règles de gestion

- **Unicité** : Le `nom` doit être unique au sein d'un projet.
- **Rôles critiques** : Certains rôles (Sponsor, PM) doivent toujours avoir un titulaire (statut ≠ Unassigned).

## 5. Relations

- **Lié à** : `OBJ-015-Assignation` (Assignations du rôle).
- **Lié à** : `OBJ-004-Individus` (Personnes ayant occupé le rôle).
- **Lié à** : `OBJ-037-Members` (Membres du projet avec ce rôle).
- **Lié à** : `OBJ-030-Groups` (Groupes associés).
