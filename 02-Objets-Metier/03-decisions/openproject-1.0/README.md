# Décisions (OBJ-003) — Contexte OpenProject v1.0

## Cadre

Ce document présente le contexte **OpenProject** pour l'objet métier **Décisions (OBJ-003)**.

OpenProject structure les décisions via les WorkPackages de type "Decision" avec une hiérarchie native Portfolio → Projet → Sous-projet.

Les décisions OpenProject s'appuient sur :
- Un suivi de workflow natif (New → In Review → Approved → Rejected)
- Une hiérarchie de projets intégrée
- Un registre centralisé par projet
- Des champs personnalisables

## Principes OpenProject pour les décisions

- Une décision est un WorkPackage de type dédié
- Chaque décision a un workflow propre (New, In Review, Approved, Rejected, Postponed)
- La décision est liée au projet via l'arborescence native
- Le statut de la décision est visible en vue liste ou Gantt
- Les commentaires constituent la justification (champs personnalisables)

## Différences avec Moosh

| Aspect | Moosh | OpenProject |
|--------|-------|-------------|
| Structure | Objet autonome | WorkPackage de type Decision |
| Workflow | Identifié → Actif → Réalisé/Inhibé/Clôturé | New → In Review → Approved → Rejected |
| Justification | Champ texte dédié | Commentaires + champs personnalisables |
| Hiérarchie | parent_id explicite | Arborescence native Projet → Sous-projet |
| Historique | Par version de contexte | Historique natif OpenProject |

## Notes de version

| Version | Date | Changement |
|---------|------|------------|
| 1.0 | 2026-07-19 | Première version du contexte OpenProject |
