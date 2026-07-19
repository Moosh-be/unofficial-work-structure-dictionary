# Troncs Communs et Héritages entre Objets Métier

> **Version :** 1.0 — 22 juin 2026
> **But :** Identifier les regroupements organiques entre objets métier similaires, définir leurs troncs communs, et montrer comment les compositions de terrain seront nécessaires.

---

## Principe général

Dans un projet réel, un fichier de terrain n'est presque jamais la composition d'un seul objet métier proposé ici. Il est **composé de morceaux de plusieurs objets**, parfois réarrangés, parfois simplifiés.

Ce document identifie les **troncs communs** — ensembles de champs partagés par plusieurs objets — pour :

1. **Normaliser** les morceaux d'interopérabilité (si tu reçois un incident depuis un autre système, il peut avoir un sous-ensemble de nos champs).
2. **Accepter** que certains objets évolueront vers des **objets composés** regroupant des morceaux de plusieurs objets "purs".
3. **Éviter la redondance** en définissant les patterns réutilisables.

---

## 1. Tronc "Entité avec cycle de vie"

> Objet : Titre, description, statut, priorité, responsable, dates.

C'est le tronc le plus répandu. Presque tous les objets de suivi partagent cette structure de base.

### Objets concernés

| Objet | Titre | Description | Statut | Priorité | Responsable | Dates |
|-------|-------|-------------|--------|----------|-------------|-------|
| OBJ-026 WorkPackage | `subject` | `description` | `status` | `priority` | `assigned_to` | `created_on`, `updated_on` |
| OBJ-008 Risk | `titre` | `description` | `statut` | — | `responsable` | `date_creation`, `date_reelle_survenance` |
| OBJ-022 Incident | `titre` | `description` | `statut` | — | `responsable` | `date_detection`, `date_resolution` |
| OBJ-018 Change Request | `titre` | `description` | `statut` | `priorite` | `decisionnaire` | `date_decision` |
| OBJ-013 Requirement | `titre` | `description` | `statut` | `priorite` | — | `date_creation`, `date_mise_a_jour` |
| OBJ-012 Test Case | `titre` | `description` | `statut` | — | `executeur` | `date_execution` |
| OBJ-003 Decision | `titre` | `description` | `statut` | — | `acteur_id` | `date_creation` |
| OBJ-020 Procurement | `titre` | — | `statut` | — | `responsable_achat` | `date_signature`, `date_debut`, `date_fin` |
| OBJ-023 Lesson Learned | `titre` | `description` | — | — | `auteur` | `date_capture` |
| OBJ-045 Portfolio | `titre` | `description` | `statut` | — | `responsable` | `date_creation`, `date_mise_a_jour` |
| OBJ-048 Changelog | `titre` | `description` | — | — | `auteur` | `date_changement`, `date_creation` |

### Champs du tronc commun

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `titre` / `subject` | String | Oui | Résumé court de l'entité |
| `description` | Text | Non | Description détaillée |
| `statut` | Enum | Oui | Cycle de vie de l'entité |
| `priorite` | Enum | Non | Urgence / importance |
| `responsable` | UUID | Non | Personne en charge |
| `date_creation` | Date/Time | Oui | Quand l'entité a été créée |
| `date_mise_a_jour` / `date_*` | Date/Time | Non | Dates spécifiques au contexte |

### Héritage implicite

```
EntiteVie
├── titre
├── description
├── statut
├── priorite          (optionnel)
├── responsable       (optionnel)
├── date_creation
└── dates_specifiques (extension)
    ├── Risk → date_reelle_survenance, plan_reponse
    ├── Incident → severite, cause_ra, resolution
    ├── ChangeRequest → impact_cout, impact_delai, decision
    ├── Requirement → type_besoin, granularite, source
    ├── TestCase → preconditions, etapes, resultat_attendu
    └── Decision → justification, impact_niveau
```

---

## 2. Tronc "Jalon / Événement temporel"

> Objet : Date planifiée, date réelle, phase, type, résultat.

Ces objets marquent des points dans le temps. Leur intérêt est d'ancrer un événement à une date et de documenter ce qui s'est passé (prévu vs réel).

### Objets concernés

| Objet | Titre | Date planifiée | Date réelle | Phase/Type | Résultat |
|-------|-------|----------------|-------------|------------|----------|
| OBJ-005 Milestone | `titre` | `date_planifiee` | `date_reelle` | `type` | `statut` |
| OBJ-019 Quality Gate | `titre` | `date_gate` | — | `phase` | `resultat` |
| OBJ-028 Version | `nom` | `date_prevue` | `date_reelle` | — | `status` |
| OBJ-016 Deliverable Acceptance | — | `date_soumission` | `date_decision` | — | `decision` |

### Champs du tronc commun

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `titre` / `nom` | String | Oui | Nom de l'événement |
| `date_planifiee` | Date | Oui | Date prévue |
| `date_reelle` | Date | Non | Date effective (remplit après coup) |
| `phase` / `type` | Enum | Oui | Catégorie de l'événement |
| `resultat` / `statut` | Enum | Oui | Issue (passé/refusé/atteint/reporté) |

### Héritage implicite

```
EvenementTemporalise
├── titre
├── date_planifiee
├── date_reelle
├── phase / type
├── resultat / statut
└── extensions_specifiques
    ├── Milestone → deliverables_liés
    ├── QualityGate → criteres_passage, reserves, comite
    ├── Version → is_public, effective_date, wiki_page_id
    └── DeliverableAcceptance → commanditaire_id, preuves, reserves
```

---

## 3. Tronc "Personne / Accès"

> Objet : Identité, rôle, groupe, permissions, dates d'accès.

Tous les objets liés aux acteurs humains partagent des mécanismes d'identification et d'autorisation.

### Objets concernés

| Objet | Identité | Email | Organisation | Rôle | Dates d'accès | Permissions |
|-------|----------|-------|--------------|------|---------------|-------------|
| OBJ-004 Individu | `nom`, `prenom` | `email` | `organisation` | — | — | — |
| OBJ-037 Member | `user_id` | — | — | `role` | `date_join`, `is_active` | `notification_pref` |
| OBJ-034 Guest | `nom` | `email` | `organisation` | `role` | `date_debut`, `date_fin` | `permission_level`, `workpackage_ids` |
| OBJ-038 Role | `nom` | — | — | — | — | `permissions`, `competences_requises` |
| OBJ-030 Group | `nom` | — | — | `type` | — | `permissions` (JSON) |
| OBJ-015 Assignment | — | — | — | `role` | `date_debut`, `date_fin` | `pourcentage`, `competences_apportees` |
| OBJ-047 Availability | `person_id` | — | — | — | `date_debut`, `date_fin` | — |

### Champs du tronc commun

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `identite` (nom/user_id/email) | String | Oui | Comment identifier la personne |
| `organisation` | String | Non | Entité rattachée |
| `role` | String/UUID | Non | Rôle fonctionnel |
| `date_debut` | Date | Non | Quand l'accès commence |
| `date_fin` | Date | Non | Quand l'accès expire |
| `statut` / `is_active` | Enum/Boolean | Oui | État actuel de l'accès |
| `permissions` | JSON | Non | Droits spécifiques |

### Héritage implicite

```
Acteur
├── identite
├── organisation        (optionnel)
├── role                (optionnel)
├── date_debut          (optionnel)
├── date_fin            (optionnel)
├── statut
└── permissions         (optionnel, JSON)

├── Individu              (ajoute : competences, telephone)
├── Member                (ajoute : project_id, notification_pref)
├── Guest                 (ajoute : permission_level, workpackage_ids)
├── Role                  (ajoute : niveau, competences_requises)
├── Group                 (ajoute : description, type, is_public)
└── Assignment            (ajoute : individu_id, pourcentage, motif_sortie)
```

---

## 4. Tronc "Livrable / Artefact"

> Objet : Titre, description, version, statut, stockage, propriétaire.

Ces objets représentent des artefacts tangibles produits ou consommés par le projet.

### Objets concernés

| Objet | Titre | Version | Statut | Stockage | Propriétaire |
|-------|-------|---------|--------|----------|--------------|
| OBJ-002 Livrable | `titre` | — | `statut` | — | `commanditaire_id` |
| OBJ-010 Document | `titre` | `version` | `statut` | `chemin_stockage` | `auteur` |
| OBJ-032 File | `nom_fichier` | `version` | — | `storage_path`, `checksum` | `uploaded_by` |
| OBJ-021 ConfigItem | `nom` | `version` | `statut` | `chemin_stockage` | `proprietaire` |

### Champs du tronc commun

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `titre` / `nom` | String | Oui | Nom de l'artefact |
| `description` | Text | Non | Description |
| `version` | String | Non | Version actuelle |
| `statut` | Enum | Non | État de l'artefact |
| `stockage` | String | Non | Chemin ou référence de stockage |
| `proprietaire` | UUID | Non | Personne responsable |

### Héritage implicite

```
Artefact
├── titre
├── description         (optionnel)
├── version             (optionnel)
├── statut              (optionnel)
├── stockage            (optionnel)
├── proprietaire        (optionnel)
└── extensions_specifiques
    ├── Livrable → type_livrable, date_echeance, criteres_acceptation, commanditaire
    ├── Document → type_document, auteur, date_creation, date_mise_a_jour
    ├── File → taille, mime_type, checksum, uploaded_by
    └── ConfigItem → type_ci, baseline_id, historique_versions
```

---

## 5. Tronc "Financier"

> Objet : Montant, devise, type, statut, date, référence.

Les objets liés au suivi financier partagent tous des champs monétaires et de traçabilité.

### Objets concernés

| Objet | Montant | Devise | Type | Statut | Date | Référence |
|-------|---------|--------|------|--------|------|-----------|
| OBJ-009 Budget | `montant_total` | `devise` | `type` | — | `periode` | `id_budget` |
| OBJ-027 TimeEntry | `hours` | — | `activity` | — | `spent_on`, `is_billable` | `workpackage_id` |
| OBJ-033 Cost | `montant` | `devise` | `type` | `statut_paiement` | `date` | `facture_reference` |

### Champs du tronc commun

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `montant` | Number | Oui | Montant financier |
| `devise` | String | Non | Devise (EUR, USD, etc.) |
| `type` | Enum | Non | Catégorie financière |
| `statut` | Enum | Non | État du suivi financier |
| `date` | Date | Non | Date de la transaction |
| `reference` | String | Non | Référence externe (facture, bon de commande) |

### Héritage implicite

```
Financier
├── montant
├── devise              (optionnel)
├── type                (optionnel)
├── statut              (optionnel)
├── date
└── reference           (optionnel)

├── Budget              (ajoute : montant_engage, montant_depense, periode, responsable)
├── TimeEntry           (ajoute : hours, activity, user_id, comment, cost_rate)
└── Cost                (ajoute : workpackage_id, facture_reference, statut_paiement)
```

---

## 6. Tronc "Gouvernance / Décision"

> Objet : Titre, description, décisionnaire, décision, date, justification.

Les objets liés à la gouvernance partagent l'idée d'un processus décisionnel avec traçabilité.

### Objets concernés

| Objet | Titre | Décisionnaire | Décision | Date décision | Justification |
|-------|-------|---------------|----------|---------------|---------------|
| OBJ-003 Decision | `titre` | `acteur_id` | `statut` | — | `justification` |
| OBJ-018 Change Request | `titre` | `decisionnaire` | `decision` | `date_decision` | — |
| OBJ-019 Quality Gate | `titre` | `animateur` | `resultat` | `date_gate` | `reserves` |
| OBJ-016 Deliverable Acceptance | — | `commanditaire_id` | `decision` | `date_decision` | `commentaires` |

### Champs du tronc commun

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `titre` | String | Oui | Objet de la gouvernance |
| `decisionnaire` | UUID | Oui | Qui a tranché |
| `decision` / `statut` | Enum | Oui | La décision prise |
| `date_decision` | Date | Non | Quand la décision a été prise |
| `justification` | Text | Non | Pourquoi cette décision |

### Héritage implicite

```
Gouvernance
├── titre
├── decisionnaire
├── decision / statut
├── date_decision       (optionnel)
├── justification       (optionnel)
└── extensions_specifiques
    ├── Decision → description, impact_niveau
    ├── ChangeRequest → type, priorite, impact_cout, impact_delai
    ├── QualityGate → phase, criteres_passage, comite, reserves
    └── DeliverableAcceptance → livrable_id, date_soumission, preuves
```

---

## Composition de terrain

### Scénario 1 : Un ticket de production

Un incident de production réel dans un système de terrain ressemblera à ceci :

```
# Incident PROD-2026-042 — Panne base de données
titre: Panne BD PostgreSQL principale
description: Base de données principale inaccessible depuis 14h32
── Tronc "Entité avec cycle de vie" (OBJ-022 Incident)
    ├── titre, description, statut, responsable, date_detection
    └── severite, cause_ra, resolution

── Tronc "Gouvernance / Décision" (OBJ-003 Decision)
    ├── decisionnaire: DBA lead
    ├── decision: Escalade au fournisseur
    └── justification: SLA non respecté

── Tronc "Financier" (OBJ-033 Cost)
    ├── montant: 5000
    ├── devise: EUR
    └── reference: Bon de secours urgence

── Tronc "Jalon" (OBJ-005 Milestone)
    ├── titre: Retour service normal
    ├── date_planifiee: 2026-06-22T16:00
    └── date_reelle: 2026-06-22T15:47

── Tronc "Entité avec cycle de vie" (OBJ-023 Lesson Learned)
    ├── titre: Mettre en place monitoring proactif
    └── action_corrective: Installer Prometheus + alerting
```

Ce ticket **n'existe en tant que tel dans aucun objet seul**. C'est une composition de :
- 1 incident (tronc principal)
- 1 décision d'escalade
- 1 coût de secours
- 1 jalon retour service
- 1 lesson learned associée

### Scénario 2 : Un livrable client

```
# Livraison v2.3 — Module reporting
── Tronc "Livrable / Artefact" (OBJ-002 Livrable)
    ├── titre: Module reporting v2.3
    ├── criteres_acceptation: ...
    └── commanditaire_id: CEO

── Tronc "Jalon" (OBJ-028 Version)
    ├── nom: v2.3
    ├── date_prevue: 2026-07-01
    └── status: Released

── Tronc "Gouvernance" (OBJ-016 Deliverable Acceptance)
    ├── decision: Accepté avec réserves
    └── reserves: Documentation à compléter

── Tronc "Artefact" (OBJ-010 Document + OBJ-032 File)
    ├── fichiers: manuel_utilisateur.pdf, notes_release.md
    └── chemin_stockage: /artifacts/v2.3/

── Tronc "Entité avec cycle de vie" (OBJ-026 WorkPackage)
    ├── subject: Implémentation module reporting
    └── workpackages_liés: WP-401, WP-402, WP-403
```

---

## Vers des objets composés

Au fur et à mesure que le projet avance, il sera naturel de créer des **objets composés** — des entités de terrain qui regroupent des morceaux de plusieurs troncs.

### Exemples d'objets composés futurs

| Nom | Composition | Usage |
|-----|-------------|-------|
| `ChangeIncident` | Incident + Decision + Cost | Incident nécessitant une décision et un coût |
| `ReleasePackage` | Version + Deliverable + Acceptance + Files | Release complète avec acceptation client |
| `AuditTrail` | Decision + LessonLearned + Document | Trace d'audit avec preuves |
| `SprintDeliverable` | WorkPackage + Sprint + Milestone + TestCases | Livraison de sprint validée |
| `ProcurementBundle` | Procurement + Cost + Deliverable + Documents | Achat complet avec livrables associés |

### Comment créer un objet composé

1. **Identifier les troncs nécessaires** (listés ci-dessus)
2. **Choisir un tronc principal** (celui qui donne le nom et le statut)
3. **Intégrer les champs des autres troncs** comme références (UUID) ou sous-objets (JSON)
4. **Créer un nouveau dossier** dans `02-Objets-Metier/` avec un `README.md` et un `schema.md`
5. **Écrire un script générateur** dans `tools/` pour créer des instances

---

## Scripts de création

### `tools/create-trunk-instance.sh`

Script utilitaire pour créer une instance d'un tronc commun :

```bash
#!/bin/bash
# Usage: ./create-trunk-instance.sh <tronc> <titre> [--champ valeur]
# Exemple: ./create-trunk-instance.sh incident "Panne BD" --severite Critique
```

Ce script :
1. Génère un UUID
2. Crée le dossier `02-Objets-Metier/nn-nom-du-tronc/`
3. Remplit le `schema.md` avec les valeurs par défaut
4. Met à jour l'index (OBJ-001)

### `tools/compose-object.sh`

Script pour créer un objet composé à partir de troncs existants :

```bash
# Usage: ./compose-object.sh <nom> <tronc1:ref1> <tronc2:ref2> ...
# Exemple: ./compose-object.sh ChangeIncident incident:INC-001 decision:DEC-001 cost:CST-001
```

Ce script :
1. Crée un nouvel objet dans un nouveau dossier
2. Inclut les références UUID des objets sources
3. Génère un `schema.md` avec la structure composite
4. Ajoute à l'index

### `tools/list-trunks.sh`

Script pour visualiser les troncs et leurs objets :

```bash
# Affiche les troncs communs et les objets qui les utilisent
./tools/list-trunks.sh [--tronc entite-vie] [--format json]
```

---

## Règles d'interopérabilité

Quand on échange des données avec un système externe (un autre projet, un client, un outil), on n'aura jamais le schema complet. On aura un **sous-ensemble de champs** qui correspondent à un tronc commun.

### Mapping automatique troncs → formats

| Tronc | JSON Schema | OpenAPI | CSV header |
|-------|-------------|---------|------------|
| EntitéVie | `troncs/entite-vie.schema.json` | `troncs/entite-vie.yaml` | `titre,description,statut,priorite,responsable,date_creation` |
| EvenementTemporalise | `troncs/evenement.schema.json` | `troncs/evenement.yaml` | `titre,date_planifiee,date_reelle,phase,resultat` |
| Acteur | `troncs/acteur.schema.json` | `troncs/acteur.yaml` | `identite,organisation,role,statut` |
| Artefact | `troncs/artefact.schema.json` | `troncs/artefact.yaml` | `titre,version,statut,stockage,proprietaire` |
| Financier | `troncs/financier.schema.json` | `troncs/financier.yaml` | `montant,devise,type,statut,date,reference` |
| Gouvernance | `troncs/gouvernance.schema.json` | `troncs/gouvernance.yaml` | `titre,decisionnaire,decision,date_justification` |

### Principe de fusion

Quand on reçoit des données externes :
1. **Identifier le tronc** le plus proche (matching sur les champs présents)
2. **Fusionner** les champs reçus avec les champs locaux manquants
3. **Conserver les champs externes** dans un bloc `origine_externe` (JSON)
4. **Générer un nouvel objet** ou mettre à jour un existant selon le matching

---

## Récapitulatif

| Tronc | Objets couverts | Champs clés |
|-------|----------------|-------------|
| **EntitéVie** | WorkPackage, Risk, Incident, ChangeRequest, Requirement, TestCase, Decision, Procurement, LessonLearned, Portfolio, Changelog | titre, description, statut, priorite, responsable, dates |
| **EvenementTemporalise** | Milestone, QualityGate, Version, DeliverableAcceptance | date_planifiee, date_reelle, phase, resultat |
| **Acteur** | Individu, Member, Guest, Role, Group, Assignment | identite, organisation, role, permissions, dates_acces |
| **Artefact** | Livrable, Document, File, ConfigItem | titre, version, stockage, proprietaire |
| **Financier** | Budget, TimeEntry, Cost | montant, devise, reference, date |
| **Gouvernance** | Decision, ChangeRequest, QualityGate, DeliverableAcceptance | decisionnaire, decision, justification |

---

## Prochaine étape

1. Créer les fichiers `troncs/` avec les JSON Schémas de chaque tronc
2. Écrire les scripts dans `tools/`
3. Ajouter un objet composé d'exemple (ex: `ChangeIncident`)
4. Documenter le processus de fusion inter-systèmes
