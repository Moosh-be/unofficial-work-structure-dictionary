CREATE TABLE assignation (
  id_assignation VARCHAR(36) PRIMARY KEY,
  ressource_id VARCHAR(36) NOT NULL,
  workpackage_id VARCHAR(36) NOT NULL,
  date_debut DATE NOT NULL,
  heure_debut TIME,
  date_fin DATE NOT NULL,
  heure_fin TIME,
  role VARCHAR(100),
  charge FLOAT,
  source VARCHAR(100),
  _label VARCHAR(200),
  date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ressource_id) REFERENCES individus(id_individu),
  FOREIGN KEY (workpackage_id) REFERENCES workpackages(id_workpackage)
);
