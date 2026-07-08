# Roles (OBJ-038)

Les Roles (rôles fonctionnels) définissent les responsabilités et responsabilités dans le projet, indépendamment des personnes.

---

## Rôle

Les Rôles permettent de :

- **définir** les responsabilités fonctionnelles
- **dissocier** le rôle de la personne qui l'occupe
- **documenter** la structure organisationnelle du projet
- **faciliter** les transitions (changement de titulaire)

---

## Rôles classiques en gestion de projet

| Rôle | Responsabilités |
|------|----------------|
| **Sponsor** | Sponsor financier, décisionnaire final |
| **Project Manager** | Pilotage et exécution du projet |
| **Tech Lead** | Architecture et supervision technique |
| **Product Owner** | Définition et priorisation du backlog (agile) |
| **Scrum Master** | Facilitation des process agiles |
| **Business Analyst** | Analyse des besoins et exigences |
| **QA Lead** | Qualité et tests |
| **DevOps** | Infrastructure et déploiement |
| **Communications Manager** | Communication interne et externe |
| **Risk Manager** | Identification et suivi des risques |

---

## Distinction importante

> Le Role est le masque fonctionnel.
> L'Assignation (OBJ-015) lie un Individu (OBJ-004) à un Role pour une période.

Exemple : "Jean Dupont" (Individu) occupe le rôle "Project Manager" (Role) du 01/01 au 31/12 (Assignation).

---

## Distinction avec les autres objets liés aux personnes

Le Role définit **quoi faire**, pas **qui le fait** :

| Objet | Question | Lien avec le Role |
|-------|----------|------------------|
| **Individu** (OBJ-004) | Qui est la personne ? | L'Individu occupe le Role via une Assignation |
| **Stakeholder** (OBJ-007) | Qui est concerné ? | Les Stakeholders incluent des personnes avec des Roles, mais aussi des entités externes |
| **Member** (OBJ-037) | Qui a un accès ? | Le Member a un compte ; le Role définit ce compte peut faire |
| **Guest** (OBJ-034) | Qui a un accès externe ? | Un Guest peut occuper un Role (avec permissions limitées) |
| **Group** (OBJ-030) | Qui travaille ensemble ? | Un Group contient des Members qui occupent des Roles |
| **Assignation** (OBJ-015) | Qui fait quoi, quand ? | L'Assignation est le pont entre Individu et Role |

> Le Role, c'est le masque. L'Assignation, c'est qui porte le masque, pour combien de temps.

---

## Cycle de vie d'un rôle

1. **Defined** : Le rôle est défini dans le projet
2. **Assigned** : Une personne occupe le rôle
3. **Unassigned** : Le rôle est vacant (transition)
4. **Archived** : Le rôle n'est plus utilisé dans le projet

---

## Principe

> Un rôle non défini est un rôle non tenu.
> Un rôle vacant est un risque pour le projet.

---

## Normes existantes

- **ISO 21502** — Rôles et responsabilités dans la gestion de projet
- **PMBOK® Guide** — Resource management et role definition
- **RACI Matrix** — Framework de clarification des rôles
- **PRINCE2** — Organizational structure et roles

---

## Outils connus

- **OpenProject** — Roles natifs dans l'organisation du projet
- **Azure AD** — Role definitions et assignments
- **Jira** — Permission schemes et角色-based access
- **OKTA / Entra ID** — Directory roles
- **ServiceNow** — Role management ITSM
