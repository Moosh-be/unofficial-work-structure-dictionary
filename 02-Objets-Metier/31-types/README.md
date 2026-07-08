# Types (OBJ-031)

Les Types définissent les catégories de WorkPackages disponibles dans le projet.

---

## Rôle

Les Types permettent de :

- **classifier** les WorkPackages par nature
- **personnaliser** les champs disponibles
- **définir** les workflows associés
- **faciliter** le filtrage et les rapports

---

## Types prédéfinis (OpenProject)

| Type | Icône | Usage |
|------|-------|-------|
| **Task** | Tâche | Travail de développement ou d'étude |
| **Milestone** | Jalon | Événement significatif dans le temps |
| **Phase** | Phase | Grande étape du projet |
| **Requirement** | Besoin | Exigence fonctionnelle ou non-fonctionnelle |
| **Change Request** | Demande | Proposition de changement |
| **Cost** | Dépense | Coût direct du projet |
| **Document** | Document | Pièce documentaire |
| **Bug** | Anomalie | Défaut ou problème identifié |

---

## Personnalisation

Les Types peuvent être personnalisés :

- **Icône** : Symbole visuel distinctif
- **Workflow** : Cycle de vie des statuts
- **Champs personnalisés** : Attributs spécifiques
- **Permissions** : Droits spécifiques par type
- **Requêtes par défaut** : Filtres pré-configurés

---

## Workflow par type

Chaque type a son propre workflow de statuts :

- **Task** : New → In Progress → Closed
- **Bug** : New → In Progress → Fixed → Verified → Closed
- **Requirement** : Proposed → Accepted → Implemented → Verified
- **Change Request** : Proposed → Under Review → Accepted/Rejected

---

## Principe

> Un bon typage rend le projet lisible.
> Trop de types = confusion. Pas assez = manque de précision.

---

## Normes existantes

- **PMBOK® Guide** — Classification et catégorisation des deliverables
- **ISO/IEC 26550** — Classification des exigences et artefacts
- **ITIL 4** — Service catalog et classification des services

---

## Outils connus

- **OpenProject** — WorkPackage types personnalisables natifs
- **Jira** — Issue types avec workflows et champs personnalisés
- **Azure DevOps** — WorkItem types (Bug, Task, Story, etc.)
- **ClickUp** — Custom status et type de tâches
- **Asana** — Portfolio item types
