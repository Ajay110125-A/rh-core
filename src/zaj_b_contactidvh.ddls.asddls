@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Contact ID Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZAJ_B_ContactIdVH
  as select from ZAJ_B_Contact
{
  key ContactId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZAJ_I_ContactTypeVH', element: 'ContactTypeId' } } ]
      ContactTypeId,
      concat_with_space( FirstName, LastName, 1 ) as FullName,
      Town,
      Country
}
