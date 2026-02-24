@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'User Value Help for Recycling Heroes'
define table entity ZAJ_I_UserVH
{
  key UserID              : syuname;
      PersonFullName      : zaj_rh_fulname;
      DefaultEmailAddress : zaj_email;

}
