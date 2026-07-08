# Documents (OBJ-010)

Les documents regroupent l'ensemble des artefacts documentaires produits ou utilisés par le projet.

---

## Rôle

Les documents permettent de :

- **centraliser** la documentation du projet
- **traçabilité** des versions et révisions
- **faciliter** l'accès à l'information
- **archiver** les preuves du projet

---

## Classification

Les documents peuvent être classés selon :

- **Nature** : Technique, Fonctionnel, Manager, Contractuel, Pédagogique
- **Statut** : Brouillon, En revue, Validé, Archivé
- **Destinataire** : Interne, Externe, Réglementaire

---

## Gestion documentaire

Un document doit être :

- **identifié** de façon unique
- **versionné** (numéro de version + date)
- **rattaché** à un contexte (livrable, décision, risque)
- **accessible** aux parties prenantes concernées

---

## Distinction : Document vs File vs Pièce jointe

Le nom "Document" ne couvre pas tout. Trois concepts distincts coexistent :

| Concept | Objet | Nature |
|---------|-------|--------|
| **Document** (OBJ-010) | Artefact documentaire | Sémantique, contenu, statut, cycle de vie |
| **File** (OBJ-032) | Binaire brut | Technique, stockage, checksum |
| **Pièce jointe** | Lien relationnel | Attachement d'un File à un objet |

> Le Document, c'est l'artefact (sémantique, statut, cycle de vie). Le File, c'est le support technique (binaire brut, taille, checksum). La Pièce jointe, c'est le lien entre les deux.

### Exemples

- **Un Document contient plusieurs Files** : "Rapport de sprint" (Document) → `rapport.pdf`, `captures.png`, `metrics.xlsx` (3 Files)
- **Un même File attaché à plusieurs Documents** : `contrat-vendor.pdf` (1 File) peut servir de base à plusieurs Documents (offre, bon de commande, suivi)
- **Un File sans Document** : une image de debug uploadée par un développeur, sans artefact documentaire associé
- **Un Document sans File** : une page Confluence ou un texte dans un WorkPackage

---

## Distinction avec les Files (OBJ-032)

| | Document (OBJ-010) | File (OBJ-032) |
|--|-------------------|----------------|
| **Nature** | Artefact documentaire | Binaire brut |
| **Sémantique** | Oui : statut, auteur, cycle de vie, classification | Non : nom, taille, extension, checksum |
| **Lien** | Peut contenir plusieurs Files | Peuvent être attachés à plusieurs objets |
| **Usage** | Gouvernance, traçabilité, révision | Stockage technique, pièce jointe |
| **Exemple** | "Rapport de décision Q2" | `decision-q2.pdf` |

> Le Document gère le **contenu**. Le File gère le **support**. La pièce jointe gère le **lien**.

---

## Principes

> Un document non archivé est un document perdu.
> Un document non versionné est un document douteux.
