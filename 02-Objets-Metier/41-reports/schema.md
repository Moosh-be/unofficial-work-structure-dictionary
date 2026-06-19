# Schema : Objet Report (OBJ-041)

## 1. Présentation

Cet objet représente un rapport du projet. Il encode le type, la configuration, la planification et les destinataires.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_report` | UUID | Oui | Identifiant unique du rapport. |
| `nom` | String | Oui | Nom du rapport. |
| `type` | Enum | Oui | Type (`Burndown`, `Burnup`, `Velocity`, `Status`, `Budget`, `Risks`, `Time Entries`, `Progress`, `Gantt`, `Custom`). |
| `description` | Text | Non | Description du rapport. |
| `format` | Enum | Oui | Format de sortie (`PDF`, `Excel`, `PNG`, `HTML`). |
| `periodicite` | Enum | Non | Fréquence de génération (`Ponctuel`, `Hebdo`, `Mensuel`, `Par sprint`, `Par gate`). |
| `createur_id` | UUID | Oui | Personne ayant créé le rapport. |
| `est_auto_generé` | Boolean | Oui | Rapport généré automatiquement. |
| `last_generated` | Date/Time | Non | Date de dernière génération. |
| `is_public` | Boolean | Non | Visible par les Guests. |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Configuration du rapport (JSON)

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `configuration` | JSON | Oui | Paramètres du rapport. |
| `destinataires` | UUID[] | Oui | Destinataires du rapport. |

### Exemple de configuration

```json
{
  "filters": {
    "status": ["In Progress", "New"],
    "type": ["Task", "Bug"]
  },
  "visualization": {
    "chart_type": "bar",
    "group_by": "assigned_to",
    "metrics": ["count", "hours"]
  },
  "destinataires": ["user-123", "user-456"],
  "schedule": {
    "day_of_week": "friday",
    "time": "17:00"
  }
}
```

## 4. Contraintes et règles de gestion

- **Format valide** : Le `format` doit correspondre aux capacités du projet.
- **Destinataires valides** : Tous les destinataires doivent être membres ou guests du projet.

## 5. Relations

- **Lié à** : `OBJ-036-Project` (Le projet source).
- **Lié à** : `OBJ-026-WorkPackage` (WorkPackages analysés).
- **Lié à** : `OBJ-004-Individus` (Créateur et destinataires).
- **Lié à** : `OBJ-010-Documents` (Rapports générés).
