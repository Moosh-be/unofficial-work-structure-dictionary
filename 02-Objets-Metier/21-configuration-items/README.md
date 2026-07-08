# Configuration Items (OBJ-021)

Les éléments de configuration sont les livrables, artifacts ou composants dont les caractéristiques sont contrôlées et versionnées.

---

## Rôle

Les CI permettent de :

- **identifier** tous les éléments sous contrôle de configuration
- **versionner** les modifications
- **tracer** les liens entre éléments
- **assurer** la reproductibilité et l'intégrité

---

## Baseline

Une baseline (référence) est un ensemble de CI validés et figés à un instant T :

- **Baseline fonctionnelle** : Ce que le système fait
- **Baseline physique** : Comment le système est construit
- **Baseline de référence** : Point de comparaison pour les écarts

---

## Gestion de configuration

La gestion de configuration comprend :

- **Identification** : Lister et nommer les CI
- **Contrôle** : Valider les modifications
- **Comptage** : Suivre les versions
- **Vérification** : Auditer la conformité

---

## Principe

> Un élément non identifié n'est pas contrôlé.
> Une baseline non figée est une baseline inutile.

---

## Normes existantes

- **ISO/IEC/IEEE 15288** — System and software engineering lifecycle processes
- **PMBOK® Guide** — Configuration management et change control
- **ITIL 4** — Service configuration management
- **ISO 10007** — Configuration management guidelines

---

## Outils connus

- **Git / GitLab / GitHub** — Versioning de code et configuration items
- **OpenProject** — CI tracked via WorkPackages
- **Confluence** — Baseline documentation
- **Azure DevOps** — Build/release pipelines avec configuration items
- **SaltStack / Ansible** — Configuration management automatisé
- **IBM Engineering Workflow Management** — Configuration items ALM
