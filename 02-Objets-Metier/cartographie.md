# Cartographie des Objets Métier

> **Ce document explique la logique globale du référentiel.**  
> Il répond à la question : « Pourquoi 44 dossiers ? Pourquoi des redondances ? Comment tout s'articule-t-il ? »

---

## Le puzzle : une question par fichier

Chaque objet métier du référentiel répond à **une seule question** :

> « Quels sont les **champs** à échanger entre **l'outil X** et **l'outil Y** pour parler de [sujet] ? »

Exemples :
- `08-risks/` → Quels champs échanger entre Jira et MS Project pour parler de **risques** ?
- `10-documents/` → Quels champs échanger entre Confluence et SharePoint pour parler de **documents** ?
- `09-budgets/` → Quels champs échanger entre Excel et OpenProject pour parler de **budgets** ?

Chaque dossier = une réponse à une question précise. Pas plus, pas moins.

---

## La redondance est intentionnelle

Tu verras : **les mêmes champs apparaissent dans plusieurs objets.**

C'est normal. C'est même le principe.

Prenons le champ `responsable_id` :
- Il existe dans `08-risks/schema.md` (qui est le responsable du risque ?)
- Il existe dans `09-budgets/schema.md` (qui est le responsable du budget ?)
- Il existe dans `26-workpackages/schema.md` (qui est le responsable du WorkPackage ?)
- Il existe dans `18-change-requests/schema.md` (qui est le décideur de la demande de changement ?)

Chaque occurrence répond à une question différente. Ce n'est pas de la duplication inutile — c'est de la **redondance fonctionnelle**. Chaque contexte définit son propre « responsable » avec sa propre sémantique.

> **La redondance est le prix de l'interopérabilité.**  
> Si chaque outil pouvait comprendre « responsable » sans devoir mapper vers un autre objet, il n'y a pas besoin de jointure complexe. Chaque objet est autonome.

---

## Analogie avec la Programmation Orientée Objet

La cartographie des objets métier fonctionne exactement comme un système de classes en POO.

### 1. Troncs communs = Classes de base (héritage)

Les 6 troncs communs sont des **classes de base** dont héritent les objets métier.

```
                    ┌─────────────────────────┐
                    │    Tronc EntitéVie       │
                    │  (classe de base)        │
                    │  - titre                 │
                    │  - description           │
                    │  - statut                │
                    │  - priorite              │
                    │  - responsable           │
                    │  - date_creation         │
                    └────────────┬────────────┘
                                 │ hérite
            ┌────────────────────┼────────────────────┐
            │                    │                    │
    ┌───────▼───────┐   ┌───────▼───────┐   ┌───────▼───────┐
    │   Risk         │   │  Incident     │   │ Requirement   │
    │ (OBJ-008)      │   │ (OBJ-022)     │   │ (OBJ-013)     │
    │ +severite      │   │ +cause_ra     │   │ +type_besoin  │
    │ +plan_reponse  │   │ +resolution   │   │ +granularite  │
    │ +probabilite   │   │ +niveau_impact│   │ +source       │
    └───────────────┘   └───────────────┘   └───────────────┘
```

Chaque objet métier **hérite** des champs de son tronc, puis **ajoute les siens**.

### 2. Objets qui apparaissent dans plusieurs troncs = Polymorphisme

Certains objets appartiennent à **plusieurs troncs**. C'est l'équivalent d'un objet qui implémente **plusieurs interfaces**.

```
                ┌─────────────────────┐
                │ Tronc Gouvernance    │
                │ (interface)          │
                │ - decisionnaire      │
                │ - decision           │
                │ - date_decision      │
                └──────────┬──────────┘
                           │ implémente
                ┌──────────▼──────────┐
                │   Change Request     │
                │   (OBJ-018)          │
                │                      │
                │ hérite aussi de :    │
                │ Tronc EntitéVie      │
                │ (classe de base)     │
                └─────────────────────┘
```

Un `ChangeRequest` implémente l'« interface » Gouvernance **ET** hérite du tronc EntitéVie.

### 3. Objets composés = Composition d'objets

Un incident de production réel combine **plusieurs troncs** :

```
Incident de production = 
  EntitéVie (titre, description, statut)      → "Quoi ?"
  + Gouvernance (decisionnaire, decision)      → "Qui a décidé ?"
  + Financier (montant, devise, reference)     → "Ça coûte combien ?"
  + EvenementTemporalise (date_planifiee, date_reelle)  → "Quand ?"
```

C'est la **composition** en POO : un objet complexe est construit à partir d'autres objets, sans héritage profond.

### 4. Mapping vers des outils = Sérialisation

Chaque objet métier a des templates dans 4 formats : JSON, XML, CSV, SQL.

```
Risk (objet métier)
  ├── data.json     → sérialisation JSON
  ├── data.xml      → séserialisation XML
  ├── data.csv      → sérialisation CSV
  └── data.sql      → création table SQL
```

C'est l'équivalent de sérialiser un objet en différents formats pour l'échanger avec un système externe.

---

## La carte complète

```
                    ┌──────────────────┐
                    │   44 objets       │
                    │   + 6 troncs      │
                    │   + contextes     │
                    └────────┬─────────┘
                             │
              ┌──────────────┼──────────────┐
              │              │              │
     ┌────────▼───────┐ ┌───▼────┐ ┌───────▼────────┐
     │ Héritage (troncs)│ │Polymorphisme │ │ Composition │
     │ 6 classes de base│ │objets multiples │ objets composés │
     │                  │ │ troncs        │ objets composés │
     └──────────────────┘ └──────────────┘ └──────────────┘
```

### Récapitulatif des troncs → objets (l'héritage)

| Tronc (classe de base) | Objets qui héritent | Ce qu'ils ajoutent |
|------------------------|---------------------|-------------------|
| **EntitéVie** | 9 objets (Risk, Incident, Requirement...) | Champs spécifiques à leur domaine |
| **EvenementTemporalise** | 4 objets (Milestone, QualityGate, Version...) | Données temporelles et de résultat |
| **Acteur** | 6 objets (Individu, Member, Guest...) | Identité, rôle, permissions |
| **Artefact** | 4 objets (Document, File, ConfigItem...) | Stockage, version, checksum |
| **Financier** | 3 objets (Budget, TimeEntry, Cost) | Montant, devise, reference |
| **Gouvernance** | 4 objets (Decision, ChangeRequest, QualityGate...) | Decisionnaire, decision, justification |

### Objets multi-troncs (polymorphisme)

| Objet | Troncs implémentés | Raison |
|-------|-------------------|--------|
| `18-change-requests` | EntitéVie + Gouvernance | Une demande de changement a un cycle de vie ET une décision |
| `19-quality-gates` | EntitéVie + EvenementTemporalise + Gouvernance | Un gate a un cycle, une date, ET une décision |
| `16-deliverables-acceptance` | EvenementTemporalise + Gouvernance + Artefact | Acceptation = événement + décision + livrable |

---

## Pourquoi 44 dossiers et pas 6 (un par tronc) ?

Parce que **chaque question est différente**.

Si on ne mettait que 6 objets (un par tronc), on perdrait la capacité de répondre précisément :

> « Quels sont les champs **spécifiques aux risques** à échanger entre Jira et MS Project ? »

La réponse nécessite de plonger dans `08-risks/`, pas dans un tronc générique EntitéVie qui ne contient que `titre`, `description`, `statut` — pas `severite`, `plan_reponse`, `probabilite`.

Chaque dossier est un **point de vue** sur les données. Un même jeu de données peut être interrogé sous 44 angles différents.

---

## Navigation : comment s'y retrouver

1. **Je cherche un objet précis** → index dans `02-Objets-Metier/01-index/README.md`
2. **Je veux comprendre comment les objets se relient** → `02-Objets-Metier/troncs-communs.md`
3. **Je veux savoir quels champs échanger entre 2 outils pour X** → dossier de l'objet correspondant
4. **Je veux créer un objet de terrain composite** → `02-Objets-Metier/troncs-communs.md` section "Objets composés"
5. **Je veux comprendre la philosophie** → ce document + `03-analyses/01-pourquoi/`

---

## Résumé en une phrase

> Le Work Structure Dictionary est un **puzzle de 44 pièces** — chaque pièce répond à une question d'interopérabilité précise, et les troncs communs sont les **briques qui se répètent** (comme en POO : héritage, interfaces, composition). Les redondances sont intentionnelles : elles sont ce qui rend l'échange entre outils possible sans jointure complexe.
