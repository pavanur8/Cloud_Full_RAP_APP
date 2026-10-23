@EndUserText.label: 'Travel BO projection view'
 @AccessControl.authorizationCheck: #CHECK
 @Search.searchable: true
 @Metadata.allowExtensions: true
 @ObjectModel.semanticKey: ['TravelID']

 define root view entity Z_C_Travel_data
 provider contract transactional_query
   as projection on Z_I_TRAVEL_DATA as Travel
 {
   key TravelUUID,
       @Search.defaultSearchElement: true
//       @Consumption.valueHelpDefinition: [{ entity:{name: 'Z_TRAVEL_ID_VALUEHELP',element: 'TravelId' },
//                                        additionalBinding: [{ element: 'AgencyId',localElement: 'AgencyId',usage: #RESULT }] }]
       TravelID,
       @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID'} }]
       @ObjectModel.text.element: ['AgencyName']
       @Search.defaultSearchElement: true
       AgencyID,
       _Agency.Name       as AgencyName,
       @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
       @ObjectModel.text.element: ['CustomerName']
       @Search.defaultSearchElement: true
       CustomerID,
       _Customer.LastName as CustomerName,
       BeginDate,
       EndDate,
       @Semantics.amount.currencyCode: 'CurrencyCode'
       BookingFee,
       @Semantics.amount.currencyCode: 'CurrencyCode'
       TotalPrice,
       @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
       CurrencyCode,
       Description,
       TravelStatus,
       LastChangedAt,
       LocalLastChangedAt,

       /* Associations */
       _Agency,
       _Booking : redirected to composition child Z_C_Booking_data,
       _Currency,
       _Customer   
 }
