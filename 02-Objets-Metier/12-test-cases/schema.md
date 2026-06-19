# Schema : Objet Test Case (OBJ-012)

## 1. Présentation

Cet objet représente un cas de test du projet. Il encode les préconditions, étapes, résultats et statut d'exécution.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_test` | UUID | Oui | Identifiant unique du test case. |
| `titre` | String | Oui | Intitulé du test. |
| `description` | Text | Non | Description du scénario. |
| `type` | Enum | Oui | Type (`Unitaire`, `Intégration`, `Fonctionnel`, `Non-fonctionnel`, `Acceptation`). |
| `preconditions` | Text | Oui | Prérequis avant exécution. |
| `etapes` | Text | Oui | Séquence d'actions à effectuer. |
| `donnees_test` | Text | Non | Données d'entrée. |
| `resultat_attendu` | Text | Oui | Comportement attendu. |
| `resultat_obtenu` | Text | Non | Résultat réel (après exécution). |
| `statut` | Enum | Oui | État (`Non exécuté`, `Passé`, `Échoué`, `Bloqué`). |
| `requirement_id` | UUID | Non | Besoin lié (traceabilité ascendante). |
| `executeur` | UUID | Non | Personne ayant exécuté le test. |
| `date_execution` | Date/Time | Non | Date d'exécution. |

## 3. Contraintes et règles de gestion

- **Traçabilité** : Tout test doit pouvoir être relié à un besoin (requirement).
- **Reproductibilité** : Les étapes doivent permettre l'exécution par toute personne.

## 4. Relations

- **Lié à** : `OBJ-013-Requirements` (Les besoins testés).
- **Lié à** : `OBJ-002-Livrables` (Les livrables testés).
- **Lié à** : `OBJ-010-Documents` (Rapports de test).
