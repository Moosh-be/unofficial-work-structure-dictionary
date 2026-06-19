# Schema : Objet Calendar (OBJ-014)

## 1. Présentation

Cet objet représente la structure temporelle du projet. Il encode les paramètres calendaires, contraintes et événements.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_calendar` | UUID | Oui | Identifiant unique du calendrier. |
| `titre` | String | Oui | Nom du calendrier. |
| `type` | Enum | Oui | Type (`Projet`, `Équipe`, `Personnel`, `Infrastructure`). |
| `date_debut` | Date | Oui | Date de début de validité. |
| `date_fin` | Date | Non | Date de fin de validité (null = illimité). |
| `jours_ouvres` | String | Oui | Jours ouvrés (ex: "Lun,Ven"). |
| `jours_feries` | Text | Non | Liste des jours fériés. |
| `fuseau_horaire` | String | Oui | Fuseau horaire (ex: "Europe/Brussels"). |
| `statut` | Enum | Oui | État (`Actif`, `Archivé`). |
| `evenements` | Text | Non | Événements notables (JSON ou texte structuré). |

## 3. Contraintes et règles de gestion

- **Cohérence** : `date_debut` < `date_fin` si cette dernière est renseignée.
- **Jours ouvrés** : Au moins un jour ouvré doit être défini.

## 4. Relations

- **Lié à** : `OBJ-004-Individus` (Calendrier personnel).
- **Lié à** : `OBJ-005-Milestones` (Dates des jalons).
- **Lié à** : `OBJ-015-Assignation` (Périodes d'affectation).
