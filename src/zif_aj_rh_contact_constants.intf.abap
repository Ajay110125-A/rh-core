INTERFACE zif_aj_rh_contact_constants
  PUBLIC .

  CONSTANTS : BEGIN OF contact_type,
                customer TYPE zaj_contact_type VALUE 'CU',
                employee TYPE zaj_contact_type VALUE 'EM',
                address  TYPE zaj_contact_type VALUE 'AD',
              END OF contact_type.

ENDINTERFACE.
