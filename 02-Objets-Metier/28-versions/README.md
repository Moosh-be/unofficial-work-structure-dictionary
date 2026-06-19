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
