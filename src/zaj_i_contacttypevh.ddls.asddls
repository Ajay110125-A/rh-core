@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RH: Value help for Contact Type'
@ObjectModel.resultSet.sizeCategory: #XXS
define view entity ZAJ_I_ContactTypeVH
  as select from    DDCDS_CUSTOMER_DOMAIN_VALUE ( p_domain_name : 'ZAJ_CONTACT_TYPE' )   as Values
    left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T ( p_domain_name : 'ZAJ_CONTACT_TYPE' ) as Texts on  Texts.domain_name    = Values.domain_name
                                                                                                  and Texts.value_position = Values.value_position
                                                                                                  and Texts.language       = $session.system_language
{
      @ObjectModel.text.element: [ 'Description' ]
      @UI.textArrangement: #TEXT_ONLY
  key Values.value_low as ContactTypeId,
      @UI.hidden: true
      Texts.text       as Description
}
