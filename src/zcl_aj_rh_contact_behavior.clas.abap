CLASS zcl_aj_rh_contact_behavior DEFINITION PUBLIC FOR BEHAVIOR OF zaj_r_contacttp.

  PUBLIC SECTION.

    TYPES : create_mapped TYPE RESPONSE FOR MAPPED EARLY zaj_r_contacttp.

    METHODS : create_new_contact
      IMPORTING cid           TYPE abp_behv_cid
                is_draft      TYPE abp_behv_flag
                contact_type  TYPE zaj_contact_type
      RETURNING VALUE(result) TYPE create_mapped.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aj_rh_contact_behavior IMPLEMENTATION.

  METHOD create_new_contact.


    MODIFY ENTITIES OF zaj_r_contacttp IN LOCAL MODE
       ENTITY Contact
       CREATE FROM VALUE #( (
                             %cid = cid
                             %is_draft = is_draft
                             %data-ContactTypeId = contact_type
                             %control-ContactTypeId = if_abap_behv=>mk-on
                          ) )
       MAPPED DATA(ls_result).

    result = ls_result.

    result-contact = VALUE #(
                             (
                              %cid = cid
                              %is_draft = is_draft
                              ContactId = ''
                             )
                            ).





  ENDMETHOD.

ENDCLASS.
