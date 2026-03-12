CLASS lhc_Contact DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Contact RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Contact RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Contact RESULT result.
    METHODS createaddress FOR MODIFY
      IMPORTING keys FOR ACTION contact~createaddress.

    METHODS createcustomer FOR MODIFY
      IMPORTING keys FOR ACTION contact~createcustomer.

    METHODS createemployee FOR MODIFY
      IMPORTING keys FOR ACTION contact~createemployee.

ENDCLASS.

CLASS lhc_Contact IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD createAddress.

    DATA(helper) = NEW zcl_aj_rh_contact_behavior(  ).

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_key>).

      DATA(created) = helper->create_new_contact(
        EXPORTING
          cid          = <fs_key>-%cid
          is_draft     = <fs_key>-%param-%is_draft
          contact_type = zif_aj_rh_contact_constants=>contact_type-address
      ).

      INSERT LINES OF created-contact INTO TABLE  mapped-contact.

    ENDLOOP.

  ENDMETHOD.

  METHOD createCustomer.

    DATA(helper) = NEW zcl_aj_rh_contact_behavior(  ).

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_key>).

      MODIFY ENTITIES OF zaj_r_contacttp IN LOCAL MODE
       ENTITY Contact
       CREATE FROM VALUE #( (
                              %cid = 'CID_01'
                              %is_draft = <fs_key>-%param-%is_draft
                              %data-ContactTypeId = zif_aj_rh_contact_constants=>contact_type-customer
                              %control-ContactTypeId = if_abap_behv=>mk-on
                          ) )
       REPORTED DATA(lt_reported)
       FAILED DATA(lt_failed)
       MAPPED DATA(lt_create_customer).

*      DATA(created) = helper->create_new_contact(
*        EXPORTING
*          cid          = <fs_key>-%cid
*          is_draft     = <fs_key>-%param-%is_draft
*          contact_type = zif_aj_rh_contact_constants=>contact_type-customer
*      ).

*      READ ENTITIES OF zaj_r_contacttp IN LOCAL MODE
*        ENTITY Contact
*        FIELDS ( ContactId )
*        WITH VALUE #( ( % = <fs_key>-%cid
*                              %is_draft = <fs_key>-%param-%is_draft
*                     ) )


      INSERT LINES OF lt_create_customer-contact INTO TABLE  mapped-contact.

    ENDLOOP.

  ENDMETHOD.

  METHOD createEmployee.

    DATA(helper) = NEW zcl_aj_rh_contact_behavior(  ).

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_key>).

      DATA(created) = helper->create_new_contact(
        EXPORTING
          cid          = <fs_key>-%cid
          is_draft     = <fs_key>-%param-%is_draft
          contact_type = zif_aj_rh_contact_constants=>contact_type-employee
      ).

      INSERT LINES OF created-contact INTO TABLE  mapped-contact.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
