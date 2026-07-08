# Objets Métier — Agent

Tu travailles sur les **objets métier** du Work Structure Dictionary (OBJ-xxx).

## Structure

Chaque objet métier a son propre dossier dans `02-Objets-Metier/` :

```
02-Objets-Metier/nn-nom-du-objet/
├── README.md    → Documentation conceptuelle (rôle, classification, principes)
└── schema.md    → Schéma technique (champs, types, contraintes, relations)
```

## Fichier de référence

- `02-Objets-Metier/troncs-communs.md` — Définit les 6 troncs communs et les héritages entre objets
- `02-Objets-Metier/01-index/README.md` — Index de tous les objets

## Pour chaque objet

Lorsque tu travailles sur un objet métier :

1. **README.md** doit contenir :
   - Titre et description de l'objet
   - Section "Rôle" : à quoi sert cet objet
   - Section(s) de classification ou caractéristiques
   - Section "Principe" : citation ou principe fondamental
   - Section "Normes existantes" : standards et frameworks de référence
   - Section "Outils connus" : outils qui implémentent ou supportent cet objet

2. **schema.md** doit contenir :
   - Description de l'objet
   - Tableau des champs (nom, type, obligatoire, description)
   - Règles de gestion
   - Relations avec d'autres objets
   - Éventuellement un exemple JSON

## Troncs communs

Chaque objet hérite potentiellement de champs de troncs communs :
- Voir `troncs/agent.md` et `02-Objets-Metier/troncs-communs.md`

## Familles d'objets

- **Structure** : OBJ-001, 002, 003, 004, 007, 030, 037, 038
- **Execution** : OBJ-013, 012, 022, 026, 035
- **Governance** : OBJ-003, 016, 018, 019
- **Financial** : OBJ-009, 033, 027
- **Resources** : OBJ-006, 015, 034
- **Planning** : OBJ-005, 014, 040, 025, 024
- **Support** : OBJ-010, 032, 028, 017, 029, 041, 039, 011, 021, 020, 023, 031, 008, 036
