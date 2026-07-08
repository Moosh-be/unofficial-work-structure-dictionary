# Guests (OBJ-034)

Les Guests (membres externes) sont des utilisateurs qui ont un accès restreint au projet sans être membres à part entière.

---

## Rôle

Les Guests permettent de :

- **donner un accès** à des personnes externes sans compte complet
- **contrôler** finement les permissions
- **suivre** l'accès des collaborateurs externes
- **faciliter** la collaboration avec des partenaires

---

## Différence entre membre et guest

| Aspect | Membre | Guest |
|--------|--------|-------|
| **Compte** | Compte projet complet | Accès limité |
| **Permissions** | Définies par groupe | Définies individuellement |
| **Accès** | Tous les work packages | Restreints |
| **Durée** | Continue | Temporaire |
| **Facturation** | Inclus dans le projet | Souvent facturé séparément |

---

## Cas d'usage

- **Clients** : Accès en lecture seule au suivi
- **Fournisseurs** : Accès à leurs WorkPackages
- **Consultants externes** : Accès temporaire
- **Auditeurs** : Accès ponctuel à la documentation
- **Partenaires** : Collaboration limitée

---

## Gestion

- **Accès temporaire** : Dates de début et fin définies
- **Permissions granulaires** : Par WorkPackage ou groupe
- **Audit** : Historique des connexions et actions
- **Désactivation** : Accès révocable à tout moment

---

## Distinction avec les autres objets liés aux personnes

Le Guest est l'accès **externe** au projet. D'autres objets cataloguent ou organisent les personnes :

| Objet | Question | Lien avec le Guest |
|-------|----------|-------------------|
| **Individu** (OBJ-004) | Qui est la personne ? | L'Individu est la personne physique ; le Guest est son accès projet restreint |
| **Stakeholder** (OBJ-007) | Qui est concerné ? | Un Guest est un Stakeholder externe |
| **Member** (OBJ-037) | Accès interne ? | Le Member est l'équivalent interne du Guest |
| **Group** (OBJ-030) | Qui travaille ensemble ? | Les Guests peuvent être organisés en Groupes personnalisés |
| **Role** (OBJ-038) | Quelle responsabilité ? | Le Guest a un rôle fonctionnel (Role) mais avec des permissions limitées |
| **Assignation** (OBJ-015) | Qui fait quoi ? | L'Assignation peut lier un Guest à un Role pour une période |

> Le Guest, c'est le Member externe : accès restreint, temporaire, avec permissions définies individuellement.

---

## Principe

> Un accès externe bien contrôlé est une collaboration efficace.
> Un accès externe non surveillé est un risque de sécurité.

---

## Normes existantes

- **ISO 27001** — Access control pour les tiers (A.9)
- **NIST SP 800-53** — External account management (AC-17)
- **RGPD** — Gestion des données partagées avec des tiers
- **Zero Trust** — Never trust, always verify pour accès externes

---

## Outils connus

- **OpenProject** — Guests natifs avec permissions limitées
- **Azure AD B2B** — Guest access pour partenaires externes
- **Google Guest Access** — Accès invité dans Workspace
- **AWS IAM Identity Center** — External user management
- **Okta External Identity** — Guest et partner identity management
