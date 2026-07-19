-- Template Project (OBJ-036) — Contexte Moosh v1.0
-- Format: SQL DDL

CREATE TABLE project (
    id_project      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nom             VARCHAR(200) NOT NULL,
    description     TEXT,
    status          VARCHAR(20) NOT NULL CHECK (status IN ('Draft', 'Active', 'On Hold', 'Closed', 'Archived')),
    type            VARCHAR(20) NOT NULL CHECK (type IN ('Projet', 'Programme', 'Portfolio')),
    parent_id       UUID REFERENCES project(id_project),
    responsable_id  UUID NOT NULL,
    date_debut      DATE,
    date_fin        DATE,
    budget_total    NUMERIC(15, 2),
    devise          VARCHAR(3) DEFAULT 'EUR' CHECK (devise ~ '^[A-Z]{3}$'),
    is_public       BOOLEAN DEFAULT FALSE,
    created_on      TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_on      TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    config          JSONB,
    health          JSONB,
    CONSTRAINT nom_unique_per_portfolio UNIQUE (nom, parent_id),
    CONSTRAINT budget_positive CHECK (budget_total IS NULL OR budget_total > 0),
    CONSTRAINT dates_valid CHECK (date_fin IS NULL OR date_fin >= date_debut)
);

-- Index pour les recherches fréquentes
CREATE INDEX idx_project_status ON project(status);
CREATE INDEX idx_project_type ON project(type);
CREATE INDEX idx_project_responsable ON project(responsable_id);
CREATE INDEX idx_project_parent ON project(parent_id);
