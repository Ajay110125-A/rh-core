@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RH Contact'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZAJ_R_CONTACTTP as select from ZAJ_B_Contact
//composition of target_data_source_name as _association_name
{
    key 
    ContactId,
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
