# Workpackages (OBJ-026) — Contexte Moosh v1.0 : Templates Excel

## Cadre

Ce contexte **Moosh** pour l'objet métier **WorkPackages (OBJ-026)** propose des templates Excel pour la gestion des lots de travail, inspirés de la structure du programme ETMC O&P.

## Templates

### data.xlsx — Template Excel

#### Onglet "Workpackages"

| Colonne | Type | Description |
|---------|------|-------------|
| Workpackage parent | Liste déroulante | WP parent (auto-référence) |
| Type de Workpackage | Liste déroulante | Récupérée de l'onglet Type Workpackage |
| Workpackage | Texte | Nom du WP |
| Responsable/projet | Texte | Personne responsable |
| Couleur | Texte | Code couleur hex |
| ID Workpackage | Texte unique | ID unique |
| Remarque | Texte | Infos |
| _LABEL | Texte | Nom affiché |
| Source | Texte | Provenance |

### data.json

```json
{
  "id_workpackage": "",
  "workpackage_parent": "",
  "type_de_workpackage": "",
  "workpackage": "",
  "responsable": "",
  "couleur": "",
  "remarque": "",
  "_label": "",
  "source": ""
}
```

### data.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Workpackage>
  <id_workpackage></id_workpackage>
  <workpackage_parent></workpackage_parent>
  <type_de_workpackage></type_de_workpackage>
  <workpackage></workpackage>
  <responsable></responsable>
  <couleur></couleur>
  <remarque></remarque>
  <_label></_label>
  <source></source>
</Workpackage>
```

### data.csv

```
id_workpackage,workpackage_parent,type_de_workpackage,workpackage,responsable,couleur,remarque,_label,source
,,,,,,, ,
```

### data.sql

```sql
CREATE TABLE workpackages (
  id_workpackage VARCHAR(36) PRIMARY KEY,
  workpackage_parent VARCHAR(36),
  type_de_workpackage VARCHAR(50),
  workpackage VARCHAR(500) NOT NULL,
  responsable VARCHAR(200),
  couleur VARCHAR(7),
  remarque TEXT,
  _label VARCHAR(200),
  source VARCHAR(100),
  date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (workpackage_parent) REFERENCES workpackages(id_workpackage)
);
```

## Règles de gestion

1. **Hiérarchie** : `workpackage_parent` peut être null (racine) ou référence à un autre WP.
2. **Type** : Type déductible des paramètres du WP (voir cartographie).
3. **_LABEL** : Nom affiché, distinct de l'ID.
