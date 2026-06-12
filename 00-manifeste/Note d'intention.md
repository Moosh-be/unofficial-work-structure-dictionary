# Genèse — nomenclature d’artefacts de gestion (un dépôt d’abord personnel)

> Ce README est volontairement **personnel**.  
> Il raconte la **genèse** du projet, son point de départ situé, ses tensions, ses convictions.  
> Le projet vise peut‑être à devenir communautaire avec le temps, mais **dans un premier temps il répond à des besoins très personnels et contextualisés**.  
> Je préfère l’assumer plutôt que de faire semblant d’être neutre.

---

## Qu’est-ce que j’essaye de faire ?

Je construis empiriquement — en tentant d’être le plus propre et ouvert possible — une **nomenclature** (et, à terme, un **modèle de données**) pour structurer des **artefacts de gestion**.

Je ne cherche pas à inventer une méthode de plus.  
Je cherche à mieux nommer, mieux structurer, mieux découpler.

---

## Pourquoi ça existe (mon histoire rapide)

Ça fait ~30 ans que je bosse sur des projets.

- Début des années 2000 : découverte de Scrum, Lean, puis de “l’agilité”.
- 2020 : retour brutal à de la gestion de projet plus “classique”, parfois en mode “siècle précédent”, parfois en hybridation sincère, souvent en confrontation avec des habitudes héritées (tailorisme, reporting, rigidités d’outils).

Avec le temps, un constat s’impose :

> Les méthodes changent, les outils passent…  
> mais on se retrouve toujours avec les **mêmes types d’objets** à gérer.

---

## Le constat : les artefacts sont universels (ou presque)

Quel que soit le cadre (projet, produit, service… agile, classique, hybride…), on manipule toujours :

- des **tâches**
- des **personnes / rôles**
- des **décisions**
- des **dates / jalons**
- des **dépenses / budgets**
- des **biens / ressources**
- des **idées**
- des **demandes**
- des **objectifs**
- des **rapports**
- des **validations**
- …et d’autres variantes du même “bestiaire”.

Les approches orientent la manière d’aborder les choses.  
Mais les objets métier, eux, reviennent.

---

## Le but (sobrement)

Proposer une **convention** pour structurer les données de ces objets métiers  
et fournir (ou faciliter) les **outils** qui peuvent aller avec.

En d’autres mots : rendre les artefacts plus **interopérables**, plus **durables**, plus **réutilisables**, moins captifs des outils et des méthodes.

---

## Mes convictions (elles sont structurantes)

Je suis “ultra convaincu” par :

- **l’open source**
- **Creative Commons**
- **le data mesh**
- **le découplage**

Ça influence directement l’intention de ce dépôt :  
séparer au maximum **les données**, **les pratiques**, **les outils**, et **les contextes**.

---

## Une démarche volontairement empirique (et assumée imparfaite)

Je construis empiriquement :

- parce que je sais que je suis humain
- parce que je n’ai pas “la solution” (et que personne ne l’a)
- parce que je ferai de mauvais choix
- parce que je ferai parfois de bons choix… mais *bons pour moi* et pas forcément pour d’autres

Je veux concilier :

- un **noyau commun** (stable, réutilisable)
- et des **branches inclusives** (adaptées à des contextes variés)

---

## Deux réalités : “mon boulot” vs “mes valeurs”

Je fais volontairement la distinction entre :

### 1) Les besoins **pour mon boulot** (contexte contraint)

Ici, je suis pragmatique : je dois composer avec un environnement outil, des contraintes d’entreprise, et des attentes parfois très normées.

Mon terrain principal dans ce contexte est **SharePoint** (Pages, Lists), et l’écosystème M365.

Objectif dans ce monde-là :  
> **apporter du sens et de la structure** sans tout casser, sans dogme, en restant utilisable par d’autres.

### 2) Les besoins **pour mes valeurs** (contexte choisi)

Ici, je cherche la cohérence avec mes convictions : ouverture, standards, contribution, pérennité.

Dans ce cadre, **OpenProject** est central (même si pas adopté dans mon contexte pro),  
et ce dépôt sert aussi de lieu d’exploration et de capitalisation.

Objectif dans ce monde-là :  
> construire quelque chose de **partageable**, **forkable**, contributif, potentiellement communautaire.

---

## Mon contexte actuel (situation de départ)

### Outils

- **MS Project** *(abandon à envisager)*
- **MS Planner** *(solution de repli pour l’abandon de MS Project)*
- **MS To Do** *(solution de base pour solo)*
- **Jira Software Datacenter** *(abandon en 2029)*
- **OpenProject** *(solution à l’essai / non adoptée au travail / soutenue par conviction)*
- **Miro** *(solution d’entreprise)*
- **SharePoint** *(Pages, Lists)*
- **GitHub**
- **GitLab**
- **Power Query**
- **Power BI**
- **Oracle Analytics Cloud**
- **Denodo**
- **Joplin**
- **Obsidian**
- **VS Code**

### Gestion / pratiques (réalité, legacy, intention)

#### Réalité
- projet sans méthode
- produit en Scrum
- produit en SAFe (fortement modifié)
- service sans méthode

#### Legacy
- projet PMP / PRINCE2

#### Intention
- projet avec **PM²**
- hybridation projet/agilité avec **PAM²**
- programme avec **PgM²**
- portefeuille avec **PfM²**
- produit/service en **SAFe**
- service en **ITIL 4**
- architecture avec **TOGAF**
- changement avec **ADKAR**

---

## Ce dépôt aujourd’hui (position honnête)

Aujourd’hui, ce projet :

- est d’abord un **outil pour moi**
- est explicitement **contextualisé**
- assume un point de vue “depuis le terrain”
- cherche à être propre, documenté, et ouvrable

Peut-être qu’il deviendra communautaire.  
Mais je ne veux pas brûler les étapes.

---

## Ce que ce dépôt n’est pas

- ❌ une méthode de gestion
- ❌ un cadre à imposer
- ❌ une vérité universelle
- ❌ un “standard” décrété

C’est :
- ✅ une genèse
- ✅ un laboratoire
- ✅ une tentative de nomenclature structurée
- ✅ un projet pensé pour pouvoir s’ouvrir sans se renier

---

## (Optionnel) Une direction de structuration future

Sans engagement, quelques axes probables :

- un **noyau commun** d’artefacts (core)
- des **extensions par contexte** (projet / produit / service / cadre)
- des **mappings outils** (SharePoint Lists, OpenProject, Planner, etc.)
- une représentation “neutre” (YAML/JSON) pour la portabilité

---
## Mon rêve (objectif assumé, même s’il paraît démesuré)

Directive INSPIRE (CELEX:02007L0002-20241126)](https://eur-lex.europa.eu/legal-content/FR/TXT/HTML/?uri=CELEX:02007L0002-20241126)

### Pourquoi ce rêve a du sens (à mes yeux)

Parce que la gestion (projet / produit / service / portefeuille…) souffre d’un problème proche de celui que INSPIRE adresse dans un autre domaine :

- les mêmes objets existent partout… mais sont nommés et structurés différemment
- les outils enferment les données dans des formats peu interchangeables
- les organisations réinventent des conventions non compatibles entre elles
- la comparaison, l’agrégation, la transparence et la capitalisation deviennent coûteuses

Un langage commun des artefacts — même minimal — pourrait faciliter :

- l’interopérabilité entre outils
- la circulation de la donnée (data mesh)
- la capitalisation et la traçabilité
- l’hybridation des cadres (sans guerre de méthodes)
- l’open source appliqué à la gestion (pas seulement au code)

### Ce que je vise réellement (et ce que je ne promets pas)

Je ne “vise” pas une norme UE comme un objectif opérationnel à court terme.  
Je le formule comme une **direction**, une **boussole**, un **horizon**.

Ce projet commence par :
- un besoin personnel
- un contexte concret
- des artefacts très terrestres
- des outils imparfaits
- des compromis assumés

S’il doit devenir “grand”, ce ne sera pas par proclamation, mais par accumulation :
- d’usage réel
- de clarté
- de contributions
- de stabilité du noyau
- et d’extensions compatibles

### Une condition non négociable : rester ouvert

Si un jour ce travail prend de l’ampleur, je veux qu’il reste :
- réutilisable
- forkable
- améliorable
- transmissible

et surtout **qu’aucune appropriation propriétaire ne puisse confisquer le langage commun**.

C’est pour cela que je privilégie une logique de type *copyleft* pour les contenus conceptuels :  
*« tout le monde peut utiliser ; si tu redistribues, tu restes dans le commun »*.

J’ai un rêve un peu naïf, au sens noble du terme :  
celui du *« il ne savait pas que c’était infaisable, donc il l’a fait »*.

Si ce projet tient, s’il trouve sa forme, s’il est adopté, amélioré, éprouvé…  
alors **j’aimerais qu’il puisse un jour devenir une norme européenne** —  
à l’instar de ce qu’a été **INSPIRE** pour les données géographiques.

INSPIRE est pour moi un repère :  
une initiative qui montre qu’un **socle commun de définitions**, de structures et d’interopérabilité peut devenir un levier majeur à l’échelle d’un écosystème entier.



*Fin du README de genèse.*