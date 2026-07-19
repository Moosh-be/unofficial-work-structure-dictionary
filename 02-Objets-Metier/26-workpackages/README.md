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

Les WorkPackages peuvent prendre les types suivants :

| Type | Description | Hiérarchie |
|------|-------------|------------|
| **Programme** | Ensemble de projets liés | Racine |
| **Projet** | Unité de gestion principale | Enfant de Programme |
| **Produit** | Livrable principal | Enfant de Programme/Projet |
| **Domaine** | Thème fonctionnel | Enfant de Programme |
| **Epic** | Grande feature (agile) | Enfant de Projet/Domaine |
| **Feature** | Fonctionnalité | Enfant d'Epic |
| **Tâche** | Travail de développement | Enfant de Feature/Epic |
| **Sous-tâche** | Tâche imbriquée | Enfant de Tâche |
| **Milestone** | Jalon du projet | Racine/Projet |
| **Phase** | Phase majeure | Enfant de Projet |
| **Requirement** | Besoin ou exigence | Enfant de Feature |
| **Change Request** | Demande de changement | Racine |
| **Bug** | Anomalie ou défaut | Enfant de Feature/Tâche |

> Tous ces types partagent les mêmes métadonnées : statut, priorité, responsable, dates, relations, temps passé, etc.
> La couleur et la hiérarchie (wp_parent) permettent de visualiser la structure dans les outils.

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
- Des **relations** (dépendances, liens)
- Des **couleurs** de catégorisation visuelle
- Une **hiérarchie** (wp_parent) permettant une arborescence multi-niveaux

---

## Hiérarchie des WorkPackages

Un WorkPackage peut avoir un parent (wp_parent), permettant une structure en arbre :

```
Programme
├── Projet Alpha
│   ├── Epic A
│   │   ├── Feature A1
│   │   │   ├── Tâche A1.1
│   │   │   └── Tâche A1.2
│   │   └── Feature A2
│   └── Epic B
└── Projet Beta
    └── Feature B1
```

> La hiérarchie (wp_parent) permet de suivre l'avancement en cascade : un Epic n'est terminé que si toutes ses Features le sont.

---

## Cycle de vie d'un WorkPackage

1. **New** : WorkPackage créé, non démarré
2. **In Progress** : Travail en cours
3. **Pending** : En attente d'une dépendance ou décision
4. **Closed** : WorkPackage terminé
5. **Rejected** : WorkPackage refusé (Change Request)
6. **Timed Out** : WorkPackage expiré (délai dépassé)

---

## Normes existantes

- **ISO 21502** — Work Breakdown Structure (WBS) et lots de travail
- **PMBOK® Guide** — Work packages comme élément fondamental du périmètre
- **PRINCE2** — Work packages comme unités de contrôle du projet

---

## Outils connus

- **OpenProject** — WorkPackages comme entité centrale unifiée
- **Jira** — Issues / tickets comme équivalent
- **Azure DevOps** — WorkItems
- **ClickUp** — Tasks et subtasks
- **Asana** — Tasks et portfolios
- **Monday.com** — Items dans des workflows
