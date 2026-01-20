using { incidentReportingSrv } from '../srv/service.cds';

annotate incidentReportingSrv.Customers with @UI.DataPoint #customerName: {
  Value: customerName,
  Title: '{i18n>customerNameLabel}',
};
annotate incidentReportingSrv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerName', ID: 'CustomerName' }
];
annotate incidentReportingSrv.Customers with @UI.HeaderInfo: {
  TypeName: 'Customer',
  TypeNamePlural: 'Customers',
  Title: { Value: customerId }
};
annotate incidentReportingSrv.Customers with {
  ID @UI.Hidden
};
annotate incidentReportingSrv.Customers with @UI.Identification: [{ Value: customerId }];
annotate incidentReportingSrv.Customers with {
  customerId @Common.Label: '{i18n>customerIdLabel}';
  customerName @Common.Label: '{i18n>customerNameLabel}';
  Incidents @Common.Label: '{i18n>incidentsLabel}'
};
annotate incidentReportingSrv.Customers with {
  ID @Common.Text: { $value: customerId, ![@UI.TextArrangement]: #TextOnly };
};
annotate incidentReportingSrv.Customers with @UI.SelectionFields: [
  customerId
];
annotate incidentReportingSrv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: customerId },
    { $Type: 'UI.DataField', Value: customerName }
];
annotate incidentReportingSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: customerId },
    { $Type: 'UI.DataField', Value: customerName }
]};
annotate incidentReportingSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: '{i18n>generalInformationLabel}', Target: '@UI.FieldGroup#Main' }
];
annotate incidentReportingSrv.Incidents with {
  Customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Customer_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerName'
      },
    ],
  }
};
annotate incidentReportingSrv.Incidents with @UI.DataPoint #incidentDescription: {
  Value: incidentDescription,
  Title: '{i18n>incidentSubjectLabel}',
};
annotate incidentReportingSrv.Incidents with @UI.DataPoint #customerName: {
  Value: Customer.customerName,
  Title: '{i18n>customerLabel}',
};
annotate incidentReportingSrv.Incidents with @UI.HeaderFacets: [
  { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#incidentDescription', ID: 'IncidentDescription' },
  { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerName', ID: 'CustomerName' }
];
annotate incidentReportingSrv.Incidents with @UI.HeaderInfo: {
  TypeName: 'Incident',
  TypeNamePlural: 'Incidents',
  Title: { Value: incidentId },
  Description: { Value: incidentDescription }
};
annotate incidentReportingSrv.Incidents with {
  ID @UI.Hidden
};
annotate incidentReportingSrv.Incidents with @UI.Identification: [{ Value: incidentId }];
annotate incidentReportingSrv.Incidents with {
  incidentId @Common.Label: '{i18n>incidentIdLabel}';
  incidentDescription @Common.Label: '{i18n>incidentSubjectLabel}';
  Customer @Common.Label: '{i18n>customerLabel}';
  Replacements @Common.Label: '{i18n>relatedItemsLabel}'
};
annotate incidentReportingSrv.Incidents with {
  ID @Common.Text: { $value: incidentId, ![@UI.TextArrangement]: #TextOnly };
  Customer @Common.Text: { $value: Customer.customerId, ![@UI.TextArrangement]: #TextOnly };
};
annotate incidentReportingSrv.Incidents with @UI.SelectionFields: [
  Customer_ID
];
annotate incidentReportingSrv.Incidents with @UI.LineItem : [
  { $Type: 'UI.DataField', Label: '{i18n>incidentIdLabel}', Value: incidentId, Importance: #High },
  { $Type: 'UI.DataField', Label: '{i18n>incidentSubjectLabel}', Value: incidentDescription, Importance: #High },
  { $Type: 'UI.DataField', Label: '{i18n>customerLabel}', Value: Customer.customerName, Importance: #Medium }
];
annotate incidentReportingSrv.Incidents with @UI.FieldGroup #incidentDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: incidentId },
    { $Type: 'UI.DataField', Value: incidentDescription }
  ]
};


annotate incidentReportingSrv.Incidents with @UI.FieldGroup #customerDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Customer.customerId },
    { $Type: 'UI.DataField', Value: Customer.customerName }
  ]
};


annotate incidentReportingSrv.Replacements with @UI.LineItem #replacements: [
    { $Type: 'UI.DataField', Value: replacementId }

  ];


annotate incidentReportingSrv.Incidents with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'incidentDetails', Label: '{i18n>detailsFacetLabel}', Target: '@UI.FieldGroup#incidentDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'customerDetails', Label: '{i18n>customerFacetLabel}', Target: '@UI.FieldGroup#customerDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'replacements', Label: '{i18n>relatedItemsLabel}', Target: 'Replacements/@UI.LineItem#replacements' }
];
annotate incidentReportingSrv.Replacements with {
  Incident @Common.ValueList: {
    CollectionPath: 'Incidents',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Incident_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'incidentId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'incidentDescription'
      },
    ],
  }
};
annotate incidentReportingSrv.Replacements with {
  Product @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Product_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productName'
      },
    ],
  }
};
annotate incidentReportingSrv.Replacements with @UI.HeaderInfo: {
  TypeName: 'Replacement',
  TypeNamePlural: 'Replacements',
  Title: { Value: replacementId }
};
annotate incidentReportingSrv.Replacements with {
  ID @UI.Hidden
};
annotate incidentReportingSrv.Replacements with @UI.Identification: [{ Value: replacementId }];
annotate incidentReportingSrv.Replacements with {
  replacementId @Common.Label: '{i18n>replacementIdLabel}';
  Incident @Common.Label: '{i18n>incidentLabel}';
  Product @Common.Label: '{i18n>productLabel}'
};
annotate incidentReportingSrv.Replacements with {
  ID @Common.Text: { $value: replacementId, ![@UI.TextArrangement]: #TextOnly };
  Incident @Common.Text: { $value: Incident.incidentId, ![@UI.TextArrangement]: #TextOnly };
  Product @Common.Text: { $value: Product.productId, ![@UI.TextArrangement]: #TextOnly };
};
annotate incidentReportingSrv.Replacements with @UI.SelectionFields: [
  Incident_ID,
  Product_ID
];
annotate incidentReportingSrv.Replacements with @UI.LineItem: [
  { $Type: 'UI.DataField', Value: ID },
  { $Type: 'UI.DataField', Label: '{i18n>replacementIdLabel}', Value: replacementId },
  { $Type: 'UI.DataField', Label: '{i18n>incidentLabel}', Value: Incident_ID },
  { $Type: 'UI.DataField', Label: '{i18n>productLabel}', Value: Product_ID }
];
annotate incidentReportingSrv.Replacements with @UI.FieldGroup #replacementDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: replacementId }

  ]
};


annotate incidentReportingSrv.Replacements with @UI.FieldGroup #incidentDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Incident.incidentId },
    { $Type: 'UI.DataField', Value: Incident.incidentDescription }

  ]
};


annotate incidentReportingSrv.Replacements with @UI.FieldGroup #productDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Product.productId },
    { $Type: 'UI.DataField', Value: Product.productName }

  ]
};


annotate incidentReportingSrv.Replacements with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'replacementDetails', Label: '{i18n>replacementDetailsLabel}', Target: '@UI.FieldGroup#replacementDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'incidentDetails', Label: '{i18n>incidentDetailsLabel}', Target: '@UI.FieldGroup#incidentDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'productDetails', Label: '{i18n>productDetailsLabel}', Target: '@UI.FieldGroup#productDetails' }
];
annotate incidentReportingSrv.Products with @UI.DataPoint #productName: {
  Value: productName,
  Title: '{i18n>productNameLabel}',
};
annotate incidentReportingSrv.Products with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#productName', ID: 'ProductName' }
];
annotate incidentReportingSrv.Products with @UI.HeaderInfo: {
  TypeName: 'Product',
  TypeNamePlural: 'Products',
  Title: { Value: productId }
};
annotate incidentReportingSrv.Products with {
  ID @UI.Hidden
};
annotate incidentReportingSrv.Products with @UI.Identification: [{ Value: productId }];
annotate incidentReportingSrv.Products with {
  productId @Common.Label: '{i18n>productIdLabel}';
  productName @Common.Label: '{i18n>productNameLabel}'
};
annotate incidentReportingSrv.Products with {
  ID @Common.Text: { $value: productId, ![@UI.TextArrangement]: #TextOnly };
};
annotate incidentReportingSrv.Products with @UI.SelectionFields: [
  productId
];
annotate incidentReportingSrv.Products with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: productId },
    { $Type: 'UI.DataField', Value: productName }
];
annotate incidentReportingSrv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: productId },
    { $Type: 'UI.DataField', Value: productName }
]};
annotate incidentReportingSrv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: '{i18n>generalInformationLabel}', Target: '@UI.FieldGroup#Main' }
];