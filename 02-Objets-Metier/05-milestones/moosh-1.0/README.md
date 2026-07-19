# Jalons (OBJ-005) — Contexte Moosh v1.0 : Templates Excel

## Cadre

Ce contexte **Moosh** pour l'objet métier **Milestones (OBJ-005)** propose des templates Excel pour la gestion des jalons.

## Templates

### data.xlsx — Template Excel

#### Onglet "Jalon"

| Colonne | Type | Description |
|---------|------|-------------|
| Nom | Texte | Nom du jalon |
| Responsable | Liste déroulante | Récupérée de l'onglet Ressources |
| Date | Date | Date du jalon |
| Remarque | Texte | Infos |
| Source | Texte | Provenance |

### data.json

```json
{
  "id_milestone": "",
  "nom": "",
  "responsable": "",
  "date": "",
  "remarque": "",
  "source": ""
}
```

### data.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Milestone>
  <id_milestone></id_milestone>
  <nom></nom>
  <responsable></responsable>
  <date></date>
  <remarque></remarque>
  <source></source>
</Milestone>
```

### data.csv

```
id_milestone,nom,responsable,date,remarque,source
,,,,,
```

### data.sql

```sql
CREATE TABLE milestones (
  id_milestone VARCHAR(36) PRIMARY KEY,
  nom VARCHAR(200) NOT NULL,
  responsable VARCHAR(200),
  date DATE,
  remarque TEXT,
  source VARCHAR(100),
  date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Règles de gestion

1. **Unicité** : `id_milestone` doit être unique.
2. **Date** : Un jalon peut être planifié avant sa date réelle.
3. **Responsable** : Référence à une ressource existante.
