# Individus (OBJ-004)

Les individus représentent les personnes physiques impliquées dans le projet.

Cet objet distingue les personnes de leurs rôles fonctionnels (ces derniers étant gérés par l'Objet Assignation).

---

## Rôle

Les individus permettent de :

- centraliser les **informations personnelles** nécessaires au pilotage
- respecter la **protection des données** (RGPD)
- servir de **référent unique** pour chaque personne
- faciliter la **gestion des ressources**

---

## Informations collectées

Les informations minimales pour un individu :

- Nom et prénom
- Contact professionnel
- Compétences principales
- Organisation d'appartenance

---

## Distinction importante

> Un individu n'est pas un rôle.
> Un individu peut occuper plusieurs rôles dans un projet.
> Un rôle peut être occupé par plusieurs individus.

Cette séparation permet une plus grande flexibilité dans la gestion des ressources.

---

## Distinction avec les autres objets liés aux personnes

L'Objet Individu (OBJ-004) n'est qu'un des 7 objets liés aux personnes. Voici où il s'inscrit :

| Objet | Question | Lien avec l'Individu |
|-------|----------|---------------------|
| **Individu** (OBJ-004) | Qui est la personne ? | Identité physique : nom, contact, compétences |
| **Stakeholder** (OBJ-007) | Qui est concerné ? | Entité d'influence, peut inclure des Individus |
| **Member** (OBJ-037) | Accès interne ? | Un Individu peut devenir Member (compte projet) |
| **Guest** (OBJ-034) | Accès externe ? | Un Individu peut être Guest (accès limité) |
| **Role** (OBJ-038) | Quelle responsabilité ? | Les Roles sont distincts des Individus |
| **Assignation** (OBJ-015) | Qui fait quoi ? | L'Assignation lie un Individu à un Role |
| **Group** (OBJ-030) | Qui travaille ensemble ? | Les Members (qui sont des Individus) sont organisés en Groupes |

> L'Individu est la personne physique. L'Assignation lie cet Individu à un Role. Le Member/Guest est son accès technique au projet.

---

## Normes existantes

- **RGPD / GDPR** — Protection des données personnelles
- **ISO 27001** — Protection des informations sensibles
- **ISO 30408** — Gestion des identités (contexte RH)

---

## Outils connus

- **OpenProject** — Gestion des membres et individus
- **Jira** — Gestion des assignees et équipes
- **Azure DevOps** — Gestion des utilisateurs et équipes
- **SharePoint People** — Annuaire d'entreprise
- **OKTA / Azure AD** — Gestion des identités et accès (SSO)
- **Lark / Slack** — annuaires internes intégrés
