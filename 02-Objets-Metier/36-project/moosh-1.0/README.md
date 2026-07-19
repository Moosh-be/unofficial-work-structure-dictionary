# Projet (OBJ-036) — Contexte Moosh v1.0

## Cadre

Ce document présente le contexte **Moosh** pour l'objet métier **Project (OBJ-036)**.

Moosh est le contexte personnel de l'auteur du Work Structure Dictionary. Il représente une approche empirique, issue de ~30 ans d'expérience terrain sur des projets de natures variées.

Ce contexte ne prétend pas être universel — il est positionné comme un point de départ, un laboratoire.

## Principes Moosh pour les projets

Un projet est un conteneur. Il n'existe que par et dans son conteneur (portefeuille, programme, domaine).

On distingue :
- Les outils de travail (OpenProject, Jira, MS Project) — conçus pour gérer des hiérarchies de projets
- Les outils de liste (SharePoint, Notion, Excel) — agnostiques mais flexibles, nécessitent une configuration

Approche itérative : on commence simple, on enrichit au fil du terrain.

## Objectif de ce contexte

Dans le contexte Moosh v1.0, un objet Project encode :
- Son identification (id, nom, description)
- Ses paramètres internes (type, statut, dates)
- Ses relations (parent/enfants, responsable)
- Sa configuration (types de work packages, workflows)
- Sa santé (indicateurs de suivi)

## Relations à d'autres contextes

- `pmi-1.0/` — Contexte PMI (PMBOK) : approche plus formelle, plus de champs de gouvernance
- `eu-1.0/` — Contexte UE (PM²) : approche européenne, contraintes institutionnelles
- `agile-1.0/` — Contexte Agile (Scrum/Kanban) : projet comme ensemble de work packages itératifs

## Notes de version

| Version | Date | Changement |
|---------|------|------------|
| 1.0 | 2026-07-19 | Première version du contexte Moosh |
