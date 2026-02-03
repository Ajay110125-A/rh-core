@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RH Contact ( Consumption )'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZAJ_C_ContactTP 
provider contract transactional_query
as projection on ZAJ_R_CONTACTTP
{
    key ContactId,
    ContactTypeId,
    FirstName,
    LastName,
    Birthday,
    Street,
    HouseNumber,
    Town,
    ZipCode,
    Country,
    Telephone,
    Email,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}
