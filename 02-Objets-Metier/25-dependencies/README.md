# Dependencies (OBJ-025)

Les dépendances représentent les liens logiques entre les work packages, tâches ou objets du projet.

Elles définissent l'ordre logique d'exécution.

---

## Rôle

Les dépendances permettent de :

- **ordonnancer** les travaux
- **calculer** le chemin critique
- **identifier** les points de blocage potentiels
- **analyser** l'impact des retards

---

## Types de dépendances

| Type | Signification | Exemple |
| :--- | :--- | :--- |
| **FS** (Finish-to-Start) | B ne commence que quand A est fini | Conception avant développement |
| **SS** (Start-to-Start) | B ne commence que quand A a commencé | Rédaction parallèle de docs |
| **FF** (Finish-to-Finish) | B ne finit que quand A est fini | Test finit quand développement finit |
| **SF** (Start-to-Finish) | B ne commence que quand A a commencé (rare) | Relève d'équipe |

---

## Types de liens

- **Dépendance logique** : Lien technique ou méthodologique (inévitable)
- **Dépendance externe** : Lien avec un événement hors contrôle du projet
- **Dépendance préférentielle** : Choix de l'équipe, pas contraignant
- **Dépendance interne** : Décidée par l'équipe projet

---

## Principe

> Un plan sans dépendances identifiées est un plan illusion.
> Le chemin critique détermine la durée minimale du projet.
