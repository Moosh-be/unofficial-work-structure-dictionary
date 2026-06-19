# Schema : Objet Resource (OBJ-006)

## 1. Présentation

Cet objet représente une ressource disponible pour le projet. Il encode les caractéristiques, capacités et disponibilité de la ressource.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_resource` | UUID | Oui | Identifiant unique de la ressource. |
| `nom` | String | Oui | Nom de la ressource. |
| `type` | Enum | Oui | Catégorie (`Humaine`, `Matérielle`, `Logicielle`, `Financière`). |
| `capacite` | Number | Oui | Capacité disponible (heures, unités, montant). |
| `unite` | String | Oui | Unité de mesure (heure, jour, €). |
| `coût_unitaire` | Number | Non | Coût par unité (si applicable). |
| `disponibilité` | Enum | Oui | État (`Disponible`, `Partiellement disponible`, `Indisponible`). |
| `date_debut` | Date | Non | Date de disponibilité. |
| `date_fin` | Date | Non | Date de fin de disponibilité. |

## 3. Contraintes et règles de gestion

- **Capacité positive** : La `capacite` doit être un nombre positif.
- **Période valide** : Si `date_debut` et `date_fin` sont renseignées, `date_debut` < `date_fin`.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (Pour les ressources humaines).
- **Lié à** : `OBJ-015-Assignation` (Les affectations concrètes).
- **Lié à** : `OBJ-009-Budgets` (Pour les ressources financières).
