# Configuration and Scripts

## Prerequisites

- Node.js 18 or newer
- npm (bundled with Node.js)

Git is optional if you clone the repository.

## Install

```bash
npm install
```

## Run (development)

```bash
npm run cds-watch
```

This starts a local server at `http://localhost:4004`, loads sample data from `db/data/`, and reloads on changes.

## Run (production-style)

```bash
npm start
```

## Stop the server

Press `Ctrl + C` in the terminal where the server is running.

## Useful commands

```bash
npx cds --version
npx cds --help
```

## Project structure

```
incident-tracker-sap-cap/
├── app/                          # UI5 frontend
│   ├── incidentreportingapp/     # Main UI5 app
│   │   ├── webapp/               # UI source code
│   │   └── dist/                 # Compiled output
│   └── services.cds              # Service configuration
├── db/                           # Data model and seed data
│   ├── schema.cds                # Entities and relationships
│   └── data/                     # CSV seed data
├── srv/                          # Service definitions (OData)
│   └── service.cds
├── build/                        # Build artifacts (launchpad)
├── mta.yaml                      # Deployment descriptor
├── xs-security.json              # Security configuration
└── package.json                  # Scripts and dependencies
```

## Key files

- `db/schema.cds`: domain model (Customers, Incidents, Products, Replacements)
- `srv/service.cds`: OData service exposure
- `app/incidentreportingapp/webapp/manifest.json`: UI5 app configuration
