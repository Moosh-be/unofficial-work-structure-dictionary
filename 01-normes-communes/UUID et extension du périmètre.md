

Le principe est simple, dans mon périmètre mon uuid est unique.
Si  j'étends mon périmètre, je fais entrer un ou plusieurs périmètres supplémentaires
Chaque périmètre étant identifié, la concaténation uuid + uuid périmètre (en préfix si possible) rétablit l'unicité

Un process secondaire de rationalisation des UUID peut être souvent mis en place.
En effet,   la concaténation provoque un agrandissement de la chaine. 
la rationalisation exploite le principe que même en fusionnant les listes de uuid le risque de doublons est aux limites de l'impossible. Donc  un simple contrôle lors de la fusion suffit à déterminer si le hasard a bien fait les choses, et traiter les cas malchanceux. 