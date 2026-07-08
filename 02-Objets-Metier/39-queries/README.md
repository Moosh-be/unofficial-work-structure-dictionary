# Queries (OBJ-039)

Les Queries (requêtes) sauvegardent des filtres et vues personnalisées des WorkPackages.

---

## Rôle

Les Queries permettent de :

- **sauvegarder** des vues de filtrage complexes
- **partager** des vues avec l'équipe
- **automatiser** le suivi (rapports récurrents)
- **cibler** des sous-ensembles de WorkPackages

---

## Types de Queries

| Type | Usage |
|------|-------|
| **Filtre simple** | Statut = Closed, Type = Bug |
| **Filtre avancé** | Statut = Open AND Priorité = High AND Responsable = Jean |
| **Vue par colonne** | Regroupement par statut (Kanban) |
| **Vue par date** | Regroupement par sprint ou semaine |
| **Vue par responsable** | WorkPackages assignés à une personne |
| **Vue personnalisée** | Combinaison libre de critères |

---

## Éléments d'une Query

Une requête définit :

- **Filtres** : Statut, type, priorité, responsable, dates, etc.
- **Tri** : Ordre de présentation (date, priorité, assigné, etc.)
- **Colonnes** : Champs affichés (titre, statut, responsable, dates)
- **Groupement** : Regroupement visuel (par statut, type, etc.)
- **Affichage** : Liste, Kanban, Gantt, Calendrier

---

## Partage

- **Privée** : Visible uniquement par son créateur
- **Partagée** : Visible par tous les membres du projet
- **Public** : Visible aussi pour les Guests (lecture seule)

---

## Principe

> Une Query sauvegardée est un gain de temps quotidien.
> Une Query non partagée est une connaissance isolée.

---

## Normes existantes

- **PMBOK® Guide** — Information distribution et reporting performance
- **ISO 21502** — Reporting et vues personnalisées du projet
- **OLAP / SQL standards** — Requêtes analytiques multi-dimensionnelles

---

## Outils connus

- **OpenProject** — Saved queries natifs pour filtrer les WorkPackages
- **Jira** — Saved filters et dashboards
- **SQL** — Langage standard de requêtes
- **Looker / Tableau** — Query et visualisation avancée
- **Metabase** — Requêtes simples et dashboards
