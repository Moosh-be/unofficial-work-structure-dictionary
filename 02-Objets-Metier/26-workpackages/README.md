# WorkPackage (OBJ-026)

Le WorkPackage est l'entité centrale et universelle d'OpenProject. C'est un conteneur générique qui représente toute unité de travail, quel que soit son type.

---

## Rôle

Le WorkPackage permet de :

- **unifier** toutes les unités de travail sous un même modèle
- **gérer** tâches, bugs, besoins, milestones, versions dans un système cohérent
- **suivre** l'avancement, les coûts et les temps passés
- **relier** les différentes entités entre elles

---

## Types de WorkPackages

OpenProject supporte plusieurs types de work packages :

| Type | Description |
|------|-------------|
| **Task** | Tâche de travail classique |
| **Milestone** | Jalon du projet |
| **Phase** | Phase majeure (réutilisé comme nœud WBS) |
| **Milestone** | Jalon |
| **Milestone** | Jalon de phase |
| **Milestone** | Jalon de projet |
| **Requirement** | Besoin ou exigence |
| **Change Request** | Demande de changement |
| **Cost** | Dépense |
| **Document** | Document lié |
| **Bug** | Bug ou défaut |
| **Time Entry** | Saisie de temps |

> Tous ces types partagent les mêmes métadonnées : statut, priorité, responsable, dates, relations, temps passé, etc.

---

## Propriétés universelles

Un WorkPackage possède toujours :

- Un **titre** et une **description**
- Un **type** (Task, Bug, Requirement, etc.)
- Un **statut** (New, In Progress, Closed, etc.)
- Une **priorité** (Low, Medium, High, Very High)
- Un **responsable** assigné
- Un **reporting-to** (parent)
- Des **dates** (planifiées et réelles)
- Un **budget** estimé
- Des **temps passés**
- Des **relations** (dépendances, liens)
- Des **versions** associées
- Des **fichiers** joints

---

## Principe

> Le WorkPackage est le Légo d'OpenProject : tous les éléments du projet sont des briques WorkPackage.

Cette uniformité permet la traçabilité croisée, les rapports unifiés et la simplicité d'utilisation.
