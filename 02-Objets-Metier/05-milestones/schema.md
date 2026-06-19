# Schema : Objet Milestone (OBJ-005)

## 1. Présentation

Cet objet représente un jalon significatif dans le cycle de vie du projet. Il marque un point de repère temporel majeur.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_milestone` | UUID | Oui | Identifiant unique du jalon. |
| `titre` | String | Oui | Intitulé du jalon. |
| `date_planifiee` | Date | Oui | Date prévue du jalon. |
| `date_reelle` | Date | Non | Date effective (après réalisation). |
| `type` | Enum | Oui | Catégorie (`Démarrage`, `Conception`, `Livraison`, `Revue`, `Clôture`, `Autre`). |
| `statut` | Enum | Oui | État (`Planifié`, `En cours`, `Atteint`, `Manqué`, `Reporté`). |
| `description` | Text | Non | Description de ce qui marque le jalon. |
| `deliverables_liés` | UUID[] | Non | Liste des livrables associés. |

## 3. Contraintes et règles de gestion

- **Immuable** : La `date_planifiee` ne doit pas être modifiée (créer un nouveau jalon révisé si nécessaire).
- **Ordonnancement** : Un jalon ne peut pas être `Atteint` avant sa `date_planifiee` (sauf dérogation).

## 4. Relations

- **Lié à** : `OBJ-002-Livrables` (Les livrables liés au jalon).
- **Lié à** : `OBJ-014-Calendar` (Le calendrier du projet).
- **Lié à** : `OBJ-003-Décisions` (Décisions de validation de phase).
