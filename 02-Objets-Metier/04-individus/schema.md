# Schema : Objet Individu (OBJ-004)

## 1. Présentation

Cet objet représente une personne physique impliquée dans le projet. Il stocke les informations de contact et les compétences de l'individu, indépendamment des rôles qu'il occupe.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_individu` | UUID | Oui | Identifiant unique de la personne. |
| `nom` | String | Oui | Nom de famille. |
| `prenom` | String | Oui | Prénom. |
| `email` | String | Oui | Email professionnel. |
| `telephone` | String | Non | Téléphone professionnel. |
| `organisation` | String | Non | Organisation / service d'appartenance. |
| `competences` | Text | Non | Liste des compétences principales. |
| `statut` | Enum | Oui | État (`Actif`, `Inactif`, `Parti`). |
| `date_creation` | Date/Time | Oui | Horodatage de création. |

## 3. Contraintes et règles de gestion

- **Protection des données** : Les informations personnelles doivent être traitées conformément au RGPD.
- **Unicité** : Le couple `nom` + `email` doit être unique.

## 4. Relations

- **Lié à** : `OBJ-015-Assignation` (Les rôles occupés par l'individu).
- **Lié à** : `OBJ-003-Décisions` (Les décisions prises par l'individu).
