# Spécification — Risks (OBJ-008)
**Contexte :** PM²
**Version :** 1.0
**Date :** 2026-07-19

## Champ | Type | Obligatoire | Contrainte | Description | Lien | Source
--------|------|-------------|------------|-------------|------|------
`id_risk` | UUID | Oui | Format UUID v4 | Identifiant unique du risque. Format RISK-YYYY-NNN. | — | PM² §5.2.1
`titre` | String | Oui | Max 200 caractères | Intitulé court du risque. | — | PM² §5.2.2
`description` | Text | Oui | Max 10000 caractères | Description détaillée : cause, événement, conséquence. | — | PM² §5.2.3
`categorie` | Enum | Oui | [Technique, Organisationnelle, Financière, Externe, Humaine, Légale] | Type de risque. Légale ajoutée pour contexte européen. | — | PM² §5.2.4
`type_risque` | Enum | Oui | [Menace, Opportunité] | Distingue risque négatif (menace) et positif (opportunité). | — | PM² §5.2.5
`probabilite` | Enum | Oui | [Très Forte, Forte, Moyenne, Faible, Très Faible] | Probabilité de survenance. Échelle 5 niveaux PM². | — | PM² §5.2.6
`impact` | Enum | Oui | [Critique, Majeur, Modéré, Mineur, Négligeable] | Impact business si réalisation. Échelle 5 niveaux PM². | — | PM² §5.2.7
`score` | Integer | Non | Calculé automatiquement, plage [1, 25] | Score PM² = probabilité (1-5) × impact (1-5). | — | PM² §5.2.8
`plan_reponse` | Enum | Oui | [Eviter, Atténuer, Transférer, Accepter] (menace) / Exploiter, Améliorer, Partager, Accepter (opportunité) | Stratégie de réponse. | — | PM² §5.3
`plan_action` | Text | Non | Max 5000 caractères | Actions de mitigation ou d'exploitation. | — | PM² §5.3.2
`responsable` | UUID | Oui | Doit pointer vers un objet OBJ-004 valide | Personne responsable du suivi. | OBJ-004 | PM² §5.2.9
`statut` | Enum | Oui | [Identifié, Actif, Réalisé, Inhibé, Clôturé] | État courant du risque. | — | PM² §5.4
`date_creation` | DateTime | Oui | Format ISO 8601 avec timezone | Date d'identification. | — | PM² §5.2.10
`date_revison` | DateTime | Oui | Format ISO 8601 avec timezone | Dernière révision (obligatoire pour Actif). | — | PM² §5.4.1
`date_reelle_survenance` | Date | Non | Format ISO 8601 | Date de réalisation. | OBJ-022 | PM²
`contingence` | Number | Non | >= 0, précision 2 décimales | Contingence budgétaire. | OBJ-009 | PM² §5.3.3
`devise` | String | Non | Code ISO 4217 | Devise de la contingence. | — | ISO 4217

## Matrice PM²

| Probabilité \ Impact | Critique (5) | Majeur (4) | Modéré (3) | Mineur (2) | Négligeable (1) |
|---|---|---|---|---|---|
| **Très Forte (5)** | 25 | 20 | 15 | 10 | 5 |
| **Forte (4)** | 20 | 16 | 12 | 8 | 4 |
| **Moyenne (3)** | 15 | 12 | 9 | 6 | 3 |
| **Faible (2)** | 10 | 8 | 6 | 4 | 2 |
| **Très Faible (1)** | 5 | 4 | 3 | 2 | 1 |

## Cycle de vie PM²

| Phase | Transition | Condition |
|-------|------------|-----------|
| **Identifié** | → Actif | Le risque est inscrit au registre |
| **Actif** | → Réalisé / Inhibé / Clôturé | Révision périodique |
| **Réalisé** | → Clôturé | Le risque s'est produit |
| **Inhibé** | → Clôturé | Les conditions de survenance ont disparu |
| **Clôturé** | Aucune | Risque finalisé |

## Contraintes de gestion

1. **Score automatique** : Calculé automatiquement par probabilité × impact.
2. **Menace vs Opportunité** : Stratégies de réponse différentes selon le type.
3. **Révision périodique** : Les risques Actifs doivent être révisés à chaque période de reporting.
4. **Contingence** : Obligatoire si plan_reponse = Accepter.

## Relations

| Objet lié | Code | Rôle | Cardinalité |
|-----------|------|------|-------------|
| Individus | OBJ-004 | Responsable | 1:1 |
| Budgets | OBJ-009 | Contingence | 1:1 |
| Decisions | OBJ-003 | Décisions de traitement | 1:N |
| WorkPackages | OBJ-026 | Actions de mitigation | 1:N |

## Sources

- **PM²** — Risk Register, §5.2.1 à §5.2.10
- **PM²** — Risk Response Plan, §5.3.1 à §5.3.3
- **PM²** — Monitoring et contrôle, §5.4
