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
