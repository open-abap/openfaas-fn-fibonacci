FUNCTION HANDLER.
*"----------------------------------------------------------------------
**"  IMPORTING
*"     REFERENCE(INPUT) TYPE ANY
*"  EXPORTING
*"     REFERENCE(OUTPUT) TYPE STRING
*"----------------------------------------------------------------------
    DATA: lv_old     TYPE i VALUE 0,
          lv_current TYPE i VALUE 1,
          lv_next    TYPE i.

    DO input TIMES.
      lv_next = lv_old + lv_current.
      lv_old = lv_current.
      lv_current = lv_next.
    ENDDO.

    output = lv_current.

ENDFUNCTION.