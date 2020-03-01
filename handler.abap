FUNCTION HANDLER.
*"----------------------------------------------------------------------
**"  IMPORTING
*"     INPUT TYPE STRING
*"  EXPORTING
*"     OUTPUT TYPE STRING
*"     CODE   TYPE I DEFAULT 200 "HTTP result code
*"----------------------------------------------------------------------

    DATA: lv_old     TYPE i VALUE 0,
          lv_current TYPE i VALUE 1,
          lv_next    TYPE i.

    IF input > 1000 OR input < 0.
      code = 400.
      RETURN.
    ENDIF.

    DO input TIMES.
      lv_next = lv_old + lv_current.
      lv_old = lv_current.
      lv_current = lv_next.
    ENDDO.

    output = lv_current.

ENDFUNCTION.