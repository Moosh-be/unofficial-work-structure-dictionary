# Schema : Objet Portfolio (OBJ-045)

## 1. Présentation

Cet objet représente un portefeuille de projets. Il encode la structure de regroupement, les indicateurs consolidés et la hiérarchie de portefeuilles.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_portfolio` | UUID | Oui | Identifiant unique du portefeuille. |
| `titre` | String | Oui | Intitulé du portefeuille. |
| `description` | Text | Non | Description du périmètre. |
| `type` | Enum | Non | Type (`Stratégique`, `Opérationnel`, `Transverse`, `Temporaire`). |
| `parent_portfolio_id` | UUID | Non | Portefeuille parent (null si racine). |
| `project_ids` | UUID[] | Oui | Liste des projets rattachés. |
| `budget_total` | Number | Non | Budget consolidé de tous les projets. |
| `devise` | String | Non | Devise du budget (EUR, USD, etc.). |
| `nombre_projets` | Integer | Non | Nombre de projets rattachés (calculé). |
| `statut_global` | Enum | Non | État consolidé (`Sain`, `Attention`, `Critique`). |
| `responsable` | UUID | Oui | Personne responsable du portefeuille. |
| `date_creation` | Date/Time | Oui | Date de création. |
| `date_mise_a_jour` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Hiérarchie** : Un portefeuille peut avoir un parent et plusieurs enfants, mais pas de cycle.
- **Indicateurs** : `nombre_projets` est calculé automatiquement depuis `project_ids`.
- **Statut global** : Peut être calculé à partir des statuts des projets rattachés (majorité, seuils critiques, etc.).
- **Budget total** : Peut être calculé automatiquement depuis les budgets des projets rattachés ou renseigné manuellement.

## 4. Relations

- **Lié à** : `OBJ-036-Project` (Projets contenus dans le portefeuille).
- **Lié à** : `OBJ-036-Project` (Portefeuille parent via `parent_portfolio_id`).
- **Lié à** : `OBJ-004-Individus` (Le responsable du portefeuille).
- **Lié à** : `OBJ-009-Budgets` (Budget consolidé).

## 5. Troncs hérités

Cet objet hérite de :

- **EntitéVie** : titre, description, statut, responsable, dates
- **Artefact** : version, stockage

```
Portfolio
├── [EntitéVie]
│   ├── titre
│   ├── description
│   ├── statut
│   ├── responsable
│   ├── date_creation
│   └── date_mise_a_jour
├── [Artefact]
│   ├── version
│   └── stockage
└── [Spécifique]
    ├── type
    ├── parent_portfolio_id
    ├── project_ids[]
    ├── budget_total
    ├── devise
    ├── nombre_projets (calculé)
    └── statut_global (calculé)
```

## 6. Exemple JSON

```json
{
  "id_portfolio": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "titre": "Portfolio Digital",
  "description": "Regroupe les projets liés à la transformation digitale",
  "type": "Stratégique",
  "parent_portfolio_id": null,
  "project_ids": [
    "b2c3d4e5-f6a7-8901-bcde-f12345678901",
    "c3d4e5f6-a7b8-9012-cdef-123456789012"
  ],
  "budget_total": 500000,
  "devise": "EUR",
  "nombre_projets": 2,
  "statut_global": "Sain",
  "responsable": "d4e5f6a7-b8c9-0123-defa-234567890123",
  "date_creation": "2025-01-15T09:00:00Z",
  "date_mise_a_jour": "2026-07-15T14:30:00Z"
}
```
