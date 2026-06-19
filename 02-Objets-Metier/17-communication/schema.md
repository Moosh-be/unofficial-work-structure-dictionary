# Schema : Objet Communication (OBJ-017)

## 1. Présentation

Cet objet représente un flux ou artefact de communication du projet. Il encode les règles de diffusion, les destinataires et les formats.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_communication` | UUID | Oui | Identifiant unique du flux de communication. |
| `titre` | String | Oui | Intitulé de l'information. |
| `type` | Enum | Oui | Type (`Réunion`, `Rapport`, `Note`, `Email`, `Alerte`). |
| `message` | Text | Oui | Contenu de l'information. |
| `destinataires` | UUID[] | Oui | Liste des destinataires. |
| `expediteur` | UUID | Oui | Personne qui émet. |
| `canal` | Enum | Oui | Canal utilisé (`Email`, `Réunion`, `Outil`, `PV`, `Autre`). |
| `frequence` | Enum | Non | Fréquence (`Ponctuel`, `Hebdo`, `Mensuel`, `Par événement`). |
| `date_diffusion` | Date/Time | Oui | Date de diffusion. |
| `lecture_accusee` | Boolean | Non | Accusé de lecture requis. |

## 3. Contraintes et règles de gestion

- **Destinataires** : Tous les destinataires doivent être des stakeholders ou membres de l'équipe.
- **Traçabilité** : Toute information officielle doit avoir un destinataire défini.

## 4. Relations

- **Lié à** : `OBJ-007-Stakeholders` (Les destinataires).
- **Lié à** : `OBJ-004-Individus` (L'expéditeur).
- **Lié à** : `OBJ-010-Documents` (Pièces jointes ou comptes-rendus).
