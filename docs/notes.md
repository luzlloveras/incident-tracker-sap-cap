# Notes and Troubleshooting

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

## References

- SAP CAP: https://cap.cloud.sap/docs/
- SAPUI5: https://ui5.sap.com/
- OData: https://www.odata.org/
- CAP getting started: https://cap.cloud.sap/docs/get-started/
- SAPUI5 walkthrough: https://ui5.sap.com/#/topic/3da5f4be63264db99f2e5b04c5e85366
- SAP Community: https://community.sap.com/
- Stack Overflow tags: `sap-cap`, `sapui5`
