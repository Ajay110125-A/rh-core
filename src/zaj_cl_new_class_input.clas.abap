CLASS zaj_cl_new_class_input DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_aia_sd_action_input .

    TYPES : BEGIN OF generated_objects,

                class TYPE sxco_ao_object_name,
                interface TYPE sxco_ao_object_name,

            END OF generated_objects.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAJ_CL_NEW_CLASS_INPUT IMPLEMENTATION.


  METHOD if_aia_sd_action_input~create_input_config.

  ENDMETHOD.


  METHOD if_aia_sd_action_input~get_action_provider.
  ENDMETHOD.


  METHOD if_aia_sd_action_input~get_side_effect_provider.
  ENDMETHOD.


  METHOD if_aia_sd_action_input~get_value_help_provider.
  ENDMETHOD.
ENDCLASS.
