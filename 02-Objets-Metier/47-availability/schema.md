# Schema : Objet Availability (OBJ-047)

## 1. Présentation

Cet objet représente une période d'indisponibilité d'une ressource. Il encode la personne concernée, la période, le type d'absence et le contexte.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_availability` | UUID | Oui | Identifiant unique de l'indisponibilité. |
| `titre` | String | Oui | Intitulé court (ex: "Congés estivaux"). |
| `person_id` | UUID | Oui | Ressource concernée. |
| `date_debut` | Date | Oui | Date de début de l'indisponibilité. |
| `date_fin` | Date | Oui | Date de fin de l'indisponibilité. |
| `type` | Enum | Oui | Type (`Conges_payes`, `RTT`, `Formation`, `Maladie`, `Maternite`, `Paternite`, `Service_militaire`, `Autre`). |
| `jours_calculés` | Integer | Non | Nombre de jours ouvrés (calculé). |
| `statut` | Enum | Non | État (`Planifie`, `Approuve`, `Annule`, `En_cours`). |
| `justification` | Text | Non | Motif ou pièce justificative (lien vers Document). |
| `date_creation` | Date/Time | Oui | Date de création. |
| `date_mise_a_jour` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Période** : `date_debut` doit être antérieure ou égale à `date_fin`.
- **Jours calculés** : `jours_calculés` est calculé automatiquement à partir de `date_debut` et `date_fin` (jours ouvrés, hors week-ends et jours fériés).
- **Chevauchement** : Deux disponibilités d'un même type ne doivent pas se chevaucher pour une même personne (sauf `Formation` + `Conges_payes`).
- **Statut** : Une disponibilité `Planifie` peut être modifiée ; une fois `Approuve`, seule la modification via demande formelle est autorisée.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (La personne concernée).
- **Lié à** : `OBJ-015-Assignation` (Pour le capacity planning : exclure les assignations sur ces périodes).
- **Lié à** : `OBJ-010-Documents` (Justification / pièce jointe).

## 5. Troncs hérités

Cet objet hérite de :

- **EntitéVie** : titre, statut, dates
- **Acteur** : person_id (référence à la ressource)

```
Availability
├── [EntitéVie]
│   ├── titre
│   ├── statut
│   ├── date_creation
│   └── date_mise_a_jour
├── [Acteur]
│   └── person_id
└── [Spécifique]
    ├── date_debut
    ├── date_fin
    ├── type
    ├── jours_calculés (calculé)
    └── justification
```

## 6. Exemple JSON

```json
{
  "id_availability": "e5f6a7b8-c9d0-1234-efab-345678901234",
  "titre": "Congés d'été",
  "person_id": "d4e5f6a7-b8c9-0123-defa-234567890123",
  "date_debut": "2026-07-20",
  "date_fin": "2026-08-03",
  "type": "Conges_payes",
  "jours_calculés": 11,
  "statut": "Approuve",
  "justification": null,
  "date_creation": "2026-06-01T10:00:00Z",
  "date_mise_a_jour": "2026-06-10T15:30:00Z"
}
```
