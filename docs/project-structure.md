# Project Structure

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
