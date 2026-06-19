# Schema : Objet News (OBJ-029)

## 1. Présentation

Cet objet représente une actualité ou une annonce du projet. Il encode le message, l'auteur et les destinataires.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_news` | UUID | Oui | Identifiant unique de l'actualité. |
| `titre` | String | Oui | Titre accrocheur. |
| `body` | Text | Oui | Corps du message (supporte Markdown). |
| `auteur_id` | UUID | Oui | Personne ayant publié. |
| `categorie` | Enum | Oui | Type (`Annonce`, `Mise à jour`, `Alerte`, `Événement`, `Célébration`). |
| `date_publication` | Date/Time | Oui | Date de publication. |
| `est_pinned` | Boolean | Non | Annoncée épinglée (toujours visible). |
| `created_on` | Date/Time | Oui | Date de création. |
| `updated_on` | Date/Time | Oui | Dernière modification. |

## 3. Contraintes et règles de gestion

- **Auteur** : `auteur_id` doit être membre du projet.
- **Pinned limité** : Un maximum de 3 News épinglées simultanément.

## 4. Relations

- **Lié à** : `OBJ-007-Stakeholders` (Destinataires des annonces).
- **Lié à** : `OBJ-004-Individus` (L'auteur).
- **Lié à** : `OBJ-026-WorkPackage` (Annonce liée à un WorkPackage).
