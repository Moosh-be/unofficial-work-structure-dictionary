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
00-manifeste/         → Manifeste, valeurs, principes, conventions
01-normes-communes/   → Catégories, statuts, priorités, rôles, liens croisés
02-Objets-Metier/     → 41 objets métier (OBJ-001 à OBJ-041), chacun avec README.md + schema.md
                        + troncs-communs.md (troncs partagés entre objets)
20-nomenclature/      → (vide, réservé)
docs/                 → Notes annexes (bilingue fr/en)
howto/                → (vide, réservé)
templates/            → (vide, réservé pour templates)
tools/                → Scripts PowerShell utilitaires
troncs/               → JSON Schémas des troncs communs (6 troncs)
```

---

## Agent : Manifeste

### Contenu

- `00-manifeste/README.md` — (vide, potentiellement un sommaire)
- `00-manifeste/Note d'intention.md` — Document de genèse, vision et motivations de l'auteur
- `00-manifeste/valeurs.md` — Les 5 valeurs fondamentales (Open Source, Agilité, Data Mesh, Humain, Visibilité)
- `00-manifeste/valeurs-en.md` — Version anglaise des valeurs
- `00-manifeste/principes.md` — (vide)
- `00-manifeste/conventions-nommage.md` — Conventions de nommage en cours de définition
- `00-manifeste/versionnement.md` — (vide)

### Rôle

Cette section contient la **vision**, les **valeurs** et les **principes** fondateurs du projet.
C'est le contexte philosophique et motivationnel qui éclaire toutes les décisions techniques.

### Politique linguistique

Actuellement en français, avec une évolution prévue vers l'anglais.
Voir `docs/english-or-french.fr.md` pour le positionnement complet.

---

## Agent : Normes Communes

### Contenu

- `01-normes-communes/README.md` — (vide, potentiellement un sommaire)
- `01-normes-communes/categories.md` — Catégories des objets
- `01-normes-communes/liens-croises.md` — Liens entre objets
- `01-normes-communes/priorites.md` — Niveaux de priorité
- `01-normes-communes/roles.md` — Définition des rôles
- `01-normes-communes/statuts.md` — Cyclès de vie et statuts

### Rôle

Cette section définit les **standards transversaux** qui s'appliquent à tous les objets métier :
- Statuts (New, In Progress, Closed, etc.)
- Priorités (Low, Medium, High, Very High)
- Catégories
- Rôles communs
- Liens croisés entre objets

---

## Agent : Objets Métier

### Structure

Chaque objet métier a son propre dossier dans `02-Objets-Metier/` :

```
02-Objets-Metier/nn-nom-du-objet/
├── README.md    → Documentation conceptuelle (rôle, classification, principes)
└── schema.md    → Schéma technique (champs, types, contraintes, relations)
```

### Fichier de référence

- `02-Objets-Metier/troncs-communs.md` — Définit les 6 troncs communs et les héritages entre objets
- `02-Objets-Metier/01-index/README.md` — Index de tous les objets

### Pour chaque objet

Lorsque tu travailles sur un objet métier :

1. **README.md** doit contenir :
   - Titre et description de l'objet
   - Section "Rôle" : à quoi sert cet objet
   - Section(s) de classification ou caractéristiques
   - Section "Principe" : citation ou principe fondamental
   - Section "Normes existantes" : standards et frameworks de référence
   - Section "Outils connus" : outils qui implémentent ou supportent cet objet

2. **schema.md** doit contenir :
   - Description de l'objet
   - Tableau des champs (nom, type, obligatoire, description)
   - Règles de gestion
   - Relations avec d'autres objets
   - Éventuellement un exemple JSON

### Familles d'objets

Chaque objet a un code (OBJ-XXX) et un nom en français et anglais.
Exemple : `08-risks/` → OBJ-008 Risks / Risques

Par codes :

| Famille      | Objets                                      |
|--------------|---------------------------------------------|
| **Structure** | OBJ-001, 002, 003, 004, 007, 030, 037, 038  |
| **Execution** | OBJ-013, 012, 022, 026, 035                  |
| **Governance**| OBJ-003, 016, 018, 019                       |
| **Financial** | OBJ-009, 033, 027                            |
| **Resources** | OBJ-006, 015, 034                            |
| **Planning**  | OBJ-005, 014, 040, 025, 024                  |
| **Support**   | OBJ-010, 032, 028, 017, 029, 041, 039, 011, 021, 020, 023, 031, 008, 036 |

Par noms :

- **Structure** : Index, Livrables, Décisions, Individus, Stakeholders, Rôles, Groups, Members
- **Execution** : WorkPackages, Sprints, Tasks, Requirements, TestCases, Incidents
- **Governance** : Decisions, ChangeRequests, QualityGates, DeliverablesAcceptance
- **Financial** : Budgets, Costs, TimeEntries
- **Resources** : Resources, Assignation, Guests
- **Planning** : Milestones, Calendar, Gantt, Dependencies, WBS Nodes
- **Support** : Documents, Files, Versions, Communication, News, Reports, Queries, KPI, ConfigurationItems, Procurement, LessonsLearned, Types

---

## Agent : Troncs Communs

### Les 6 troncs

| Tronc                     | Fichier JSON                          | Description                                         |
|---------------------------|---------------------------------------|-----------------------------------------------------|
| **EntitéVie**             | `troncs/entite-vie.schema.json`       | Cycle de vie : titre, description, statut, priorité, responsable, dates |
| **EvenementTemporalise**  | `troncs/evenement.schema.json`        | Jalons temporels : date planifiée, date réelle, phase, résultat |
| **Acteur**                | `troncs/acteur.schema.json`           | Personnes et accès : identité, rôle, permissions, dates |
| **Artefact**              | `troncs/artefact.schema.json`         | Livrables et documents : titre, version, stockage, propriétaire |
| **Financier**             | `troncs/financier.schema.json`        | Coûts et budgets : montant, devise, référence, date |
| **Gouvernance**           | `troncs/gouvernance.schema.json`      | Décisions : décisionnaire, décision, justification  |

### Composition de terrain

Dans la réalité, un artefact de terrain combine **plusieurs troncs**.
Exemple : un incident PROD combine EntitéVie + Gouvernance + Financier + EvenementTemporalise.

Voir `02-Objets-Metier/troncs-communs.md` pour tous les détails, les scénarios de composition et les objets composés futurs.

### Règles d'interopérabilité

Quand on échange des données avec un système externe :
1. Identifier le tronc le plus proche (matching sur les champs présents)
2. Fusionner les champs reçus avec les champs locaux manquants
3. Conserver les champs externes dans un bloc `origine_externe`
4. Générer un nouvel objet ou mettre à jour un existant

---

## Travailler avec ce dépôt

- Le contenu est en **français** actuellement, avec une évolution prévue vers l'anglais
- Voir `docs/english-or-french.fr.md` et `docs/english-or-french.en.md` pour la politique linguistique
- Les fichiers `schema.md` contiennent les définitions techniques (champs, types, relations)
- Les fichiers `README.md` contiennent la documentation conceptuelle
- Ajouter des sections "Normes existantes" et "Outils connus" à chaque README

---

## Conventions de nommage

- Dossiers : `nn-nom-du-objet/` (ex: `08-risks/`)
- Fichiers : `README.md`, `schema.md`
- Codes objets : `OBJ-XXX` (3 chiffres)
- Champs JSON : camelCase (ex: `dateCreation`, `workPackageId`)

---

## Liens importants

- Manifeste : `00-manifeste/Note d'intention.md`
- Index des objets : `02-Objets-Metier/01-index/README.md`
- Troncs communs : `02-Objets-Metier/troncs-communs.md`
- Référence complète : `REFERENCE-HORS-LIGNE.md`
