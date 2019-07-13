   10  PRINT "Loading...";
   20  COLOR 7, 0
   30  MINY = 12
   40  MINX = 1
   50  CHAR$ = SPC$(1)
   60  DIM DATA$(HEIGHT, WIDTH)
   70  FOR F = MINY TO HEIGHT
   80  FOR FF = 1 TO WIDTH
   90  DATA$(F, FF) = "0 "
  100  NEXT FF : NEXT F
  110  CLS
  120  PRINT "telepaint 1.0 by archer (use stty /reset at terminal to reset colors)"
  130  PRINT "Directions: h,j,k,l"
  140  PRINT "Change Color: c"
  150  PRINT "Change Coords: n"
  160  PRINT "Change Characters: x"
  170  PRINT "Save File: f"
  180  PRINT "Open File: o; Quit: q"
  190  PRINT "List of Colors: 0:Black, 1:Red, 2:Green, 3:Yellow, 4:Blue, 5:Magenta, 6:Cyan, 7:White"
  200  X = INT(WIDTH / 2)
  210  Y = INT(HEIGHT / 2)
  220  REM COLOR 0, 0
  230  REM LOCATE MINY-2, 1
  240  REM PRINT SPC$(WIDTH-1);
  250  REM LOCATE MINY-1, 1
  260  REM PRINT SPC$(WIDTH-1);
  270  REM LOCATE MINY-3,1
  280  REM PRINT SPC$(WIDTH-1);
  290  LOCATE MINY-3,1
  300  COLOR 7, 0
  310  PRINT "Enter Command: ";
  315  MOV$ = INKEY$
  316  PRINT ""
  320  REM FOR I=1 TO LEN(MOV$)
  330  IF MID$(MOV$, I, 1) = "k" THEN Y = Y - 1
  340  IF MID$(MOV$, I, 1) = "j" THEN Y = Y + 1
  350  IF MID$(MOV$, I, 1) = "h" THEN X = X - LEN(CHAR$)
  360  IF MID$(MOV$, I, 1) = "l" THEN X = X + LEN(CHAR$)
  370  IF MID$(MOV$, I, 1) = "c" THEN GOSUB 600
  380  IF MID$(MOV$, I, 1) = "n" THEN GOSUB 700
  390  IF MID$(MOV$, I, 1) = "x" THEN GOSUB 800
  400  REM IF MID$(MOV$, I, 1) = "f" THEN GOSUB 900
  401  IF MID$(MOV$, I, 1) = "f" THEN GOSUB 900
  410  REM IF MID$(MOV$, I, 1) = "o" THEN GOSUB 1100
  411  IF MID$(MOV$, I, 1) = "o" THEN GOSUB 1100
  415  IF MID$(MOV$, I, 1) = "q" THEN GOTO 1400
  420  COLOR 0, CLR%
  430  IF Y < MINY THEN Y = MINY
  440  IF X < MINX THEN X = MINX
  450  IF Y > HEIGHT THEN Y = HEIGHT
  460  IF X > WIDTH THEN X = WIDTH
  470  LOCATE Y, X
  480  DATA$(Y, X) = STR$(CLR%) + CHAR$
  490  PRINT CHAR$;
  500  REM NEXT I
  510  GOTO 220
  600  REM - Color change
  610  COLOR 7, 0
  620  INPUT "Enter Color (0-7): ", CLR%
  630  IF CLR% >= 0 AND CLR% < 8 THEN COLOR 0, CLR% : RETURN
  640  LOCATE 8, 15
  650  PRINT "Invalid Color. Range is from 0 to 7"
  660  RETURN
  700  REM Change Coords
  710  COLOR 7, 0
  720  INPUT "Enter X: ", X
  730  INPUT "Enter Y: ", Y
  740  RETURN
  800  REM Change Chars
  810  COLOR 7,0
  820  INPUT "Enter Characters: ", CHAR$
  830  IF LEN(CHAR$) <> 1 THEN PRINT "Only one Character is allowed" : CHAR$ = SPC$(1)
  840  RETURN
  900  REM Save File
  910  COLOR 7,0
  920  INPUT "Enter Filename: ", FILENAME$
  930  IF FILENAME$ = "" THEN RETURN
  935  FILENAME$ = "p" + FILENAME$
  940  PRINT "Saving File...";
  950  OPEN FILENAME$, AS #1
  960  PRINT# 1,HEIGHT
  970  PRINT# 1,WIDTH
  980  FOR F = 1 TO HEIGHT
  990  FOR FF = 1 TO WIDTH
 1000  OUTP$ = OUTP$ + DATA$(F, FF)
 1010  NEXT FF
 1020  PRINT# 1, OUTP$
 1030  OUTP$ = ""
 1040  PRINT# 1, ""
 1050  NEXT F
 1060  CLOSE #1
 1070  RETURN
 1100  REM - Open
 1110  COLOR 7,0
 1120  INPUT "Enter Filename: ", FILENAME$
 1130  IF FILENAME$ = "" THEN RETURN
 1135  FILENAME$ = "p" + FILENAME$
 1140  PRINT "Loading File...";
 1150  OPEN FILENAME$, AS #1
 1160  INPUT# 1, LHEIGHT%
 1170  INPUT# 1, LWIDTH%
 1180  LHEIGHT% = INT(LHEIGHT%)
 1190  LWIDTH% = INT(LWIDTH%)
 1200  IF HEIGHT < LHEIGHT% THEN PRINT "Height doesnt match Terminal Size" : END
 1210  IF WIDTH < LWIDTH% THEN PRINT "Width doesnt match Terminal Size" : END
 1220  FOR F = MINY TO LHEIGHT%
 1230  INPUT# 1, LINE$
 1240  CTR = 1
 1250  FOR FF = 1 TO LWIDTH% * 2 STEP 2
 1260  CLR% = INT(MID$(LINE$, FF, 1))
 1270  CHRR$ = MID$(LINE$, FF+1, 1)
 1280  COLOR 0, CLR%
 1290  LOCATE F, CTR
 1300  PRINT CHRR$;
 1310  DATA$(F, CTR) = STR$(CLR%) + CHAR$
 1320  CTR = CTR + 1
 1330  NEXT FF
 1340  NEXT F
 1350  CLOSE #1
 1360  RETURN
 1400  REM QUIT
 1410  COLOR 8,8
 1420  END
