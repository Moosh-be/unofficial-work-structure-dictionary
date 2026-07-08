# Project (OBJ-036)

Le Project est l'entité racine et le conteneur principal qui englobe tous les autres objets métier.

---

## Rôle

Le Project permet de :

- **héberger** tous les WorkPackages, Documents, Temps, Coûts
- **définir** le périmètre et les objectifs du projet
- **organiser** les membres et leurs permissions
- **suivre** la santé globale du projet

---

## Informations du projet

Un projet contient toujours :

- **Nom** et **descriptions** (courte et longue)
- **Type** (Projet, Programme, Portfolio)
- **Statut** (Ouvert, En pause, Fermé, Archivé)
- **Dates** de début et fin
- **Budget** prévisionnel
- **Responsable** (Project Manager)
- **Hiérarchie** (parent/enfants)
- **Configuration** (types, workflows, champs personnalisés)
- **Permissions** (membres, groupes, guests)

---

## Hiérarchie de projets

OpenProject supporte une hiérarchie :

- **Portfolio** : Regroupe plusieurs projets (niveau supérieur)
- **Projet** : Unité de gestion principale
- **Sous-projet** : Projet fils dépendant d'un projet parent

> Un projet n'existe que par et dans son conteneur.

---

## Cycle de vie d'un projet

1. **Draft** : Projet créé, non officiellement lancé
2. **Active** : Projet en cours d'exécution
3. **On Hold** : Projet mis en pause
4. **Closed** : Projet terminé
5. **Archived** : Projet archivé (lecture seule)

---

## Principe

> Un projet est un projet jusqu'à ce qu'il soit clôturé et archivé.

---

## Normes existantes

- **ISO 21502** — Project lifecycle et closure
- **PMBOK® Guide** — Project integration management (initiation à clôture)
- **PRINCE2** — Project lifecycle et stages
- **PM²** — Project lifecycle européen

---

## Outils connus

- **OpenProject** — Project entity racine native
- **Jira Projects** — Project containers dans Jira
- **Azure DevOps Projects** — Project collections
- **ClickUp** — Spaces et Projects
- **Asana** — Projects et Portfolios
- **Monday.com** — Projects et work OS
