    0  CLS
    1  COLOR 7, 0
    2  MINY = 12
    3  MINX = 1
    4  CHAR$ = SPC$(1)
    5  DIM DATA$(HEIGHT, WIDTH)
    6  FOR F = MINY TO HEIGHT
    7  FOR FF = 1 TO WIDTH
    8  DATA$(F, FF) = "0 "
    9  NEXT FF : NEXT F
   10  PRINT "telepaint 0.1 by archer"
   20  PRINT "Directions: w,a,s,d"
   21  PRINT "Change Color: c"
   22  PRINT "Change Coords: n"
   23  PRINT "Change Characters: x"
   24  PRINT "Save File: f"
   25  PRINT "Open File: o"
   26  PRINT "List of Colors: 0:Black, 1:Red, 2:Green, 3:Yellow, 4:Blue, 5:Magenta, 6:Cyan, 7:White"
   30  X = INT(WIDTH / 2)
   40  Y = INT(HEIGHT / 2)
   41  COLOR 0, 0
   42  LOCATE 10, 1
   43  PRINT SPC$(WIDTH-1);
   44  LOCATE 11, 1
   45  PRINT SPC$(WIDTH-1);
   50  LOCATE 9,1
   55  PRINT SPC$(WIDTH-1);
   56  LOCATE 9,1
   60  COLOR 7, 0
   70  INPUT "Enter Command:", MOV$
   80  FOR I=1 TO LEN(MOV$)
   90  COLOR 0, CLR%
  100  IF MID$(MOV$, I, 1) = "w" THEN Y = Y - 1
  110  IF MID$(MOV$, I, 1) = "s" THEN Y = Y + 1
  120  IF MID$(MOV$, I, 1) = "a" THEN X = X - LEN(CHAR$)
  130  IF MID$(MOV$, I, 1) = "d" THEN X = X + LEN(CHAR$)
  140  IF MID$(MOV$, I, 1) = "c" THEN GOSUB 230
  142  IF MID$(MOV$, I, 1) = "n" THEN GOSUB 300
  143  IF MID$(MOV$, I, 1) = "x" THEN GOSUB 400
  144  IF MID$(MOV$, I, 1) = "f" THEN GOSUB 500
  145  IF MID$(MOV$, I, 1) = "o" THEN GOSUB 600
  149  COLOR 0, CLR%
  150  IF Y < MINY THEN Y = MINY
  160  IF X < MINX THEN X = MINX
  170  IF Y > HEIGHT THEN Y = HEIGHT
  180  IF X > WIDTH THEN X = WIDTH
  190  LOCATE Y, X
  191  DATA$(Y, X) = STR$(CLR%) + CHAR$
  200  PRINT CHAR$;
  210  NEXT I
  220  GOTO 41
  230  REM - Color change
  240  COLOR 7, 0
  250  INPUT "Enter Color (0-7): ", CLR%
  260  IF CLR% >= 0 AND CLR% < 8 THEN COLOR 0, CLR% : RETURN
  270  LOCATE 8, 15
  280  PRINT "Invalid Color. Range is from 0 to 7"
  290  RETURN
  300  REM Change Coords
  310  COLOR 7, 0
  320  INPUT "Enter X: ", X
  330  INPUT "Enter Y: ", Y
  380  RETURN
  400  REM Change Chars
  410  COLOR 7,0
  420  INPUT "Enter Characters: ", CHAR$
  421  IF LEN(CHAR$) <> 1 THEN CHAR$ = SPC$(1)
  430  RETURN
  500  COLOR 7,0
  501  INPUT "Enter Filename: ", FILENAME$
  502  IF FILENAME$ = "" THEN RETURN
  503  FILENAME$ = "p" + FILENAME$ : OPEN FILENAME$, AS #1
  504  PRINT# 1,HEIGHT
  505  PRINT# 1,WIDTH
  510  FOR F = 1 TO HEIGHT
  520  FOR FF = 1 TO WIDTH
  530  OUTP$ = OUTP$ + DATA$(F, FF)
  540  NEXT FF
  545  PRINT# 1, OUTP$
  546  OUTP$ = ""
  547  PRINT# 1, ""
  550  NEXT F
  551  CLOSE #1
  560  RETURN
  600  REM - Open
  601  COLOR 7,0
  610  INPUT "Enter Filename: ", FILENAME$
  620  IF FILENAME$ = "" THEN RETURN
  625  FILENAME$ = "p" + FILENAME$
  630  OPEN FILENAME$, AS #1
  640  INPUT# 1, LHEIGHT%
  650  INPUT# 1, LWIDTH%
  651  LHEIGHT% = INT(LHEIGHT%)
  652  LWIDTH% = INT(LWIDTH%)
  665  IF HEIGHT < LHEIGHT% THEN PRINT "Height doesnt match Terminal Size" : END
  666  IF WIDTH < LWIDTH% THEN PRINT "Width doesnt match Terminal Size" : END
  670  FOR F = MINY TO LHEIGHT%
  680  INPUT# 1, LINE$
  685  CTR = 1
  690  FOR FF = 1 TO LWIDTH% * 2 STEP 2
  700  CLR% = INT(MID$(LINE$, FF, 1))
  710  CHRR$ = MID$(LINE$, FF+1, 1)
  720  REM COLOR 0, CLR%
  730  REM LOCATE F, FF
  740  REM PRINT CHRR$;
  741  COLOR 0, CLR%
  742  LOCATE F, CTR
  743  PRINT CHRR$;
  745  DATA$(F, CTR) = STR$(CLR%) + CHRR$
  749  CTR = CTR + 1
  750  NEXT FF
  770  NEXT F
  778  CLOSE #1
  780  RETURN
