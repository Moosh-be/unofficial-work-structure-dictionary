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
