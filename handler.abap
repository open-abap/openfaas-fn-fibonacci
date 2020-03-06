FUNCTION HANDLER.
*"----------------------------------------------------------------------
*"  IMPORTING
*"     body TYPE STRING
*"  EXPORTING
*"     output TYPE STRING
*"     code   TYPE I
*"----------------------------------------------------------------------

    DATA: lv_old     TYPE i VALUE 0,
          lv_current TYPE i VALUE 1,
          lv_next    TYPE i,
          lv_limit   type i.
    
    lv_limit = body.
          
    DO lv_limit TIMES.
      lv_next = lv_old + lv_current.
      lv_old = lv_current.
      lv_current = lv_next.
    ENDDO.

    output = lv_current.

ENDFUNCTION.