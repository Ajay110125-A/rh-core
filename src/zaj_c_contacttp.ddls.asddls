@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'RH Contact ( Consumption )'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define root view entity ZAJ_C_ContactTP
  provider contract transactional_query
  as projection on ZAJ_R_CONTACTTP

{
          @Consumption.valueHelpDefinition: [ { entity: { name: 'ZAJ_B_ContactIdVH', element: 'ContactId' } } ]
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 1.0
  key     ContactId,

          @Consumption.valueHelpDefinition: [ { entity: { name: 'ZAJ_I_ContactTypeVH', element: 'ContactTypeId' } } ]
          @ObjectModel.text.element: [ 'ContactTypeDescription' ]
          @UI.textArrangement: #TEXT_FIRST
          ContactTypeId,

          _ContactType.Description    as ContactTypeDescription,

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

          @Consumption.valueHelpDefinition: [ { entity: { name: 'I_CountryVH', element: 'Country' } } ]
          @ObjectModel.text.element: [ 'CountryName' ]
          @UI.textArrangement: #TEXT_FIRST
          Country,
          _Country.Description        as CountryName,

          Telephone,
          Email,

          @ObjectModel.text.element: [ 'CreaterName' ]
          @UI.textArrangement: #TEXT_ONLY
          LocalCreatedBy,
          _UserCreated.PersonFullName as CreaterName,

          LocalCreatedAt,

          @ObjectModel.text.element: [ 'ChangedName' ]
          @UI.textArrangement: #TEXT_ONLY
          LocalLastChangedBy,
          _UserChanged.PersonFullName as ChangedName,

          LocalLastChangedAt,
          LastChangedAt,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_AJ_RH_CONTACT_CALC'
  virtual ContactTypeIcon   : abap.string,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_AJ_RH_CONTACT_CALC'
  virtual isHiddenTelephone : abap_boolean,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_AJ_RH_CONTACT_CALC'
  virtual isHiddenEmail     : abap_boolean,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_AJ_RH_CONTACT_CALC'
  virtual isHiddenBirthday  : abap_boolean,
  
            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_AJ_RH_CONTACT_CALC'
  virtual isHiddenDigiAddress  : abap_boolean,

          _ContactType,
          _ContactId,
          _Country,
          _UserCreated,
          _UserChanged
}
