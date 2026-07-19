# Spécification — Risks (OBJ-008)
**Contexte :** Moosh
**Version :** 1.0
**Date :** 2026-07-19

## Champ | Type | Obligatoire | Contrainte | Description | Lien | Source
--------|------|-------------|------------|-------------|------|------
`id_risk` | UUID | Oui | Format UUID v4, unique au sein du référentiel | Identifiant unique du risque. Généré automatiquement lors de l'identification. | — | Moosh §1.0
`titre` | String | Oui | Max 200 caractères | Intitulé court et descriptif du risque. Doit être lisible par un non-spécialiste. | — | PM² §5.2.1
`description` | Text | Oui | Max 10000 caractères | Description détaillée du risque : cause, événement, conséquence. Peut inclure du Markdown. | — | PM² §5.2.2
`categorie` | Enum | Oui | [Technique, Organisationnelle, Financière, Externe, Humaine] | Type de risque. Détermine le domaine de responsabilité et les experts sollicités. | — | ISO 31000 §6.4
`probabilite` | Enum | Oui | [Forte, Moyenne, Faible] | Probabilité de survenance. Utilisée pour le calcul automatique du score. | — | ISO 31010
`impact` | Enum | Oui | [Majeur, Moyen, Mineur] | Impact si le risque se réalise. Mesuré en termes de coût, délai, qualité, réputation. | — | PM² §5.2.3
`score` | Integer | Non | Calculé automatiquement (probabilité × impact), plage [1, 9] | Score de criticité = probabilité × impact. Forte=3×Majeur=9, Moyenne×Moyen=4, Faible×Mineur=1. | — | Moosh §1.0
`plan_reponse` | Enum | Oui | [Eviter, Atténuer, Transférer, Accepter] | Stratégie de réponse planifiée. Détermine les actions à entreprendre. | — | PM² §5.3
`plan_action` | Text | Non | Max 5000 caractères | Actions de mitigation ou d'exploitation détaillées. Peut contenir des tâches liées à d'autres objets. | — | PM² §5.3.2
`responsable` | UUID | Oui | Doit pointer vers un objet OBJ-004 valide | Personne responsable du suivi et du traitement du risque. | OBJ-004 | PM² §5.2.5
`statut` | Enum | Oui | [Identifié, Actif, Réalisé, Inhibé, Clôturé] | État courant du risque. Contrôle le cycle de vie. | — | ISO 31000 §6.4
`date_creation` | DateTime | Oui | Format ISO 8601 avec timezone | Date et heure d'identification du risque. Généré automatiquement. | — | PM² §5.2.6
`date_revison` | DateTime | Non | Format ISO 8601 avec timezone, >= date_creation | Date de dernière révision du risque. Mis à jour lors de chaque revue. | — | ISO 31000 §6.4.3
`date_reelle_survenance` | Date | Non | Format ISO 8601 | Date de réalisation effective du risque (si applicable). Renseignement postérieur à l'événement. | OBJ-022 | Moosh §1.0
`contingence_budget` | Number | Non | >= 0, précision 2 décimales | Contingence budgétaire allouée si le risque se réalise. | OBJ-009 | PM² §5.3.3
`devise` | String | Non | Code ISO 4217 (EUR, USD, GBP, ...) | Devise de la contingence budgétaire. Par défaut EUR. | — | ISO 4217

## Cycle de vie

| Phase | Description | Transition autorisée |
|-------|-------------|---------------------|
| **Identifié** | Risque nouvellement identifié, non encore traité | → Actif, → Clôturé |
| **Actif** | Risque en cours de suivi et de mitigation | → Réalisé, → Inhibé, → Clôturé |
| **Réalisé** | Risque qui s'est produit — doit être relié à un incident | → Clôturé |
| **Inhibé** | Risque dont les conditions de survenance ont disparu | → Clôturé |
| **Clôturé** | Risque finalisé (réalisé, inhibé ou non applicable) | Aucune |

## Règles de calcul

Le `score` est calculé automatiquement selon la matrice suivante :

| | Majeur (3) | Moyen (2) | Mineur (1) |
|---|---|---|---|
| **Forte (3)** | 9 | 6 | 3 |
| **Moyenne (2)** | 6 | 4 | 2 |
| **Faible (1)** | 3 | 2 | 1 |

## Contraintes de gestion

1. **Score automatique** : Le `score` est recalculé automatiquement si `probabilite` ou `impact` change.
2. **Risques réalisés** : Un risque au statut `Réalisé` doit être relié à un incident (`OBJ-022`).
3. **Révision** : Les risques `Actifs` doivent être révisés au moins une fois par sprint/période.
4. **Immuabilité** : Une fois `Clôturé`, seul le statut peut changer (vers réouverture exceptionnellement).
5. **Contingence cohérente** : `contingence_budget` > 0 si `plan_reponse` = Accepter.

## Relations

| Objet lié | Code | Rôle | Cardinalité |
|-----------|------|------|-------------|
| Décisions | OBJ-003 | Décisions de traitement du risque | 1:N |
| Individus | OBJ-004 | Le responsable du risque | 1:1 |
| Budgets | OBJ-009 | Contingence budgétaire | 1:1 |
| Incidents | OBJ-022 | Lien si le risque se réalise | 1:1 |
| WorkPackages | OBJ-026 | Actions de mitigation | 1:N |

## Sources et références normatives

- **ISO 31000** — Management des risques, §6.4 Identification et analyse
- **ISO 31010** — Techniques d'analyse des risques (matrices, AMDEC, HAZOP)
- **PMBOK® Guide** — Risk management framework
- **PM²** — Risk management, §5.2.1 à §5.3.3
- **PRINCE2** — Risk management approach, risk register
- **NIST SP 800-30** — Guide for conducting risk assessments
- **COSO ERM** — Enterprise risk management framework
