# WBS Nodes (OBJ-024)

Les nœuds WBS (Work Breakdown Structure) sont les unités de la structure de répartition du projet.

Ils représentent la décomposition hiérarchique du travail en lots planifiables et mesurables.

---

## Rôle

Les nœuds WBS permettent de :

- **décomposer** le projet en unités hiérarchisées
- **affecter** clairement les responsabilités à chaque niveau
- **estimer** coûts et durées par lot
- **suivre** l'avancement agrégé (roll-up)

---

## Structure de répartition (WBS)

La WBS décompose le projet en niveaux :

1. **Projet** (niveau 0)
2. **Phases** (niveau 1)
3. **Lots principaux** (niveau 2)
4. **Lots secondaires** (niveau 3)
5. **Nœuds élémentaires** (niveau 4 - détail maximal)

---

## Caractéristiques d'un nœud WBS

Un nœud WBS est :

- **hiérarchisé** : Position définie dans l'arborescence
- **fini** : Pas d'ambiguïté sur la complétion au niveau élémentaire
- **estimé** : Coût, durée et ressources identifiables
- **affecté** : Responsable identifié
- **mesurable** : Avancement quantifiable avec roll-up
- **autonome** : Peut être planifié et suivi indépendamment

---

## Règle des 8/80

> Un nœud élémentaire ne doit ni être trop petit (< 8h), ni trop grand (> 80h).

Cette règle empirique aide à trouver le bon niveau de détail.

---

## Distinction importante

> Le nœud WBS est le **plan** (ce qui est prévu).
> Le WorkPackage (OBJ-026) est l'**exécution** (le ticket de travail réel).

Le nœud WBS définit le périmètre et l'estimation. Le WorkPackage porte les données opérationnelles (assignation, temps passé, commentaires, etc.).
