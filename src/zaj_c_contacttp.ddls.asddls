@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RH Contact ( Consumption )'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZAJ_C_ContactTP
  provider contract transactional_query
  as projection on ZAJ_R_CONTACTTP
{
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZAJ_B_ContactIdVH', element: 'ContactId' } } ]
  key ContactId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZAJ_I_ContactTypeVH', element: 'ContactTypeId' } } ]
      ContactTypeId,
      FirstName,
      LastName,
      Birthday,
      Street,
      HouseNumber,
      Town,
      ZipCode,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CountryVH', element: 'Country' } } ]
      Country,
      Telephone,
      Email,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
