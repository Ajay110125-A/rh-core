CLASS zcl_aj_rh_contact_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aj_rh_contact_calc IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA : original_data TYPE TABLE OF ZAJ_C_ContactTP WITH EMPTY KEY.

    original_data = CORRESPONDING #( it_original_data ).

    LOOP AT original_data REFERENCE INTO DATA(lwa_original_data).

      lwa_original_data->ContactTypeIcon = SWITCH #( lwa_original_data->ContactTypeId
                                                     WHEN zif_aj_rh_contact_constants=>contact_type-address  THEN `sap-icon://addresses`
                                                     WHEN zif_aj_rh_contact_constants=>contact_type-customer THEN `sap-icon://customer-and-supplier`
                                                     WHEN zif_aj_rh_contact_constants=>contact_type-employee THEN `sap-icon://employee`
                                                   ).
      CASE lwa_original_data->ContactTypeId.

        WHEN zif_aj_rh_contact_constants=>contact_type-address.
          lwa_original_data->isHiddenBirthday  = abap_true.
          lwa_original_data->isHiddenEmail     = abap_true.
          lwa_original_data->isHiddenTelephone = abap_true.
          lwa_original_data->isHiddenDigiAddress = abap_true.

        WHEN zif_aj_rh_contact_constants=>contact_type-customer.
          lwa_original_data->isHiddenBirthday  = abap_true.

        WHEN zif_aj_rh_contact_constants=>contact_type-employee.
          lwa_original_data->isHiddenDigiAddress = abap_true.

      ENDCASE.

    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( original_data ).



  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

    IF  iv_entity <> 'ZAJ_C_ContactTP'.
      RETURN.
    ENDIF.

    et_requested_orig_elements = VALUE #( ( `CONTACTTYPEID` ) ).

  ENDMETHOD.

ENDCLASS.
