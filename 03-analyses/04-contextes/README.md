# Contextes — Une norme, plusieurs voix

Ce dossier contient les contextes : chaque contexte est un choix d'autorité pour définir "comment" un objet métier.

## Qu'est-ce qu'un contexte ?

Un contexte = une autorité qui décide "la norme, c'est comme ça".

Si la norme de base (noyau commun) dit comment on structure un objet métier en théorie, un contexte dit comment on l'applique dans une réalité donnée : une organisation, un cadre méthodologique, une autorité décisionnelle.

## Identifier un contexte

Chaque objet métier peut avoir des variantes selon le contexte. L'identifiant du contexte préfixe le numéro de version traditionnel.

```
OBJ-008-1.0-moosh      → version 1.0, contexte auteur (moosh)
OBJ-008-1.0-rtbf       → version 1.0, contexte rtbf
OBJ-008-1.0-eu         → version 1.0, contexte union européenne
OBJ-008-2.0-safer      → version 2.0, contexte safer
OBJ-008-1.0-microsoft  → version 1.0, contexte microsoft
```

## Créer un contexte

1. Un auteur/autorité propose une variante d'un objet métier
2. Il crée un dossier dans ce dossier avec son identifiant (ASCII court, ex: `rtbf/`, `eu/`, `moosh/`)
3. Ce dossier contient :
   - `README.md` : identité du contexte (nom, auteur, périmètre, méthode associée)
   - `donnees/` : données spécifiques au contexte (variantes des objets)
4. La version de l'objet est préfixée avec le contexte

## Contextes existants

| Contexte | Auteur/autorité | Méthode associée | Périmètre |
|----------|-----------------|------------------|-----------|
| [moosh](moosh/) | Auteur du projet | Personnelle | Universel |
| [rtbf](rtbf/) | RTBF | À définir | Organisationnel |
| [eu](eu/) | Union européenne | PM² | Institutionnel |
| [pmi](pmi/) | PMI | PMBOK | Certification |
| [safer](safer/) | SAFe Institute | SAFe | Entreprise |
| [microsoft](microsoft/) | Microsoft | MS Project/Planner | Outils Microsoft |

## Fusionner et aligner les contextes

Le bon sens cherche à "fusionner" et "aligner" les contextes. Mais les contextes permettent d'avancer même sans consensus total.

1. Identifier les différences
2. Chercher un dénominateur commun
3. Documenter les écarts
4. Accepter que certains contextes restent différents

## Liens utiles

- [Versionnement](../../00-manifeste/versionnement.md) — Comment les versions et contextes interagissent
- [03-analyses/README.md](../README.md) — Vue d'ensemble des analyses
