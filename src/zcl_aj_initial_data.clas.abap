CLASS zcl_aj_initial_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AJ_INITIAL_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA : lt_contact TYPE STANDARD TABLE OF zaj_rh_contact.

    lt_contact = VALUE #(
             first_name             = 'Herbert'
             last_name              = 'Muller'
             birthday               = '19800601'
             street                 = 'Test-Street'
             house_number           = '01'
             town                   = 'Cologne'
             zip_code               = '51107'
             country                = 'DE'
             telephone              = '0221/1234 4563'
             email                  = 'herbert.muller@recyclingheroes.com'
             local_created_by       = 'CB9980000270'
             local_created_at       = ''
             local_last_changed_by  = ''
             local_last_changed_at  = '20250726115054.2961870'
             last_changed_at        = '20250726115054.2961870'

         (
             contact_id             = 'C1'
             contact_type           = 'CU'
         )
         (
             contact_id             = 'E1'
             contact_type           = 'EM'
         )

        ).

    DELETE FROM zaj_rh_contact.

    INSERT zaj_rh_contact FROM TABLE @lt_contact.



  ENDMETHOD.
ENDCLASS.
