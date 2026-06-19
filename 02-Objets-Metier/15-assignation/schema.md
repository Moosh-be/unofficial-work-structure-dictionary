# Schema : Objet Assignation (OBJ-015)

## 1. Présentation

Cet objet représente l'affectation d'un individu à un rôle fonctionnel sur une période donnée. Il encode le lien temporel entre une personne et sa contribution.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_assignation` | UUID | Oui | Identifiant unique de l'assignation. |
| `individu_id` | UUID | Oui | Référence vers l'individu assigné. |
| `role` | String | Oui | Nom du rôle assigné. |
| `date_debut` | Date | Oui | Date de début de l'affectation. |
| `date_fin` | Date | Non | Date de fin (null = actif). |
| `statut` | Enum | Oui | État (`Actif`, `Terminé`, `En transition`). |
| `pourcentage` | Number | Non | Temps alloué (0-100%). |
| `competences_apportees` | Text | Non | Compétences spécifiques apportées par l'individu. |
| `motif_sortie` | Text | Non | Raison de la fin d'assignation. |

## 3. Contraintes et règles de gestion

- **Non-chevauchement** : Un individu ne peut pas avoir deux assignations `Actif` pour le même rôle simultanément.
- **Période valide** : Si `date_fin` est renseignée, `date_debut` ≤ `date_fin`.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (L'individu assigné).
- **Lié à** : `OBJ-003-Décisions` (Décisions d'affectation).
- **Lié à** : `OBJ-014-Calendar` (Période d'assignation).
