# Incident Tracker - SAP CAP Application

A modern web application for tracking and managing incidents, built with SAP Cloud Application Programming (CAP) and SAPUI5.

## 📋 Table of Contents

- [What is this project?](#what-is-this-project)
- [What is SAP CAP?](#what-is-sap-cap)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [URLs and Endpoints](#urls-and-endpoints)
- [Troubleshooting](#troubleshooting)
- [Additional Resources](#additional-resources)

## What is this project?

This is an incident management application that allows you to:
- **Manage customers**: Register and maintain customer information
- **Track incidents**: Create, edit, and track incidents reported by customers
- **Manage replacements**: Associate replacement products with incidents
- **Product catalog**: Maintain an inventory of available products

The application includes a modern web interface (UI5) and a REST API (OData) for data access.

## What is SAP CAP?

**SAP Cloud Application Programming (CAP)** is a development framework that simplifies the creation of enterprise applications. If you come from other frameworks, you can think of it as:

- **Backend**: Similar to Express.js or Spring Boot - handles business logic and APIs
- **Database**: Defines data models declaratively (similar to Prisma or TypeORM)
- **Frontend**: Automatically generates user interfaces based on the models

**You don't need prior SAP experience** to work with this project. If you know JavaScript/TypeScript and basic web development concepts, you're ready.

## Prerequisites

Before you begin, make sure you have installed:

1. **Node.js** (version 18 or higher)
   - Download from: https://nodejs.org/
   - Verify installation: `node --version`
   - Should show something like: `v18.x.x` or higher

2. **npm** (comes with Node.js)
   - Verify installation: `npm --version`
   - Should show something like: `9.x.x` or higher

3. **Git** (optional, for cloning the repository)
   - Download from: https://git-scm.com/

## Installation

### Step 1: Clone or download the project

If you have the project in a Git repository:
```bash
git clone <repository-url>
cd incident-tracker-sap-cap
```

If you have the project as a local folder, simply navigate to it:
```bash
cd incident-tracker-sap-cap
```

### Step 2: Install dependencies

Run the following command to install all necessary dependencies:

```bash
npm install
```

This process may take several minutes the first time. You'll see progress messages and when finished you should see something like:
```
added 760 packages, and audited 782 packages
```

### Step 3: Verify installation

Verify that everything is correct:
```bash
npm list @sap/cds
```

You should see the installed CAP version.

## Running the Application

### Development Mode (Recommended)

This mode starts the server with automatic reload when you make changes:

```bash
npm run cds-watch
```

Or if you prefer the full command:

```bash
npm run start-local
```

**What does this command do?**
- Starts a web server at `http://localhost:4004`
- Loads initial data from CSV files
- Automatically opens the browser
- Automatically reloads when it detects code changes

### Production Mode

To run without automatic reload:

```bash
npm start
```

### Accessing the Application

Once the server is running, you can access:

- **Main Web Application**: http://localhost:4004/incidentreportingapp/webapp/index.html
- **Server Home Page**: http://localhost:4004
- **OData API (REST Service)**: http://localhost:4004/odata/v4/incident-reporting-srv/

### Stopping the Server

Press `Ctrl + C` in the terminal where the server is running.

## Project Structure

```
incident-tracker-sap-cap/
│
├── app/                          # Frontend (User Interface)
│   ├── incidentreportingapp/     # Main UI5 application
│   │   ├── webapp/               # UI source code
│   │   │   ├── index.html        # Main page
│   │   │   ├── manifest.json    # App configuration
│   │   │   └── Component.js     # Main component
│   │   └── dist/                 # Compiled version (generated)
│   └── services.cds              # Service configuration
│
├── db/                           # Database
│   ├── schema.cds                # Data model (entities)
│   └── data/                     # Initial data (CSV)
│       ├── incidentReporting-Customers.csv
│       ├── incidentReporting-Incidents.csv
│       ├── incidentReporting-Products.csv
│       └── incidentReporting-Replacements.csv
│
├── srv/                          # Services (Backend)
│   └── service.cds               # OData service definition
│
├── build/                        # Build files
│   └── launchpad/                # Launchpad (application portal)
│
├── package.json                  # Project configuration and dependencies
├── mta.yaml                      # Configuration for cloud deployment
├── xs-security.json              # Security configuration
└── README.md                     # This file
```

### Important Files Explained

- **`db/schema.cds`**: Defines database tables/entities (Customers, Incidents, Products, Replacements)
- **`srv/service.cds`**: Exposes entities as REST/OData service
- **`app/incidentreportingapp/webapp/manifest.json`**: UI5 application configuration (similar to package.json but for UI)
- **`package.json`**: Node.js dependencies and scripts

## Technologies Used

### Backend
- **SAP CAP (Cloud Application Programming)**: Main framework
- **Node.js**: JavaScript runtime
- **SQLite**: Database in development (in-memory)
- **OData v4**: Protocol for RESTful APIs

### Frontend
- **SAPUI5**: SAP's UI framework (similar to React/Vue but SAP-specific)
- **Fiori Elements**: Predefined templates for enterprise interfaces
- **HTML5/CSS3/JavaScript**: Standard web technologies

### Development Tools
- **npm**: Package manager
- **CDS (Core Data Services)**: Declarative language for defining data models

## URLs and Endpoints

### User Interface
- **Main Application**: http://localhost:4004/incidentreportingapp/webapp/index.html
- **Launchpad**: http://localhost:4004/launchpad/webapp/index.html

### REST API (OData)
- **Service Base**: http://localhost:4004/odata/v4/incident-reporting-srv/
- **Metadata**: http://localhost:4004/odata/v4/incident-reporting-srv/$metadata
- **Customers**: http://localhost:4004/odata/v4/incident-reporting-srv/Customers
- **Incidents**: http://localhost:4004/odata/v4/incident-reporting-srv/Incidents
- **Products**: http://localhost:4004/odata/v4/incident-reporting-srv/Products
- **Replacements**: http://localhost:4004/odata/v4/incident-reporting-srv/Replacements

### OData Query Examples

You can test these endpoints directly in your browser or with tools like Postman:

```bash
# Get all customers
GET http://localhost:4004/odata/v4/incident-reporting-srv/Customers

# Get a specific customer by ID
GET http://localhost:4004/odata/v4/incident-reporting-srv/Customers(<uuid>)

# Filter incidents
GET http://localhost:4004/odata/v4/incident-reporting-srv/Incidents?$filter=incidentId eq 'INC001'

# Expand relationships (get incidents with their customers)
GET http://localhost:4004/odata/v4/incident-reporting-srv/Incidents?$expand=Customer
```

## Troubleshooting

### Error: "Cannot find module '@sap/cds'"

**Solution**: Dependencies are not installed. Run:
```bash
npm install
```

### Error: "cds: command not found"

**Solution**: CAP development kit is not installed. Run:
```bash
npm install --save-dev @sap/cds-dk
```

### Error: "Port 4004 is already in use"

**Solution**: Another process is using the port. Options:
1. Stop the other process
2. Change the port by editing the configuration in `package.json`

### Error: "404 Not Found" when loading UI5

**Solution**: Already fixed in this project. If you see this error, verify that `index.html` files use:
```html
src="https://ui5.sap.com/1.120.0/resources/sap-ui-core.js"
```

### Application doesn't load in browser

**Check**:
1. Server is running (you should see messages in the terminal)
2. You're accessing the correct URL
3. There are no errors in the browser console (F12)
4. Your firewall is not blocking port 4004

### Data doesn't appear

**Solution**: Data is automatically loaded from CSV files in `db/data/`. If it doesn't appear:
1. Verify that CSV files exist
2. Restart the server
3. Check terminal logs for errors

### Node.js compatibility issues

This project works best with Node.js 18 or 20. If you have problems:
```bash
# Check your version
node --version

# If it's too old or too new, consider using nvm (Node Version Manager)
# https://github.com/nvm-sh/nvm
```

## Useful Commands

```bash
# Install dependencies
npm install

# Run in development mode (with automatic reload)
npm run cds-watch

# Run in production mode
npm start

# Check CAP version
npx cds --version

# View CAP help
npx cds --help

# Clean generated files (if needed)
rm -rf node_modules package-lock.json
npm install
```

## Additional Resources

### Official Documentation
- **SAP CAP**: https://cap.cloud.sap/docs/
- **SAPUI5**: https://ui5.sap.com/
- **OData**: https://www.odata.org/

### Tutorials and Guides
- **Getting Started with CAP**: https://cap.cloud.sap/docs/get-started/
- **SAPUI5 Walkthrough**: https://ui5.sap.com/#/topic/3da5f4be63264db99f2e5b04c5e85366

### Community
- **Stack Overflow**: Search for tags `sap-cloud-sdk`, `sapui5`, `sap-cap`
- **SAP Community**: https://community.sap.com/

## Next Steps

Once you have the application running, you can:

1. **Explore the interface**: Navigate through the application and familiarize yourself with the features
2. **Review the code**: Examine `db/schema.cds` to understand the data model
3. **Modify data**: Edit CSV files in `db/data/` and restart the server
4. **Customize the UI**: Modify files in `app/incidentreportingapp/webapp/`
5. **Add features**: Extend the data model or add new entities

## Contributing

If you find bugs or have suggestions:
1. Create an issue in the repository
2. Or contact the development team

## License

This project is private and is under UNLICENSED license.

---

**Need help?** Check the [Troubleshooting](#troubleshooting) section or consult the official SAP CAP documentation.

**Happy coding! 🚀**
