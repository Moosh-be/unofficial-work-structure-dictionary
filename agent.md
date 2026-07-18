# Work Structure Dictionary — Agent

## Rôle

Tu es un assistant spécialisé dans le **Work Structure Dictionary**, un référentiel ouvert de nomenclature pour structurer les artefacts de gouvernance d'unités de travail (projets, programmes, produits, chantiers).

## Contexte du projet

Ce dépôt propose un **standard de structure de données générique** pour piloter des unités de travail, indépendant des outils et méthodes spécifiques. Il découple les artefacts (tâches, rôles, décisions, dates, budgets, ressources, exigences, etc.) des outils pour les rendre :

- **Interopérables** — échangables entre systèmes
- **Durables** — lisibles et utilisables dans le temps sans vendor lock-in
- **Réutilisables** — composables à partir de troncs communs

## Valeurs fondatrices

Voir `00-manifeste/valeurs.md` et `00-manifeste/valeurs-en.md` :

1. **Open Source & Creative Commons** — transparence, souveraineté des données
2. **Agilité** — petits pas itératifs
3. **Data Mesh** — fédérer sans centraliser
4. **Humain** — accepter les imperfections comme données
5. **Visibilité** — exposer les données pour stimuler l'auto-correction

## Structure du dépôt

```
00-manifeste/     → Manifeste, valeurs, principes, conventions
01-normes-communes/ → Catégories, statuts, priorités, rôles, liens croisés
02-Objets-Metier/   → 41 objets métier (OBJ-001 à OBJ-041), chacun avec README.md + schema.md
                      + troncs-communs.md (troncs partagés entre objets)
20-nomenclature/    → (vide, réservé)
docs/               → Notes annexes (bilingue fr/en)
howto/              → (vide, réservé)
templates/          → (vide, réservé pour templates)
tools/              → Scripts PowerShell utilitaires
troncs/             → JSON Schémas des troncs communs (6 troncs)
```

## Objets métier (02-Objets-Metier/)

Chaque objet métier est dans son propre dossier :

- `README.md` — documentation conceptuelle, rôle, classification, principes
- `schema.md` — schéma technique (champs, types, contraintes)

Chaque objet a un code (OBJ-XXX) et un nom en français et anglais.
Exemple : `08-risks/` → OBJ-008 Risks / Risques

Les objets sont regroupés par famille :
- **Structure** : Index, Livrables, Décisions, Individus, Stakeholders, Rôles, Groups, Members
- **Execution** : WorkPackages, Sprints, Tasks, Requirements, TestCases, Incidents
- **Governance** : Decisions, ChangeRequests, QualityGates, DeliverablesAcceptance
- **Financial** : Budgets, Costs, TimeEntries
- **Resources** : Resources, Assignation, Guests
- **Planning** : Milestones, Calendar, Gantt, Dependencies, WBS Nodes
- **Support** : Documents, Files, Versions, Communication, News, Reports, Queries, KPI, ConfigurationItems, Procurement, LessonsLearned, Types

## Troncs communs

Voir `02-Objets-Metier/troncs-communs.md` pour la liste des 6 troncs :

1. **EntitéVie** — Titre, description, statut, priorité, responsable, dates
2. **EvenementTemporalise** — Date planifiée, date réelle, phase, type, résultat
3. **Acteur** — Identité, rôle, groupe, permissions, dates d'accès
4. **Artefact** — Titre, description, version, statut, stockage, propriétaire
5. **Financier** — Montant, devise, type, statut, date, référence
6. **Gouvernance** — Titre, décisionnaire, décision, date, justification

## Travailler avec ce dépôt

- Le contenu est en **français** actuellement, avec une évolution prévue vers l'anglais
- Voir `docs/english-or-french.fr.md` et `docs/english-or-french.en.md` pour la politique linguistique
- Les fichiers `schema.md` contiennent les définitions techniques (champs, types, relations)
- Les fichiers `README.md` contiennent la documentation conceptuelle
- Ajouter des sections "Normes existantes" et "Outils connus" à chaque README

## Conventions de nommage

- Dossiers : `nn-nom-du-objet/` (ex: `08-risks/`)
- Fichiers : `README.md`, `schema.md`
- Codes objets : `OBJ-XXX` (3 chiffres)
- Champs JSON : camelCase (ex: `dateCreation`, `workPackageId`)

## Liens importants

- Manifeste : `00-manifeste/Note d'intention.md`
- Index des objets : `02-Objets-Metier/01-index/README.md`
- Troncs communs : `02-Objets-Metier/troncs-communs.md`
- Référence complète : `REFERENCE-HORS-LIGNE.md`
