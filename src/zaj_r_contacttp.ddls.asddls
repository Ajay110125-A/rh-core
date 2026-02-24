@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RH Contact'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZAJ_R_CONTACTTP
  as select from ZAJ_B_Contact as _Contact
  association of one to one ZAJ_I_ContactTypeVH as _ContactType on _ContactType.ContactTypeId = $projection.ContactTypeId
  association of one to one ZAJ_B_ContactIdVH   as _ContactId   on _ContactId.ContactId = $projection.ContactId
  association of one to one I_CountryVH         as _Country     on _Country.Country = $projection.Country
  association of one to one ZAJ_I_UserVH        as _UserCreated on _UserCreated.UserID = $projection.LocalCreatedBy
  association of one to one ZAJ_I_UserVH        as _UserChanged on _UserChanged.UserID = $projection.LocalLastChangedBy
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
  LastChangedAt,
  _ContactType,
  _ContactId,
  _Country,
  _UserCreated,
  _UserChanged
}
