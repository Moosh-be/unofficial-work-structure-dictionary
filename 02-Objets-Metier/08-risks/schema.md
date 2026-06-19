# Schema : Objet Risk (OBJ-008)

## 1. Présentation

Cet objet représente un risque identifié pour le projet. Il encode les caractéristiques du risque, son analyse et la réponse planifiée.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_risk` | UUID | Oui | Identifiant unique du risque. |
| `titre` | String | Oui | Intitulé court du risque. |
| `description` | Text | Oui | Description détaillée du risque. |
| `categorie` | Enum | Oui | Type (`Technique`, `Organisationnelle`, `Financière`, `Externe`, `Humaine`). |
| `probabilite` | Enum | Oui | Probabilité d survenance (`Forte`, `Moyenne`, `Faible`). |
| `impact` | Enum | Oui | Impact si réalisation (`Majeur`, `Moyen`, `Mineur`). |
| `score` | Integer | Non | Score = probabilité × impact (calculé automatiquement). |
| `plan_reponse` | Enum | Oui | Réponse planifiée (`Éviter`, `Atténuer`, `Transférer`, `Accepter`). |
| `plan_action` | Text | Non | Actions de mitigation prévues. |
| `responsable` | UUID | Oui | Personne responsable du suivi du risque. |
| `statut` | Enum | Oui | État (`Identifié`, `Actif`, `Réalisé`, `Inhibé`, `Clôturé`). |
| `date_creation` | Date/Time | Oui | Date d'identification. |
| `date_reelle_survenance` | Date | Non | Date de réalisation (si applicable). |

## 3. Contraintes et règles de gestion

- **Score** : Le `score` est calculé automatiquement (probabilité × impact).
- **Risques réalisés** : Un risque au statut `Réalisé` doit être relié à un incident ou problème.
- **Révision** : Les risques `Actifs` doivent être révisés régulièrement.

## 4. Relations

- **Lié à** : `OBJ-003-Décisions` (Décisions de traitement du risque).
- **Lié à** : `OBJ-004-Individus` (Le responsable du risque).
- **Lié à** : `OBJ-009-Budgets` (Contingence budgétaire).
