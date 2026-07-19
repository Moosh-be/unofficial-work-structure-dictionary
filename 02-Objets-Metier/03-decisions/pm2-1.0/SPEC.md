# Spécification — Décisions (OBJ-003)
**Contexte :** PM²
**Version :** 1.0
**Date :** 2026-07-19

## Champ | Type | Obligatoire | Contrainte | Description | Lien | Source
--------|------|-------------|------------|-------------|------|------
`id_decision` | UUID | Oui | Format UUID v4 | Identifiant unique de la décision. Format DEC-YYYY-NNN. | — | PM² §4.2
`titre` | String | Oui | Max 200 caractères | Intitulé synthétique de la décision. | — | PM² §4.2.1
`description` | Text | Oui | Max 10000 caractères | Contexte détaillé et éléments de justification. | — | PM² §4.2.2
`statut` | Enum | Oui | [Draft, Review, Approved, Rejected, Postponed] | État du workflow PM² de la décision. | — | PM² §4.2.3
`instance` | Enum | Oui | [COPIL, CC, PM, Equipe] | Instance décisionnaire. Détermine le formalisme requis. | — | PM² §4.2.4
`decisionnaire` | UUID | Oui | Doit pointer vers un objet OBJ-004 valide | Personne ou instance qui prend la décision. | OBJ-004 | PM² §4.2.5
`date_decision` | Date | Oui | Format ISO 8601 | Date de la décision effective. | — | PM² §4.2.6
`triptyque_cout` | Number | Oui | >= 0, précision 2 décimales | Impact budgétaire (positif ou négatif). | OBJ-009 | PM² §5.3.1
`triptyque_delai` | Number | Oui | >= -999, <= +999 | Impact délai en jours (+ retard, - avance). | OBJ-014 | PM² §5.3.2
`triptyque_qualite` | Enum | Oui | [Négatif, Neutre, Positif] | Impact sur la qualité. | PM² §5.3.3 |
`justification` | Text | Oui | Max 5000 caractères | Raisonnement de la décision. Obligatoire pour toutes les instances. | — | PM² §4.2.7
`type_decision` | Enum | Non | [Arbitrage, Changement, Approbation, Orientation, Technique] | Nature de la décision (optionnelle pour COPIL). | — | PM²
`change_request_id` | UUID | Non | Null si non lié | Change Request associé à cette décision. | OBJ-018 | PM² §4.3
`date_creation` | DateTime | Oui | Format ISO 8601 avec timezone | Date de création dans le registre. | — | PM²

## Workflow PM²

| Phase | Transition | Condition |
|-------|------------|-----------|
| **Draft** | → Review | Le porteur soumet |
| **Review** | → Approved / Rejected / Postponed | L'instance examine |
| **Approved** | → Actée | Décision actée |
| **Rejected** | → Clôturée | Décision refusée |
| **Postponed** | → Review / Clôturée | Reportée |

## Contraintes de gestion

1. **Triptyque obligatoire** : Pour toute instance COPIL ou CC, le triptyque (cout, delai, qualite) est systématique.
2. **Justification obligatoire** : Pour toutes les instances, la justification est requise.
3. **Format identifiant** : Format DEC-YYYY-NNN (optionnel mais recommandé).
4. **Lien CR** : Toute décision structurante (COPIL/CC) doit avoir un Change Request associé.

## Relations

| Objet lié | Code | Rôle | Cardinalité |
|-----------|------|------|-------------|
| Individus | OBJ-004 | Decisionnaire | 1:1 |
| Budgets | OBJ-009 | Triptyque coût | 1:1 |
| Calendrier | OBJ-014 | Triptyque délai | 1:1 |
| Change Requests | OBJ-018 | CR associé | 1:1 |

## Sources

- **PM²** — Decision Log, §4.2.1 à §4.2.7
- **PM²** — Impact evaluation, §5.3.1 à §5.3.3
