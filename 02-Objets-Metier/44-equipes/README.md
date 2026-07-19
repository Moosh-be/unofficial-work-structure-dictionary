# Équipes (OBJ-044)

Les Équipes structurent les membres du projet en ensembles fonctionnels ou projetés.

Contrairement aux Groupes (OBJ-030) qui sont liés aux permissions, les Équipes sont liés à l'organisation humaine et fonctionnelle.

---

## Rôle

Les Équipes permettent de :

- **organiser** les membres en équipes de travail
- **définir** les équipes fonctionnelles (dev, QA, UX, etc.)
- **suivre** la composition des équipes
- **gérer** les conflits de ressources entre équipes
- **faciliter** la communication inter-équipes

---

## Distinction importante

> Un Groupe (OBJ-030) gère les permissions.
> Une Équipe (OBJ-044) gère l'organisation humaine.

Même formule : **Qui travaille ensemble** (Équipe) vs **Qui a les mêmes permissions** (Groupe).

---

## Distinction avec les autres objets liés aux personnes

| Objet | Question | Lien avec l'Équipe |
|-------|----------|---------------------|
| **Équipe** (OBJ-044) | Qui travaille ensemble ? | Organisation humaine et fonctionnelle |
| **Groupe** (OBJ-030) | Qui a les mêmes permissions ? | Permission management |
| **Member** (OBJ-037) | Qui a un accès ? | Un Member peut appartenir à une Équipe |
| **Individu** (OBJ-004) | Qui est la personne ? | Les Individus sont des Membres organisés en Équipes |
| **Ressource** (OBJ-043) | Qui est dans le périmètre ? | Une Ressource appartient à une Équipe |
| **Guest** (OBJ-034) | Qui a un accès externe ? | Les Guests peuvent être organisés en Équipes externes (ex: fournisseurs) |
| **Role** (OBJ-038) | Quelle est la responsabilité ? | Les équipes portent des Roles fonctionnels (ex: "Équipe Dev") |

> Le Groupe, c'est les permissions. L'Équipe, c'est les personnes. L'Assignation, c'est le qui fait quoi.

---

## Types d'équipes courantes

- **Équipe projet** : Membres actifs du projet
- **Équipe technique** : Développeurs, QA, DevOps
- **Équipe métier** : Experts fonctionnels, Product Owners
- **Comité de pilotage** : Décideurs
- **Équipe externe** : Fournisseurs, sous-traitants, consultants

---

## Principe

> Une équipe sans responsable est une équipe sans gouvernance.
> Une équipe trop nombreuse est une équipe qui communique mal.

---

## Normes existantes

- **ISO 21502** — Structures organisationnelles dans la gestion de projet
- **RACI Matrix** — Répartition des responsabilités au sein des équipes

---

## Outils connus

- **OpenProject** — Équipes natives avec membres assignés
- **Jira** — Teams et composants
- **Microsoft Teams** — Équipes et canaux
- **Slack** — Channels et équipes
- **Azure DevOps** — Teams et groupes de travail
