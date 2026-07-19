# Schema : Objet Assignation (OBJ-015)

## 1. Présentation

Cet objet représente l'affectation d'un individu à un rôle fonctionnel sur une période donnée. Il encode le lien temporel entre une personne et sa contribution.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_assignation` | UUID | Oui | Identifiant unique de l'assignation. |
| `membre_id` | UUID | Oui | Référence vers le membre assigné (OBJ-037). |
| `individu_id` | UUID | Oui | Référence vers l'individu assigné (OBJ-004). |
| `role_id` | UUID | Oui | Référence vers le rôle assigné (OBJ-038). |
| `role` | String | Oui | Nom du rôle assigné (raccourci lisible). |
| `wp_id` | UUID | Non | Référence vers le WorkPackage (OBJ-026) si affectation task-level. |
| `date_debut` | Date | Oui | Date de début de l'affectation. |
| `date_fin` | Date | Non | Date de fin (null = actif). |
| `statut` | Enum | Oui | État (`Actif`, `Terminé`, `En transition`). |
| `priorite` | Enum | Non | Priorité dans l'affectation (`Basse`, `Moyenne`, `Haute`, `Critique`). |
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
- **Lié à** : `OBJ-037-Members` (Le membre assigné).
- **Lié à** : `OBJ-038-Roles` (Le rôle assigné).
- **Lié à** : `OBJ-026-WorkPackage` (Affectation task-level).
