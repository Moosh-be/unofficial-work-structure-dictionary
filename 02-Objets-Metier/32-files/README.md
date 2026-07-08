# Files (OBJ-032)

Les Files (fichiers) sont les binaires bruts attachés au projet : chaque fichier est un objet technique de stockage, sans sémantique propre.

---

## Rôle

Les Files permettent de :

- **stocker** les binaires (PDF, images, archives, configs, etc.)
- **versionner** les fichiers physiques
- **contrôler** l'accès aux fichiers sensibles
- **tracer** qui a uploadé, quand, sur quel objet

---

## Distinction : Document vs File vs Pièce jointe

C'est un point crucial : le nom "Files" ne couvre pas tout ce qui est documentaire. Trois concepts distincts coexistent :

| Concept | Objet | Nature | Question |
|---------|-------|--------|----------|
| **Document** (OBJ-010) | Artefact documentaire | Sémantique, contenu, statut, cycle de vie | Quel est l'artefact ? |
| **File** (OBJ-032) | Binaire brut | Technique, stockage, checksum | Quel est le fichier physique ? |
| **Pièce jointe / Attachement** | Lien relationnel | Relation entre un File et un objet | Où ce fichier est-il rattaché ? |

> Le Document, c'est l'artefact (sémantique, statut, cycle de vie). Le File, c'est le support technique (binaire brut, taille, checksum). La Pièce jointe, c'est le lien entre les deux.

### Exemples concrets

- **Un Document peut contenir plusieurs Files** : "Rapport de sprint" (Document) → `rapport.pdf`, `captures.png`, `metrics.xlsx` (3 Files)
- **Un même File peut être attaché à plusieurs objets** : `contrat-vendor.pdf` (1 File) attaché à un achat, une décision, et un WorkPackage
- **Un File sans Document** : une image de debug uploadée par un développeur, sans artefact documentaire associé
- **Un Document sans File** : une page Confluence ou un texte dans un WorkPackage, sans fichier binaire sous-jacent

---

## Fonctionnalités

- **Attachement** : Lier un File à un WorkPackage ou tout autre objet
- **Organisation** : Dossiers et métadonnées (nom, extension, taille)
- **Contrôle d'accès** : Permissions par fichier
- **Historique** : Versionnement des fichiers physiques
- **Recherche** : Indexation du contenu

---

## Types de Files courants

- **Documents** : PDF, DOCX, ODT
- **Images** : PNG, JPG, SVG, figures, captures
- **Données** : CSV, JSON, XML, exports
- **Config** : YAML, INI, TOML, scripts
- **Archives** : ZIP, TAR
- **Code** : Patches, snippets

---

## Règles de gestion

- **Taille maximale** : Limite par fichier et par projet
- **Types autorisés** : Liste blanche ou noire d'extensions
- **Versionnement** : Conservation des anciennes versions
- **Traçabilité** : Qui a uploadé, quand, sur quel objet
- **Checksum** : Hachage pour détecter les duplicatas et corruptions

---

## Principe

> Un WorkPackage sans pièce jointe est un WorkPackage incomplet.
> Un fichier sans metadata est un fichier perdu.

---

## Distinction avec les Documents (OBJ-010)

| | Document (OBJ-010) | File (OBJ-032) |
|--|-------------------|----------------|
| **Nature** | Artefact documentaire | Binaire brut |
| **Sémantique** | Oui : statut, auteur, cycle de vie | Non : nom, taille, checksum |
| **Lien** | Peut contenir plusieurs Files | Peut être attaché à plusieurs objets |
| **Usage** | Gouvernance, traçabilité, révision | Stockage technique, pièce jointe |
| **Exemple** | "Rapport de décision Q2" | `decision-q2.pdf` |

> Le Document gère le **contenu**. Le File gère le **support**. La pièce jointe gère le **lien**.

---

## Normes existantes

- **ISO 15489** — Records management (gestion des documents et archives)
- **ISO 16363** — Audit and certification of trustworthy digital repositories
- **MOT (Meta-Data Online)** — Metadata standard for electronic records
- **OAIS (ISO 14721)** — Reference model for archiving

---

## Outils connus

- **OpenProject** — Files attachés aux WorkPackages natifs
- **SharePoint** — Document management avec metadata
- **Confluence** — Attachments dans les pages
- **Nextcloud / ownCloud** — Stockage de fichiers collaboratif
- **Dropbox Business** — File sharing et collaboration
- **Box** — Enterprise content management
- **GitHub / GitLab** — File versioning pour code et config
