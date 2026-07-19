# Individus (OBJ-004) — Contexte Moosh v1.0 : Templates Excel

## Cadre

Ce contexte **Moosh** pour l'objet métier **Individus (OBJ-004)** propose des templates Excel pour la gestion des personnes et ressources.

## Templates

### data.xlsx — Template Excel

#### Onglet "Ressources"

| Colonne | Type | Description |
|---------|------|-------------|
| Identifiant | Texte unique | UUID de la ressource |
| Nom | Texte | Nom de la ressource |
| RBS | Texte | Groupe d'appartenance |
| Remarque | Texte | Infos complémentaires |
| Implication par défaut | Texte | Rôle par défaut |
| Source | Texte | Provenance |
| _LABEL | Texte | Nom affiché |

### data.json

```json
{
  "id_individu": "",
  "nom": "",
  "rbs": "",
  "remarque": "",
  "implication_defaut": "",
  "source": "",
  "_label": ""
}
```

### data.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Individu>
  <id_individu></id_individu>
  <nom></nom>
  <rbs></rbs>
  <remarque></remarque>
  <implication_defaut></implication_defaut>
  <source></source>
  <_label></_label>
</Individu>
```

### data.csv

```
id_individu,nom,rbs,remarque,implication_defaut,source,_label
,,,,,,
```

### data.sql

```sql
CREATE TABLE individus (
  id_individu VARCHAR(36) PRIMARY KEY,
  nom VARCHAR(200) NOT NULL,
  rbs VARCHAR(100),
  remarque TEXT,
  implication_defaut VARCHAR(100),
  source VARCHAR(100),
  _label VARCHAR(200),
  date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Règles de gestion

1. **Unicité** : `id_individu` doit être unique.
2. **RBS** : Référence à un groupe d'appartenance (optionnel).
3. **_LABEL** : Nom affiché, distinct de l'ID.
