# Risques (OBJ-008) — Contexte OpenProject v1.0

## Cadre

Ce document présente le contexte **OpenProject** pour l'objet métier **Risks (OBJ-008)**.

OpenProject gère les risques via les WorkPackages de type "Risk" avec :
- Des priorités de risque (High, Medium, Low)
- Des catégories configurables
- Un lien natif avec les WorkPackages enfants (actions de mitigation)
- Une vue tableau pour la matrice risque

## Principes OpenProject pour les risques

- Un risque est un WorkPackage de type dédié
- La priorité du WorkPackage = niveau de risque
- Les catégories sont configurables selon le projet
- Les actions de mitigation sont des WorkPackages enfants
- La matrice risque se visualise en vue tableau

## Différences avec Moosh

| Aspect | Moosh | OpenProject |
|--------|-------|-------------|
| Structure | Objet autonome | WorkPackage de type Risk |
| Score | Calculé automatiquement (probabilité × impact) | Priorité native (High/Medium/Low) |
| Réponse | Champ plan_reponse dédié | Description + WorkPackages enfants |
| Hiérarchie | parent_id explicite | Arborescence native |
| Historique | Par version de contexte | Historique natif OpenProject |

## Notes de version

| Version | Date | Changement |
|---------|------|------------|
| 1.0 | 2026-07-19 | Première version du contexte OpenProject |
