# Index des Outils

Outils qui peuvent utiliser ou supporter les objets du Work Structure Dictionary.

## Outils de gestion de projet

| Outil | Lien | Objets couverts | Synchronisation |
|-------|------|-----------------|-----------------|
| **OpenProject** | [openproject.org](https://www.openproject.org/) | Project, WorkPackages, Decisions, Risks, Documents, Milestones, Budgets, Assignation | API REST complète |
| **Jira Software** | [atlassian.com/jira](https://www.atlassian.com/software/jira) | Project, WorkPackages, Tasks, Incidents, Requirements, TestCases, Decisions, Risks, Assignation | Via API REST, plugins |
| **MS Project** | [microsoft.com/project](https://www.microsoft.com/fr-fr/microsoft-365/project/project-management-software) | Project, WorkPackages, Milestones, Calendar, Gantt, Dependencies, WBS Nodes, Budgets | Via export XML/CSV, plugins |
| **MS Planner** | [microsoft.com/planner](https://www.microsoft.com/fr-fr/microsoft-365/planner) | Tasks, Milestones, Assignation, WorkPackages | Via API Microsoft Graph |
| **Azure DevOps** | [azure.microsoft.com/devops](https://azure.microsoft.com/fr-fr/products/devops/) | Project, WorkPackages, Tasks, Requirements, TestCases, Incidents, Milestones | API REST, export TFX |
| **ClickUp** | [clickup.com](https://clickup.com/) | Project, WorkPackages, Tasks, Milestones, Docs | API REST |
| **Asana** | [asana.com](https://asana.com/) | Project, WorkPackages, Tasks, Milestones | API REST |
| **Monday.com** | [monday.com](https://monday.com/) | Project, WorkPackages, Tasks, Milestones, Budgets, KPI | API REST |
| **MS To Do** | [microsoft.com/to-do](https://to-do.microsoft.com/) | Tasks | API limitée |
| **Miro** | [miro.com](https://miro.com/) | Communication, News, Brainstorming, Decisions | Via API, plugins |
| **SharePoint** | [microsoft.com/sharepoint](https://www.microsoft.com/fr-fr/microsoft-365/sharepoint-online) | Documents, Livrables, Décisions, Risks, Tasks, Project | Lists API, Power Automate |
| **BaseRow** | [baserow.io](https://baserow.io/) | Project, WorkPackages, Tasks, Relations, KPI | API REST |

## Outils de collaboration

| Outil | Lien | Objets couverts | Synchronisation |
|-------|------|-----------------|-----------------|
| **Confluence** | [atlassian.com/confluence](https://www.atlassian.com/software/confluence) | Documents, Décisions, Livrables, Reports, Communication | API REST, plugins |
| **Notion** | [notion.so](https://www.notion.so/) | Tasks, Decisions, Documents, KPI | API REST |
| **Obsidian** | [obsidian.md](https://obsidian.md/) | Documents, Décisions, Risks, KPI, Communications, News | Plugins, liens Wikilinks |
| **Joplin** | [joplinapp.org](https://joplinapp.org/) | Documents, Notes, Décisions, Risks | API REST |
| **VS Code** | [code.visualstudio.com](https://code.visualstudio.com/) | Développement, Documentation, Schema | Extensions, Git |

## Outils d'analyse

| Outil | Lien | Objets couverts | Synchronisation |
|-------|------|-----------------|-----------------|
| **Excel** | [microsoft.com/excel](https://www.microsoft.com/fr-fr/microsoft-365/excel) | KPI, Budgets, Risks, Reports, TimeEntries | CSV, Power Query |
| **Power BI** | [powerbi.com](https://powerbi.microsoft.com/) | KPI, Reports, Budgets, Gantt | Power Query, APIs |
| **Oracle Analytics Cloud** | [oracle.com/analytics](https://www.oracle.com/analytics-cloud/) | Reports, KPIs, Budgets, Gantt | ODBC, fichiers |
| **Denodo** | [denodo.com](https://www.denodo.com/) | Data Mesh, Fusion, KPI, Reports | Virtualisation |

## Outils de développement

| Outil | Lien | Objets couverts | Synchronisation |
|-------|------|-----------------|-----------------|
| **GitHub** | [github.com](https://github.com/) | Code, Documentation, Décisions, Tasks | API REST, GraphQL |
| **GitLab** | [gitlab.com](https://about.gitlab.com/) | Code, Documentation, Décisions, Incidents | API REST |
| **Power Query** | [microsoft.com/power-query](https://support.microsoft.com/fr-fr/office/power-query-f77989e3-c786-434e-84a3-c9d412e55d08) | Import/Export, Transformation, KPI | Intégré à Excel/Power BI |

## Project Web App (Microsoft)

| Outil | Lien | Objets couverts | Synchronisation |
|-------|------|-----------------|-----------------|
| **PWA (Project Web App)** | [microsoft.com/office/project-server](https://www.microsoft.com/fr-fr/microsoft-365/project/project-management-software/project-web-app) | Project, WorkPackages, Milestones, Resources, Budgets, TimesEntries, Gantt | Intégré à MS Project/SharePoint |

## Contextes

Chaque outil peut correspondre à un contexte : `03-analyses/04-contextes/`.

- `moosh/` — Contexte auteur (approche terrain)
- `ms/` — Contexte Microsoft (MS Project, PWA, SharePoint, Planner)
- `atlassian/` — Contexte Jira/Confluence
