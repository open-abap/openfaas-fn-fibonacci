CLASS zcl_handler DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_header,
             field TYPE string,
             value TYPE string,
           END OF ty_header.

    TYPES ty_headers TYPE STANDARD TABLE OF ty_header WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_http,
             headers TYPE ty_headers,
             body    TYPE string,
           END OF ty_http.

    METHODS:
      run
        IMPORTING
          method      TYPE string OPTIONAL
          path        TYPE string OPTIONAL
          query       TYPE string OPTIONAL
          " request     TYPE ty_http OPTIONAL
          body        TYPE string OPTIONAL "TODO: Remove in favor of request once structures are supported
        RETURNING
          VALUE(response) TYPE ty_http
        RAISING
          cx_static_check.

ENDCLASS.

CLASS zcl_handler IMPLEMENTATION.

  METHOD run.

    DATA: lv_old     TYPE i VALUE 0,
          lv_current TYPE i VALUE 1,
          lv_next    TYPE i,
          lv_limit   TYPE i.

    DATA ls_header TYPE ty_header.

    lv_limit = body.

    DO lv_limit TIMES.
      lv_next = lv_old + lv_current.
      lv_old = lv_current.
      lv_current = lv_next.
    ENDDO.

    response-body = lv_current.

    ls_header-field = 'content-type'.
    ls_header-value = 'text/plain'.
    APPEND ls_header TO response-headers.
  ENDMETHOD.

ENDCLASS.