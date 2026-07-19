# Sources de Données (OBJ-042)

Les Sources de Données représentent les origines des informations utilisées dans le projet.

Chaque source est un document, une base de données, un outil, ou tout autre système qui produit ou stocke des données utilisées par le projet.

---

## Rôle

Les Sources de Données permettent de :

- **documenter** les origines des données du projet
- **tracer** la provenance de chaque information
- **gérer** les accès et les droits d'utilisation
- **planifier** les intégrations et synchronisations
- **qualifier** la fiabilité des sources

---

## Types de sources

- **Externes** : Données venant d'outils externes (ERP, CRM, outils tiers)
- **Internes** : Données produites par le projet (rapports, livrables)
- **Humaines** : Savoirs experts, interviews, retours d'expérience
- **Systématiques** : Rapports automatisés, tableaux de bord, statistiques

---

## Distinction importante

> La Source de Données est l'origine.
> Le Document (OBJ-010) est le support.
> La Donnée (OBJ-001) est le contenu.

Exemple : Le ERP (Source) produit un rapport quotidien (Document) contenant des statistiques de production (Données).

---

## Distinction avec les autres objets liés aux données

L'Objet Source de Données (OBJ-042) n'est qu'un des objets liés aux données :

| Objet | Question | Lien avec la Source |
|-------|----------|---------------------|
| **Source de Données** (OBJ-042) | D'où vient l'information ? | Origine : outil, base, personne |
| **Document** (OBJ-010) | Quel est le support ? | Document = artefact contenant les données |
| **Fichier** (OBJ-032) | Où est stocké le fichier ? | Fichier = emplacement physique du document |
| **Version** (OBJ-028) | Quelle est la version ? | Version = évolution du document |
| **KPI** (OBJ-011) | Que mesure-t-on ? | KPI = métriques dérivées des données |
| **Report** (OBJ-041) | Quel est le livrable ? | Report = agrégation de données de sources |

> La Source de Données est le "qui produit". Le Document est le "quoi", le Fichier est le "où", le KPI est le "combien".

---

## Normes existantes

- **ISO 8000** — Data Quality Management
- **DCAT** — Data Catalog Vocabulary (métadonnées des sources)
- **INSPIRE** — Metadata specifications for data sources

---

## Outils connus

- **Apache Atlas** — Data lineage et gouvernance
- **Collibra** — Data catalog et gouvernance
- **Alation** — Data discovery et catalogue
- **DataHub** — Metadata engine et data catalog (LinkedIn)
- **OpenMetadata** — Plateforme open source de métadonnées
