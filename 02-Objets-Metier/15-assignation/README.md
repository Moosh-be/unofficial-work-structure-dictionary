# Assignation (OBJ-015)

L'assignation représente l'affectation d'un individu à un rôle fonctionnel sur une période donnée.

C'est le lien entre les personnes et leur contribution au projet.

---

## Rôle

Les assignations permettent de :

- **affecter** les personnes aux rôles et tâches
- **suivre** la couverture des postes clés
- **gérer** les transitions et les changements
- **documenter** l'historique des affectations

---

## Distinction importante

> L'assignation n'est ni l'individu, ni le rôle.
> C'est le lien temporel entre un individu et un rôle.

Même formule : **Qui** (individu) fait **Quoi** (rôle) **Quand** (période).

Exemple : "Jean Dupont" (Individu, OBJ-004) occupe le rôle "Project Manager" (Role, OBJ-038) du 01/01 au 31/12 (Assignation, OBJ-015).

---

## Distinction avec les autres objets liés aux personnes

Le champ des personnes mobilise **7 objets distincts**, chacun répondant à une question précise :

| Objet | Question | Exemple |
|-------|----------|---------|
| **Individu** (OBJ-004) | Qui est la personne ? | "Jean Dupont" |
| **Stakeholder** (OBJ-007) | Qui est concerné par le projet ? | Client, sponsor, utilisateur final |
| **Group** (OBJ-030) | Qui travaille ensemble ? | "Équipe technique" |
| **Member** (OBJ-037) | Qui a un accès interne au projet ? | Jean a un compte complet |
| **Guest** (OBJ-034) | Qui a un accès externe ? | Consultant, fournisseur |
| **Role** (OBJ-038) | Quelle est la responsabilité ? | "Project Manager", "Tech Lead" |
| **Assignation** (OBJ-015) | Qui fait quoi, quand ? | Jean occupe PM du 01/01 au 31/12 |

> L'Assignation est le seul objet qui lie **quand** un Individu occupe un Role. Les autres objets cataloguent, organisent ou donnent accès.

---

## Gestion des transitions

Une assignation doit documenter :

- La **date de début** de l'affectation
- La **date de fin** (si applicable)
- Les **conditions de sortie** (transition, remplacement)
- Les **compétences** apportées

---

## Principe

> Un rôle non assigné est un rôle non tenu.
> Une assignation non documentée est un risque de perte de savoir.

---

## Normes existantes

- **ISO 21502** — Affectation des rôles et responsabilités
- **RACI Matrix** — Matrice de répartition des responsabilités (Responsible, Accountable, Consulted, Informed)
- **PMBOK® Guide** — Resource management and assignments

---

## Outils connus

- **OpenProject** — Assignation native dans les WorkPackages
- **Jira** — Assignee field
- **Microsoft Project** — Resource assignments
- **Azure DevOps** — Assigné aux work items
- **Smartsheet** — Assignation dans sheets
