# Assignation (OBJ-015) — Contexte Moosh v1.0 : Templates Excel

## Cadre

Ce contexte **Moosh** pour l'objet métier **Assignation (OBJ-015)** propose des templates Excel inspirés de l'outil concret de gestion des affectations du programme ETMC O&P.

## Templates

### data.xlsx — Template Excel principal

Onglets de la feuille Excel :

#### Onglet "Assignation" (données principales)

| Colonne | Type | Validation | Description |
|---------|------|------------|-------------|
| Ressource | Liste déroulante | Récupérée de l'onglet Ressources | Ressource assignée |
| Workpackage | Liste déroulante | Récupérée de l'onglet Workpackages | Workpackage ciblé |
| Date début | Date | — | Date de début de l'assignation |
| Heure | Heure | Format HH:MM | Heure de début |
| Date fin | Date | — | Date de fin de l'assignation |
| Heure fin | Heure | Format HH:MM | Heure de fin |
| Rôle | Liste déroulante | Récupérée de l'onglet Implication | Rôle joué sur le WP |
| Charge | Nombre | — | Charge en heures (facultatif) |
| Source | Texte | — | Provenance de l'assignation |
| _LABEL | Texte | — | Nom affiché pour lisibilité |

#### Onglet "Ressources" (données de base)

| Colonne | Type | Description |
|---------|------|-------------|
| Identifiant | Texte unique | ID unique de la ressource |
| Nom | Texte | Nom de la ressource |
| RBS | Liste déroulante | Groupe d'appartenance (RBS) |
| Remarque | Texte | Informations complémentaires |
| Implication par défaut | Liste déroulante | Rôle par défaut sur les WP |
| Source | Texte | Provenance |
| _LABEL | Texte | Nom affiché |

#### Onglet "Workpackages" (données de base)

| Colonne | Type | Description |
|---------|------|-------------|
| Workpackage parent | Liste déroulante | WP parent dans la hiérarchie |
| Type de Workpackage | Liste déroulante | Récupérée de l'onglet Type Workpackage |
| Workpackage | Texte | Nom du WP |
| Responsable/projet | Texte | Personne responsable |
| Couleur | Texte | Code couleur (hex) |
| ID Workpackage | Texte unique | ID unique du WP |
| Remarque | Texte | Informations |
| _LABEL | Texte | Nom affiché |
| Source | Texte | Provenance |

#### Onglet "Type Workpackage" (liste de validation)

| Colonne | Description |
|---------|-------------|
| Type de Workpackage | Type (Projet, Tâche, Epic, Feature, Bug, Milestone, Phase) |
| _LABEL | Nom affiché |

#### Onglet "Rôles" (liste de validation)

| Colonne | Description |
|---------|-------------|
| Rôle | Nom du rôle (Chef de projet, Lead tech, Développeur, etc.) |
| _LABEL | Nom affiché |

#### Onglet "Conflits à régler" (vue analytique — auto-générée)

| Colonne | Calcul |
|---------|--------|
| Assigné | Ressource en conflit |
| Début conflit | Date de début du chevauchement |
| Fin conflit | Date de fin du chevauchement |
| Nb workpackages | Nombre de WP simultanés |
| Workpackages simultanés | Liste des WP |
| Workpackage parent | Parent commun (si applicable) |
| Lignes Assignation | Lignes CSV correspondantes |
| Rôles | Rôles des deux assignations |

**Formule de détection de conflit :**
```
SI(ET(
  même_ressource;
  même_rôle;
  chevauchement_dates(debut1;fin1;debut2;fin2);
  WP_different;
  parent_different (double comptage possible)
)) → CONFLIT
```

#### Onglet "Calendrier" (vue capacity — auto-générée)

Structure :
- Ligne par Ressource
- Colonnes par jour ouvré de la période
- Valeurs : % d'occupation (0-100%)
- Condition de formatage : rouge si > 100%, orange si > 80%

#### Onglet "Sources" (provenance des données)

| Colonne | Description |
|---------|-------------|
| source de données | Nom de la source (Jira, Excel, manuel, etc.) |
| responsable | Personne en charge de la source |
| statut | Active / En cours / Archivée |
| type | API / Export / Saisie manuelle |
| _LABEL | Nom affiché |

## Règles de gestion

1. **Unicité** : Une assignation est identifiée par le couple (Ressource, Workpackage, Date début).
2. **Charge** : Si `Charge` est renseigné, il doit être cohérent avec Date début/fin et Heures.
3. **Conflits** : Les conflits sont détectés automatiquement par analyse des chevauchements.
4. **Double comptage** : Si un WP est parent d'un autre, une assignation sur les deux niveaux peut être un double comptage (l'outil signale le cas, la décision humaine est requise).
5. **_LABEL** : Nom affiché pour lisibilité, distinct de l'ID technique.

## Formules Excel recommandées

### Calcul de la durée (jours ouvrés)
```
=NB.SEMAINE.ENTRE.DEUX(B3;C3;4;6)
```

### Détection de surbooking (> 100%)
```
=SOMME.SI.ENS(Calendrier[Occupation%];Calendrier[Ressource];A2)
```

### Mise en forme conditionnelle (conflit)
Si `Occupation% > 100%` → fond rouge

## Utilisation

1. Ouvrir `data.xlsx`
2. Remplir l'onglet "Ressources" en premier (dépendances)
3. Remplir l'onglet "Workpackages" (dépendances)
4. Remplir l'onglet "Assignation" (données principales)
5. Les onglets "Conflits" et "Calendrier" se mettent à jour automatiquement
