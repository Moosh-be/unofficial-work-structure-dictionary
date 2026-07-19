# Project (OBJ-036) — Contexte OpenProject v1.0

## Cadre

Ce document présente le contexte **OpenProject** pour l'objet métier **Project (OBJ-036)**.

OpenProject structure les projets via une hiérarchie native :
- **Portfolio** → **Projet** → **Sous-projet**
- Chaque niveau hérite des configurations du parent
- Les configurations (types de WorkPackages, workflows) se propagent par héritage

## Principes OpenProject pour les projets

- Un projet OpenProject est l'entité racine de gestion
- La hiérarchie Portfolio → Projet → Sous-projet est native
- Les configurations se propagent par héritage
- Chaque projet a ses types de WorkPackages personnalisés
- Les workflows sont liés aux types de WorkPackages
- La santé du projet se visualise en vue Dashboard

## Différences avec Moosh

| Aspect | Moosh | OpenProject |
|--------|-------|-------------|
| Hiérarchie | parent_id explicite | Portfolio → Projet → Sous-projet (natif) |
| Configuration | JSON config (work_package_types, workflows) | Types de WorkPackages natifs + workflows |
| Santé | JSON health (spend_variance, schedule_variance) | Dashboard natif avec KPIs |
| Permissions | Champs is_public, membres | Groupes OpenProject + permissions par rôle |
| Budgets | Champ budget_total | Budgets par WorkPackage + roll-up |

## Notes de version

| Version | Date | Changement |
|---------|------|------------|
| 1.0 | 2026-07-19 | Première version du contexte OpenProject |
