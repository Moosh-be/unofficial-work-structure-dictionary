# Schema : Objet Changelog (OBJ-048)

## 1. Présentation

Cet objet représente un changement tracé sur un artefact (CI, document, version). Il encode l'identité de l'artefact modifié, la nature du changement, le contexte et l'auteur.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_changelog` | UUID | Oui | Identifiant unique de l'entrée changelog. |
| `titre` | String | Oui | Intitulé court du changement. |
| `artefact_id` | UUID | Oui | Identifiant de l'artefact modifié (CI, document, version). |
| `artefact_type` | Enum | Oui | Type d'artefact (`CI`, `Document`, `Version`, `Configuration`, `Donnee`). |
| `type_changement` | Enum | Oui | Type de changement (`Ajout`, `Modification`, `Mise_a_jour`, `Suppression`, `Baselining`). |
| `version_avant` | String | Non | Version précédente. |
| `version_apres` | String | Non | Nouvelle version. |
| `description` | Text | Oui | Description du changement (pourquoi + quoi). |
| `auteur` | UUID | Oui | Personne qui a réalisé le changement. |
| `impact` | Enum | Non | Impact du changement (`Nul`, `Mineur`, `Majeur`, `Critique`). |
| `breaking_change` | Boolean | Non | Le changement est-il rétrocompatible ? |
| `date_changement` | Date/Time | Oui | Date et heure du changement. |
| `date_creation` | Date/Time | Oui | Date de création du changelog. |

## 3. Contraintes et règles de gestion

- **Traçabilité** : `artefact_id` doit correspondre à un artefact existant dans le référentiel.
- **Séquence de versions** : `version_avant` et `version_apres` doivent respecter l'ordre chronologique.
- **Breaking change** : Un `type_changement: Mise_a_jour` avec `breaking_change: true` doit être associé à une demande de changement formelle (`OBJ-018`).

## 4. Relations

- **Lié à** : `OBJ-021-ConfigurationItems` (CI modifié).
- **Lié à** : `OBJ-010-Documents` (Document modifié).
- **Lié à** : `OBJ-028-Versions` (Version modifiée).
- **Lié à** : `OBJ-018-ChangeRequests` (Si breaking change).
- **Lié à** : `OBJ-004-Individus` (L'auteur du changement).

## 5. Troncs hérités

Cet objet hérite de :

- **EntitéVie** : titre, dates

```
Changelog
├── [EntitéVie]
│   ├── titre
│   ├── date_creation
│   └── date_changement
└── [Spécifique]
    ├── artefact_id
    ├── artefact_type
    ├── type_changement
    ├── version_avant
    ├── version_apres
    ├── description
    ├── auteur
    ├── impact
    └── breaking_change
```

## 6. Exemple JSON

```json
{
  "id_changelog": "f6a7b8c9-d0e1-2345-fabc-456789012345",
  "titre": "Migration base de données PostgreSQL 15",
  "artefact_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "artefact_type": "CI",
  "type_changement": "Mise_a_jour",
  "version_avant": "14.2",
  "version_apres": "15.1",
  "description": "Migration de la version 14.2 vers 15.1 pour support amélioré JSON et performances",
  "auteur": "d4e5f6a7-b8c9-0123-defa-234567890123",
  "impact": "Majeur",
  "breaking_change": true,
  "date_changement": "2026-07-10T09:00:00Z",
  "date_creation": "2026-07-10T09:00:00Z"
}
```
