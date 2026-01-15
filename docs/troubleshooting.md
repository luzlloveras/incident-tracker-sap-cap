# Troubleshooting

## Cannot find module '@sap/cds'

Dependencies are missing. Run:

```bash
npm install
```

## `cds` command not found

Install the CAP development kit:

```bash
npm install --save-dev @sap/cds-dk
```

## Port 4004 is already in use

Stop the process using the port or update the port in `package.json`.

## UI5 shows 404 for resources

Ensure `index.html` loads UI5 from the official CDN, for example:

```html
src="https://ui5.sap.com/1.120.0/resources/sap-ui-core.js"
```

## App loads but no data appears

Confirm the CSV files exist in `db/data/`, then restart the server and check terminal logs for errors.

## Node.js version issues

Use Node.js 18 or 20. Check your version:

```bash
node --version
```
