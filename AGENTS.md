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
00-manifeste/         → Tronc "Vie du repo" — origine, histoire, règles, valeurs, principes, versionnement
01-normes-communes/   → Tronc "Norme" — éléments transversaux (statuts, priorités, rôles, catégories, liens)
02-Objets-Metier/     → 41 objets métier (OBJ-001 à OBJ-041), chacun avec README.md + schema.md
                        + troncs-communs.md (troncs partagés entre objets)
                        + [contexte]-[version]/ pour chaque version contextualisée
03-analyses/          → Tronc "Analyses" — philosophie, pédagogie, réflexion, contexte
04-references/        → Index croisés — outils, méthodes, normes internationales
docs/                 → Notes annexes (bilingue fr/en)
templates/            → Templates pour objets métier
tools/                → Scripts PowerShell utilitaires
troncs/               → JSON Schémas des troncs communs (6 troncs)
```

---

## Agent : Manifeste

### Contenu

- `00-manifeste/README.md` — Survol du manifeste
- `00-manifeste/Note d'intention.md` — Document de genèse, vision et motivations de l'auteur
- `00-manifeste/valeurs.md` — Les 5 valeurs fondamentales (Open Source, Agilité, Data Mesh, Humain, Visibilité)
- `00-manifeste/valeurs-en.md` — Version anglaise des valeurs
- `00-manifeste/principes.md` — 10 principes directeurs
- `00-manifeste/conventions-nommage.md` — Conventions de nommage
- `00-manifeste/versionnement.md` — Versionnement à 2 axes (classique + contexte)

### Rôle

Ce dossier est le **tronc "Vie du repo"**. Il décrit d'où vient le projet, comment il fonctionne, ses règles, ses outils, son approche. C'est le contexte philosophique et motivationnel qui éclaire toutes les décisions techniques.

### Politique linguistique

Actuellement en français, avec une évolution prévue vers l'anglais.
Voir `docs/english-or-french.fr.md` pour le positionnement complet.

---

## Agent : Normes Communes

### Contenu

- `01-normes-communes/README.md` — Survol des normes transversales
- `01-normes-communes/categories.md` — Catégories des objets
- `01-normes-communes/liens-croises.md` — Liens entre objets
- `01-normes-communes/priorites.md` — Niveaux de priorité
- `01-normes-communes/roles.md` — Définition des rôles
- `01-normes-communes/statuts.md` — Cycles de vie et statuts

### Rôle

Cette section définit les **standards transversaux** qui s'appliquent à tous les objets métier :
- Statuts (New, In Progress, Closed, etc.)
- Priorités (Low, Medium, High, Very High)
- Catégories
- Rôles communs
- Liens croisés entre objets
- Identifications et tracings (comment on construit les identifiants, comment on relie les objets)

---

## Agent : Objets Métier

### Structure

Chaque objet métier a son propre dossier dans `02-Objets-Metier/` :

```
02-Objets-Metier/nn-nom-du-objet/
├── README.md            → Documentation conceptuelle (rôle, classification, principes)
├── schema.md            → Schéma technique (champs, types, contraintes, relations)
└── [contexte]-[version]/ → Versions contextualisées
```

Chaque sous-dossier de version contient :
```
[contexte]-[version]/
├── README.md              → Intro : cadre, contexte, principes
├── SPEC.md                → Spécification formelle : chaque champ, type, contrainte, règles
│
├── data.json              → Template JSON (valeurs vides)
├── data.xml               → Template XML (balises vides)
├── data.csv               → Template CSV (en-tête seul)
├── data.sql               → Template SQL (CREATE TABLE sans INSERT)
│
├── <nom>-<dataset>-<lang>-v<n°>.<fmt> → Dataset (données conventionnelles réelles)
├── <nom>-<example>-<lang>-v<n°>.<fmt> → Example (valeurs factices lorem ipsum)
└── compare.md             → Notes de version, différences avec autres contextes
```

### Convention de nommage des datasets/examples

```
<nom-objet>-<type>-<langue>-v<n°>.<format>

Exemples :
decisions-pm2-fr-v1.csv        → Décisions, dataset PM², français, version 1, CSV
decisions-pmi-en-v1.json       → Décisions, dataset PMI, anglais, version 1, JSON
decisions-eu-de-v1.xml         → Décisions, dataset UE, allemand, version 1, XML
decisions-example-fr-v1.csv    → Décisions, example générique, français, version 1, CSV
decisions-lorem-en-v1.json     → Décisions, lorem ipsum, anglais, version 1, JSON
```

### Fichier de référence

- `02-Objets-Metier/troncs-communs.md` — Définit les 6 troncs communs et les héritages entre objets
- `02-Objets-Metier/01-index/README.md` — Index de tous les objets

### Pour chaque objet (niveau conceptuel)

Lorsque tu travailles sur un objet métier (niveau conceptuel, hors version) :

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

## Agent : Analyses

### Contenu

- `03-analyses/README.md` — Vue d'ensemble de la partie "organique"
- `03-analyses/01-pourquoi/` — Pourquoi ce référentiel ? Pourquoi ces normes ?
- `03-analyses/02-existants/` — Analyse des existants (outils, méthodes, normes)
- `03-analyses/03-demarche/` — Comment on s'y prend (démarche)
- `03-analyses/04-contextes/` — Liste des contextes

### Rôle

Ce dossier est la partie **organique** du projet. Là où les normes sont froides, tranchées, le résultat — les analyses sont l'exploration, la réflexion, le "pourquoi" et le "comment".

- Un registre des risques, pourquoi ? Pas juste "comment le remplir"
- Une décision, comment identifier qu'un risque est un risque et pas un incident ?
- La méthodologie, ce n'est pas une méthode de plus — c'est la réflexion sur comment approcher la gouvernance

### Contextes

Chaque contexte = une autorité qui décide "la norme, c'est comme ça".

Exemples : `moosh` (auteur), `pmi`, `eu`, `microsoft`, `safer`, `pmi`...

Chaque objet métier peut avoir des variantes selon le contexte. La version est préfixée avec le contexte : `OBJ-008-1.0-pmi`.

Les données d'un contexte préfixent le numéro de version traditionnel :
- `moosh-1.0/` → Contexte auteur, version 1.0
- `pmi-1.0/` → Contexte PMI, version 1.0
- `eu-2.0/` → Contexte UE, version 2.0

Voir `03-analyses/04-contextes/README.md` pour la liste complète.

---

## Agent : References

### Contenu

- `04-references/README.md` — Vue d'ensemble des index
- `04-references/outils.md` — Index des outils (Jira, MS Project, Planner, Excel, Confluence, Notion, Obsidian, OpenProject, Azure DevOps, ClickUp, Asana, Monday.com...)
- `04-references/methodes.md` — Index des méthodes (SAFe, PMBOK, PM², Lean, PRINCE2, ITIL 4, TOGAF, ADKAR...)
- `04-references/normes.md` — Index des normes (ISO 21502, ISO 9001, COBIT, INSPIRE, DCAT, ISO 25010...)

### Rôle

Ce dossier indexe les outils, méthodes et normes internationales en relation avec le Work Structure Dictionary.

Chaque entrée contient :
- Nom de l'outil/méthode/norme
- Lien vers documentation officielle
- Objets de la norme couverts
- Comment synchroniser (si applicable)

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
- Pour les versions contextualisées : chaque objet métier peut avoir des sous-dossiers `[contexte]-[version]/` contenant README, SPEC, templates (data.json, data.xml, data.csv, data.sql), datasets, examples et notes de comparaison

---

## Conventions de nommage

- Dossiers : `nn-nom-du-objet/` (ex: `08-risks/`)
- Fichiers : `README.md`, `schema.md`, `SPEC.md`
- Codes objets : `OBJ-XXX` (3 chiffres)
- Champs JSON : camelCase (ex: `dateCreation`, `workPackageId`)
- Dossiers version : `[contexte]-[version]/` (ex: `moosh-1.0/`, `pmi-2.0/`)
- Datasets/examples : `[nom]-[type]-[langue]-v[n°].[format]` (ex: `decisions-pm2-fr-v1.csv`)

---

## Liens importants

- Manifeste : `00-manifeste/Note d'intention.md`
- Principes : `00-manifeste/principes.md`
- Versionnement : `00-manifeste/versionnement.md`
- Index des objets : `02-Objets-Metier/01-index/README.md`
- Troncs communs : `02-Objets-Metier/troncs-communs.md`
- Contextes : `03-analyses/04-contextes/README.md`
- Index croisés : `04-references/README.md`
