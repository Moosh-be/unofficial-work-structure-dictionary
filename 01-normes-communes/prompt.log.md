# Explication

Ce fichier a pour but de mémoriser des prompts et de préparer des prompts en mode hors connexion.

Le document peut être modifié à tout moment par OpenCode, par l’IA dans Obsidian ou par OpenNotebook.

## Principe de structure

Le fichier repose sur deux niveaux de représentation :

- un **format humain**, simple à écrire rapidement pour capturer une idée ;
- un **format canonique**, complet, structuré et sans ambiguïté.

Le format humain sert uniquement de zone de saisie. Il doit pouvoir être transformé par l’IA en format canonique.

La liste des prompts commence après le titre de niveau 1 `# Prompt Log`.

Chaque prompt est représenté par un titre de niveau 2.

Les autres informations du prompt sont placées sous des titres de niveau 3.

## Champs du format canonique

Chaque prompt peut contenir les informations suivantes :

- **Titre du prompt**  
  Par défaut, il est généré par l’IA à partir du contenu du prompt.  
  L’IA ne modifie plus ce titre s’il se termine par `!!`.  
  Le titre peut être précédé d’un identifiant unique, court et immuable.  
  Exemple : un code de 3 lettres majuscules, ou 4 si nécessaire au-delà de `ZZZ`.

- **Prompt**  
  Le texte du prompt.

- **Date de création**  
  Date à laquelle le prompt est apparu, même avant sa première exécution.  
  Cette date peut être renseignée manuellement ou ajoutée par l’IA lors de la première découverte.

- **Plateforme et modèle**  
  Quelle IA a traité ce prompt.  
  Plusieurs valeurs peuvent être renseignées si plusieurs plateformes ou modèles ont été utilisés.

- **Historique des exécutions**  
  Pour chaque plateforme ou modèle, conserver la liste des exécutions avec :
  - la date ;
  - le statut.  

  La date la plus récente doit apparaître en premier.  
  L’IA peut retrier cet historique si nécessaire.  
  Les statuts possibles sont : `jamais réalisé`, `succès`, `erreur`.

- **Récurrence**  
  - date de la prochaine exécution ;
  - règle ou prompt servant à calculer la prochaine date d’exécution.

## Règle de récurrence

Le champ `date de la prochaine exécution` sert à signaler qu’un prompt doit être rejoué.

Si cette date est dans le passé, le prompt devient candidat à exécution.

Avant de relancer le prompt, l’IA doit vérifier la `date de dernière exécution réussie` afin d’éviter de rejouer une occurrence déjà traitée.

La logique attendue est la suivante :

1. comparer `date de la prochaine exécution` à la date courante ;
2. si la prochaine exécution est passée, marquer le prompt comme à examiner ;
3. vérifier si une exécution réussie couvre déjà cette occurrence ;
4. si ce n’est pas le cas, proposer ou lancer l’exécution ;
5. après une exécution réussie, recalculer la prochaine date.

Les dates sont toujours au format `YYYY-MM-DDThh:mm:ss`.

## Actions proposées par l’IA

Lorsqu’elle lit le document, l’IA peut proposer une liste d’actions pour aider à la maintenance, à la mise à jour ou à l’exécution des prompts.

Les intitulés `A` à `Z` ne servent qu’à organiser cette liste de manière lisible et stable.

Exemples d’actions suggérées :

- `A - Liste des prompts à exécuter`
- `B - Exécution du prompt XXX`
- `T - Reformater les prompts inline`
- `U - Chiffrer le prompt XXX`
- `V - Retrier les blocs`
- `W - Proposer l’archivage de certains prompts`
- `X - Amélioration des prompts avec récurrence`
- `Y - Correction des logs passés`
- `Z - Amélioration du fonctionnement du Prompt Log`

L’IA peut aussi améliorer cette liste et mettre à jour cette explication.

## Format humain

Le format humain est une forme de capture rapide.

### Bloc minimum

```md
## Le_prompt
```

Dans ce cas, l’IA reformate le bloc en :

```md
## [titre déduit du prompt]
### Le_prompt
```

Puis elle complète les autres champs nécessaires.

### Bloc classique

```md
## [titre du prompt]
### Le_prompt
### autres propriétés
```

### Bloc inline

Le bloc inline est une forme intermédiaire, plus compacte, destinée à la saisie rapide.

```md
## le prompt | nom propriété : valeur | nom autre propriété : valeur | ...
```

L’IA peut transformer ce format en bloc canonique complet.
# Prompt Log

## retrouver anciens prompts
### prompt 
Reprendre la mémoire de nos conversation, et replacer ici les prompts

## propose amélioration du log

## ajouter une notion de tag au prompt log
