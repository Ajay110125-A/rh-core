@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RH Contact ( Consumption )'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZAJ_C_ContactTP
  provider contract transactional_query
  as projection on ZAJ_R_CONTACTTP
{
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZAJ_B_ContactIdVH', element: 'ContactId' } } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 1.0
  key ContactId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZAJ_I_ContactTypeVH', element: 'ContactTypeId' } } ]
      @ObjectModel.text.element: [ 'ContactTypeDescription' ]
      @UI.textArrangement: #TEXT_FIRST
      ContactTypeId,
      _ContactType.Description         as ContactTypeDescription,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      FirstName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      LastName,
      Birthday,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Street,
      HouseNumber,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7 
      Town,
      ZipCode,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CountryVH', element: 'Country' } } ]
      @ObjectModel.text.element: [ 'CountryName' ]
      @UI.textArrangement: #TEXT_FIRST
      Country,
      _Country.Description             as CountryName,
      Telephone,
      Email,
      @ObjectModel.text.element: [ 'CreaterName' ]
      @UI.textArrangement: #TEXT_ONLY
      LocalCreatedBy,
      _UserCreated.PersonFullName      as CreaterName,
      LocalCreatedAt,
      @ObjectModel.text.element: [ 'ChangedName' ]
      @UI.textArrangement: #TEXT_ONLY
      LocalLastChangedBy,
      _UserChanged.DefaultEmailAddress as ChangedName,
      LocalLastChangedAt,
      LastChangedAt,

      _ContactType,
      _ContactId,
      _Country,
      _UserCreated,
      _UserChanged
}
