# Members (OBJ-037)

Les Members (membres internes) sont les personnes faisant partie intégrante de l'équipe projet.

---

## Rôle

Les Members permettent de :

- **gérer** l'équipe projet
- **attribuer** des rôles fonctionnels
- **contrôler** les permissions d'accès
- **suivre** la participation de chacun

---

## Différence entre Member et Guest

| Aspect | Member (interne) | Guest (externe) |
|--------|-----------------|-----------------|
| **Appartenance** | Équipe du projet | Hors équipe |
| **Permissions** | Plein accès selon rôle | Accès restreint |
| **Durée** | Continue (ou longue) | Temporaire |
| **Compte** | Compte complet | Compte limité |
| **Facturation** | Inclus | Souvent facturé |

---

## Rôles dans un projet OpenProject

| Rôle | Description | Permissions typiques |
|------|-------------|---------------------|
| **Admin** | Administrateur complet | Tout faire |
| **Manager** | Chef de projet / lead | Gérer projet, WorkPackages, rapports |
| **Developer** | Membre technique | Créer/éditer WorkPackages, saisir temps |
| **Tester** | QA / recette | Créer bugs, tester, commenter |
| **Observer** | Lecture seule | Voir tous les WorkPackages, rapports |
| **Reporter** | Rapport / documentation | Créer docs, rapports, pas de modification WP |

---

## Gestion des membres

- **Ajout** : Par un Admin ou Manager du projet
- **Rôles** : Assignation d'un rôle au membre
- **Évolution** : Changement de rôle possible en cours de projet
- **Sortie** : Désactivation ou suppression de l'accès

---

## Distinction avec les autres objets liés aux personnes

Le Member est l'accès **interne** au projet. D'autres objets cataloguent ou organisent les personnes :

| Objet | Question | Lien avec le Member |
|-------|----------|-------------------|
| **Individu** (OBJ-004) | Qui est la personne ? | L'Individu est la personne physique ; le Member est son accès projet |
| **Stakeholder** (OBJ-007) | Qui est concerné ? | Un Member est aussi un Stakeholder, mais l'inverse n'est pas vrai |
| **Guest** (OBJ-034) | Accès externe ? | Le Guest est l'équivalent externe du Member |
| **Group** (OBJ-030) | Qui travaille ensemble ? | Les Members sont organisés en Groupes |
| **Role** (OBJ-038) | Quelle responsabilité ? | Le Role définit la responsabilité ; le Member accède au projet |
| **Assignation** (OBJ-015) | Qui fait quoi ? | L'Assignation lie un Individu à un Role, indépendamment du Member |

> Le Member, c'est le compte projet complet. Le Guest, c'est son équivalent restreint pour les externes.

---

## Principe

> Un membre sans rôle est un membre invisible.
> Un membre avec trop de droits est un risque de sécurité.

---

## Normes existantes

- **ISO 27001** — Access control et RBAC (Role-Based Access Control)
- **NIST SP 800-53** — User management (AC-2)
- **Zero Trust Architecture** — Least privilege principle

---

## Outils connus

- **OpenProject** — Members avec rôles natifs
- **Azure AD / Entra ID** — Member management et permissions
- **Google Workspace** — User management et groupes
- **Okta** — Identity and access management
- **AWS IAM** — User et role management cloud
