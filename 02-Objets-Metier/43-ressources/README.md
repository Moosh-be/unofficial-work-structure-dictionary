# Ressources Humaines (OBJ-043)

Les Ressources Humaines représentent les personnes disponibles pour le projet, avec leur identité, équipe et rôle majeur.

Cet objet complète l'objet Individus (OBJ-004) en ajoutant un contexte spécifique au périmètre du projet.

---

## Rôle

Les Ressources Humaines permettent de :

- **cataloguer** les personnes disponibles dans le périmètre du projet
- **associer** chaque personne à une équipe et un rôle majeur
- **suivre** les disponibilités et les conflits d'affectation
- **gérer** les transitions (arrivée, départ, changement d'équipe)

---

## Distinction importante

> L'Individu (OBJ-004) est la personne physique.
> La Ressource (OBJ-043) est la même personne dans le contexte du projet.

Exemple : "Jean Dupont" (Individu, OBJ-004) est la même personne que "Ressource Jean Dupont - Équipe Technique" (Ressource, OBJ-043).

---

## Distinction avec les autres objets liés aux personnes

| Objet | Question | Lien avec la Ressource |
|-------|----------|------------------------|
| **Individu** (OBJ-004) | Qui est la personne ? | L'Individu est la même personne que la Ressource |
| **Équipe** (OBJ-044) | À quelle équipe appartient ? | La Ressource appartient à une Équipe |
| **Stakeholder** (OBJ-007) | Qui est concerné ? | Une Ressource peut être un Stakeholder |
| **Member** (OBJ-037) | Qui a un accès ? | Une Ressource devient Member pour avoir accès |
| **Guest** (OBJ-034) | Qui a un accès externe ? | Un Guest peut être une Ressource externe |
| **Role** (OBJ-038) | Quelle est la responsabilité ? | Le Role majeur de la Ressource est son rôle principal |
| **Assignation** (OBJ-015) | Qui fait quoi ? | L'Assignation lie la Ressource à un Role pour une période |

> La Ressource, c'est l'Individu projeté dans le périmètre du projet. C'est le "qui est dans l'équipe, avec quel rôle, et quelle équipe".

---

## Normes existantes

- **ISO 21502** — Gestion des ressources humaines dans les projets
- **ISO 30408** — Gestion des identités et accès (contexte RH)
- **RGPD / GDPR** — Protection des données personnelles

---

## Outils connus

- **OpenProject** — Gestion des membres et ressources
- **Jira + Tempo** — Gestion des ressources humaines
- **MS Project** — Ressource management
- **Azure DevOps** — Users et équipes
- **Smartsheet** — Resource management
