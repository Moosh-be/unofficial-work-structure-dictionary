# Schema : Objet KPI (OBJ-011)

## 1. Présentation

Cet objet représente un indicateur de performance du projet. Il encode la définition, le calcul, les seuils et les valeurs du KPI.

## 2. Dictionnaire des attributs

| Nom du champ | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `id_kpi` | UUID | Oui | Identifiant unique du KPI. |
| `nom` | String | Oui | Nom de l'indicateur. |
| `description` | Text | Non | Description détaillée. |
| `categorie` | Enum | Oui | Type (`Avancement`, `Coûts`, `Qualité`, `Risques`, `Ressources`). |
| `formule` | Text | Oui | Formule de calcul. |
| `unite` | String | Oui | Unité de mesure (% , €, nombre, ratio). |
| `valeur_cible` | Number | Oui | Valeur cible souhaitée. |
| `seuil_alerte` | Number | Oui | Seuil déclenchant une alerte. |
| `valeur_actuelle` | Number | Non | Dernière valeur mesurée. |
| `frequence_mesure` | Enum | Oui | Fréquence (`Hebdo`, `Mensuel`, `Par phase`, `À la demande`). |
| `responsable` | UUID | Oui | Personne responsable du suivi. |
| `date_derniere_mesure` | Date | Non | Date du dernier relevé. |

## 3. Contraintes et règles de gestion

- **Valeur calculée** : La `valeur_actuelle` doit être calculée automatiquement quand c'est possible.
- **Suivi** : Chaque mesure doit pouvoir être historisée.

## 4. Relations

- **Lié à** : `OBJ-009-Budgets` (KPI de coûts).
- **Lié à** : `OBJ-005-Milestones` (KPI d'avancement).
- **Lié à** : `OBJ-008-Risks` (KPI de risques).
- **Lié à** : `OBJ-004-Individus` (Le responsable).
