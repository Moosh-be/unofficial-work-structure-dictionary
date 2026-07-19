CREATE TABLE milestones (
  id_milestone VARCHAR(36) PRIMARY KEY,
  nom VARCHAR(200) NOT NULL,
  responsable VARCHAR(200),
  date DATE,
  remarque TEXT,
  source VARCHAR(100),
  date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
