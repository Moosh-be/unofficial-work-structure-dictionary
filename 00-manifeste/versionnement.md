# Versionnement

Ce document décrit les deux axes de versionnement du Work Structure Dictionary.

---

## Axe classique : évolution continue

Le versionnement classique suit une progression linéaire où chaque version améliore la précédente.

```
1.0 → 1.1 → 1.2 → 2.0 → 2.1 → ...
```

- **Mineur** : ajouts, améliorations, corrections sans rupture
- **Majeur** : refonte, rupture de compatibilité, réorganisation structurelle

Exemple : un objet métier OBJ-008 peut évoluer de `1.0` à `1.1` quand on ajoute un champ, ou de `1.0` à `2.0` quand on change fondamentalement sa structure.

---

## Axe contexte : pluralisme méthodologique

On ne sera jamais tous d'accord sur la "bonne" façon de structurer un objet. C'est acceptable. Les contextes permettent d'avancer sans attendre un consensus total.

Un contexte = une autorité qui décide "la norme, c'est comme ça".

### Identifier un contexte

Chaque objet métier peut avoir des variantes selon le contexte. L'identifiant du contexte préfixe le numéro de version traditionnel.

```
OBJ-008-1.0-moosh      → version 1.0, contexte auteur (moosh)
OBJ-008-1.0-rtbf       → version 1.0, contexte rtbf
OBJ-008-1.0-eu         → version 1.0, contexte union européenne
OBJ-008-2.0-safer      → version 2.0, contexte safer
OBJ-008-1.0-microsoft  → version 1.0, contexte microsoft
```

### Créer un contexte

1. Un auteur/autorité propose une variante d'un objet métier
2. Il crée un dossier dans `03-analyses/04-contextes/` avec son identifiant (ASCII court, ex: `rtbf/`, `eu/`, `moosh/`)
3. Ce dossier contient les données spécifiques au contexte
4. La version de l'objet est préfixée avec le contexte

### Fusionner et aligner les contextes

Le bon sens cherche à "fusionner" et "aligner" les contextes. Mais les contextes permettent d'avancer même sans consensus total.

- Commencer par identifier les différences
- Chercher un dénominateur commun
- Documenter les écarts
- Accepter que certains contextes restent différents

---

## Exemple complet

Objet : OBJ-003 Décisions

| Contexte | Version | Description |
|----------|---------|-------------|
| moosh | 1.0 | Version auteur : format simple avec front-matter YAML |
| rtbf | 1.0 | Version RTBF : format enrichi avec workflow de validation |
| eu | 2.0 | Version UE : format structuré conforme aux standards européens |
| pmi | 1.0 | Version PMI : format aligné sur le PMBOK Guide |

L'objet "de base" (sans préfixe) est le noyau commun. Chaque contexte ajoute ou modifie des champs selon ses besoins.

---

## Outils

Voir `03-analyses/04-contextes/README.md` pour la liste complète des contextes et leurs données.
