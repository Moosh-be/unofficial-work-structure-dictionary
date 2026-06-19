# Schema : Objet Stakeholder (OBJ-007)

## 1. Présentation

Cet objet représente une partie prenante du projet. Il encode les informations de contact, l'influence et le niveau d'intérêt de chaque stakeholder.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_stakeholder` | UUID | Oui | Identifiant unique du stakeholder. |
| `nom` | String | Oui | Nom de la personne ou organisation. |
| `rôle` | String | Oui | Fonction / rôle dans le projet. |
| `categorie` | Enum | Oui | Type (`Interne`, `Externe`). |
| `influence` | Enum | Oui | Niveau d'influence (`Forte`, `Moyenne`, `Faible`). |
| `interet` | Enum | Oui | Niveau d'intérêt (`Fort`, `Moyen`, `Faible`). |
| `attitude` | Enum | Non | Positionnement (`Soutien`, `Neutre`, `Opposition`). |
| `strategie` | Text | Non | Stratégie de gestion définie. |
| `contact_principal` | String | Non | Email ou téléphone du contact. |

## 3. Contraintes et règles de gestion

- **Mise à jour** : L'attitude et la stratégie doivent être réévaluées régulièrement.
- **Traçabilité** : Toute évolution de positionnement doit être documentée.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (Si le stakeholder est une personne physique).
- **Lié à** : `OBJ-010-Documents` (Plans de communication).
