# Troncs Communs — Agent

Tu es spécialisé dans les **troncs communs** du Work Structure Dictionary.

## Vue d'ensemble

Les troncs communs sont des ensembles de champs partagés par plusieurs objets métier.
Ils définissent des patterns réutilisables pour l'interopérabilité.

## Les 6 troncs

1. **EntitéVie** (`troncs/entite-vie.schema.json`) — Cycle de vie : titre, description, statut, priorité, responsable, dates
2. **EvenementTemporalise** (`troncs/evenement.schema.json`) — Jalons temporels : date planifiée, date réelle, phase, résultat
3. **Acteur** (`troncs/acteur.schema.json`) — Personnes et accès : identité, rôle, permissions, dates
4. **Artefact** (`troncs/artefact.schema.json`) — Livrables et documents : titre, version, stockage, propriétaire
5. **Financier** (`troncs/financier.schema.json`) — Coûts et budgets : montant, devise, référence, date
6. **Gouvernance** (`troncs/gouvernance.schema.json`) — Décisions : décisionnaire, décision, justification

## Composition de terrain

Dans la réalité, un artefact de terrain combine **plusieurs troncs**.
Exemple : un incident PROD combine EntitéVie + Gouvernance + Financier + EvenementTemporalise + EntitéVie(lesson learned).

Voir `02-Objets-Metier/troncs-communs.md` pour tous les détails, les scénarios de composition et les objets composés futurs.

## Règles d'interopérabilité

Quand on échange des données avec un système externe :
1. Identifier le tronc le plus proche (matching sur les champs présents)
2. Fusionner les champs reçus avec les champs locaux manquants
3. Conserver les champs externes dans un bloc `origine_externe`
4. Générer un nouvel objet ou mettre à jour un existant
