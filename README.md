# Incident Tracker (SAP CAP)

Incident tracking and customer support workflow built with SAP CAP and SAPUI5. It provides a UI5 frontend and an OData v4 service for managing customers, incidents, products, and replacements.

## What it does

- Manage customers, incidents, products, and replacements
- Provide a UI5 web application for daily operations
- Expose an OData v4 API for integration and reporting

## Run locally

Prerequisite: Node.js 18+

```bash
npm install
npm run cds-watch
```

For a non-reloading server, use `npm start`.

## Access

- Web app: http://localhost:4004/incidentreportingapp/webapp/index.html
- OData service: http://localhost:4004/odata/v4/incident-reporting-srv/

## Documentation

- Setup and scripts: `docs/setup.md`
- Project structure: `docs/project-structure.md`
- Endpoints and examples: `docs/endpoints.md`
- Troubleshooting: `docs/troubleshooting.md`
- Resources: `docs/resources.md`

## License

UNLICENSED
