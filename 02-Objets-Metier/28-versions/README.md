# Versions (OBJ-028)

Les Versions (ou Releases) représentent les livrables ou livraisons mises en production.

Elles regroupent les WorkPackages livrés ensemble dans un cadre temporel défini.

---

## Rôle

Les Versions permettent de :

- **organiser** les livraisons par lots
- **suivre** les releases en production
- **documenter** les changements par version
- **gérer** les plans de déploiement

---

## Cycle de vie d'une version

1. **Planned** : Version planifiée, WorkPackages liés
2. **In Progress** : Développement en cours
3. **Code Freeze** : Fin du développement, début des tests
4. **Released** : Mise en production effective
5. **Archived** : Version obsolète mais conservée

---

## Informations d'une version

- **Nom** : Version (ex: v1.0, v2.1-alpha)
- **Description** : Changements inclus
- **Date de livraison** : Planifiée ou effective
- **Status** : État actuel
- **WorkPackages** : Liste des éléments inclus
- **Notes de version** : Résumé des changements

---

## Bonnes pratiques

- Utiliser le **versionnement sémantique** (Major.Minor.Patch)
- **Documenter** les changements majeurs dans les notes
- ** geler **le code avant la release
- **Tester** exhaustivement avant la mise en production

---

## Principe

> Une version sans notes de release est une version incompréhensible.

---

## Normes existantes

- **SemVer (Semantic Versioning 2.0.0)** — Standard de numérotation des versions (Major.Minor.Patch)
- **PMBOK® Guide** — Release management et configuration management
- **ITIL 4** — Release management et deployment
- **ISO/IEC 12207** — Software lifecycle processes et releases

---

## Outils connus

- **OpenProject** — Versions natifs avec WorkPackages associés
- **GitHub Releases** — Gestion de releases avec tags
- **GitLab Releases** — Releases intégrées au pipeline
- **Jira Versions** — Versions/fix versions avec tracking
- **SemVer tools** — Version automatique via commit messages
- **Azure DevOps Releases** — Release pipelines avec approvals
- **Octopus Deploy** — Release management automatisé
