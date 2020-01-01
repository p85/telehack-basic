   10  DELIMITER$ = " "
   20  MAXSTACK% = 0
   30  GOSUB 60
   40  GOTO 190
   50  END
   60  REM split
   70  TSTR$ = ""
   80  FOR I% = 1 TO LEN(ARG$)
   90  IF MID$(ARG$, I%, 1) = DELIMITER$ THEN GOTO 140
  100  TSTR$ = TSTR$ + MID$(ARG$, I%, 1)
  110  IF I% = LEN(ARG$) THEN GOTO 140
  120  NEXT I%
  130  RETURN
  140  REM We have found a delimiter and are pushing it into the Array
  150  MAXSTACK% = MAXSTACK% + 1
  160  ARRAY$(MAXSTACK%) = TSTR$
  170  TSTR$ = ""
  180  GOTO 120
  190  REM PROGRAM CONTINUES HERE...
  200  FOR I% = 0 TO MAXSTACK%
  210  IF OPT$ = "-v" THEN PRINT "Source Filename: "; SRC$ : PRINT "Destination Filename: "; DST$ : PRINT "Optional Arguments: "; OPT$
  220  SRC$ = ARRAY$(1)
  230  DST$ = ARRAY$(2)
  240  OPT$ = ARRAY$(3)
  250  IF SRC$ = "" OR DST$ = "" THEN GOTO 400
  260  IF OPT$ = "-v" THEN PRINT "Opening Source File: "; SRC$; "..."
  270  OPEN SRC$, AS #1
  280  IF OPT$ = "-v" THEN PRINT "Opening Destination File: "; DST$; "..."
  290  OPEN DST$, AS #2
  300  IF EOF(1) = -1 THEN GOTO 350
  310  INPUT# 1, SRCCONTENT$
  320  IF OPT$ = "-v" THEN PRINT "Read one Line, containing "; LEN(SRCCONTENT$); " Bytes" : PRINT "Writing to Destination File..."
  330  PRINT# 2, SRCCONTENT$
  340  GOTO 300
  350  IF OPT$ = "-v" THEN PRINT "Closing Filehandles..."
  360  CLOSE #1
  370  CLOSE #2
  380  IF OPT$ = "-v" THEN PRINT "File successfully copied"
  390  END
  399  REM Incase Parameters are missing, print a message and exit
  400  PRINT "Usage: cp.bas <sourcefile> <destfile> [-v]"
  410  END
