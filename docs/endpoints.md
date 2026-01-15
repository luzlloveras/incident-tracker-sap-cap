# Endpoints

## User interface

- Main app: http://localhost:4004/incidentreportingapp/webapp/index.html
- Launchpad: http://localhost:4004/launchpad/webapp/index.html

## OData service

- Service base: http://localhost:4004/odata/v4/incident-reporting-srv/
- Metadata: http://localhost:4004/odata/v4/incident-reporting-srv/$metadata
- Customers: http://localhost:4004/odata/v4/incident-reporting-srv/Customers
- Incidents: http://localhost:4004/odata/v4/incident-reporting-srv/Incidents
- Products: http://localhost:4004/odata/v4/incident-reporting-srv/Products
- Replacements: http://localhost:4004/odata/v4/incident-reporting-srv/Replacements

## Example queries

```bash
# List customers
GET http://localhost:4004/odata/v4/incident-reporting-srv/Customers

# Customer by ID
GET http://localhost:4004/odata/v4/incident-reporting-srv/Customers(<uuid>)

# Filter incidents
GET http://localhost:4004/odata/v4/incident-reporting-srv/Incidents?$filter=incidentId eq 'INC001'

# Expand relationships
GET http://localhost:4004/odata/v4/incident-reporting-srv/Incidents?$expand=Customer
```
