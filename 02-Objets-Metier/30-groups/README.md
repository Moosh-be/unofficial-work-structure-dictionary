# Groups (OBJ-030)

Les Groups (groupes ou équipes) structurent les membres du projet en ensembles fonctionnels.

---

## Rôle

Les Groupes permettent de :

- **organiser** les membres par rôle ou fonction
- **gérer** les permissions de façon groupée
- **faciliter** la communication ciblée
- **classifier** les rôles et responsabilités

---

## Groupes prédéfinis (OpenProject)

OpenProject propose des groupes standard :

| Groupe | Rôle |
|--------|------|
| **Administrators** | Accès total au projet |
| **Developers** | Accès développement et documentation |
| **Testers** | Accès tests et documentation technique |
| **Managers** | Accès pilotage et rapports |
| **Observers** | Lecture seule |

---

## Groupes personnalisés

Les projets peuvent créer des groupes sur mesure :

- **Équipe projet** : Membres actifs
- **Comité de pilotage** : Décideurs
- **Équipe technique** : Développeurs, QA, DevOps
- **Experts métier** : Consultants fonctionnels
- **Partenaires** : Fournisseurs, sous-traitants

---

## Permissions par groupe

Les groupes déterminent les permissions :

- **Visualisation** : Quels work packages voir ?
- **Édition** : Quels work packages modifier ?
- **Administration** : Qui peut gérer les paramètres ?
- **Reporting** : Accès aux rapports et statistiques

---

## Distinction avec les autres objets liés aux personnes

Le Group organise les personnes en **ensembles fonctionnels**. D'autres objets cataloguent ou lient les personnes :

| Objet | Question | Lien avec le Group |
|-------|----------|-------------------|
| **Individu** (OBJ-004) | Qui est la personne ? | Les Individus deviennent Members pour être dans un Group |
| **Stakeholder** (OBJ-007) | Qui est concerné ? | Un Group peut être un Stakeholder collectif |
| **Member** (OBJ-037) | Qui a un accès ? | Les Members sont les Individus intégrés au projet, organisés en Groups |
| **Guest** (OBJ-034) | Accès externe ? | Les Guests peuvent être organisés en Groupes personnalisés (ex: "Fournisseurs") |
| **Role** (OBJ-038) | Quelle responsabilité ? | Les Groups portent des Roles fonctionnels (ex: "Équipe technique") |
| **Assignation** (OBJ-015) | Qui fait quoi ? | L'Assignation est individuelle ; le Group est collectif |

> Le Group, c'est l'organisation collective. L'Assignation, c'est l'affectation individuelle.

---

## Principe

> Un membre par défaut = un groupe vide.
> Un projet sans groupes = une gestion des permissions chaotique.

---

## Normes existantes

- **ISO 27001** — Gestion des accès et contrôle d'accès basé sur les groupes
- **NIST SP 800-53** — Group-based access control (AC-2)
- **Zero Trust Architecture (NIST SP 800-207)** — Least privilege via group membership

---

## Outils connus

- **OpenProject** — Groups natifs avec permissions par groupe
- **Azure AD / Entra ID** — Group management pour permissions
- **Okta** — Group-based access management
- **Google Groups** — Groupes et permissions Google
- **Keycloak** — Open source group management et RBAC
