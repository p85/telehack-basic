    1  A% = 0 : B% = 0 : C% = 0 : UP% = 0 : DOWN% = 0 : LEFT% = 0 : RIGHT% = 0
    2  MEH$ = INKEY$ : REM discard the initial value, because it holds the return key from hitting run
   10  A% = ASC(INKEY$)
   20  IF A% = 27 THEN B% = ASC(INKEY$)
   30  IF B% = 91 THEN C% = ASC(INKEY$)
   40  REM PRINT "A:"; A%; ",B:"; B%; ",C:"; C%
   50  IF A% = 27 AND B% = 91 AND C% = 65 THEN UP% = 1
   60  IF A% = 27 AND B% = 91 AND C% = 66 THEN DOWN% = 1
   70  IF A% = 27 AND B% = 91 AND C% = 68 THEN LEFT% = 1
   80  IF A% = 27 AND B% = 91 AND C% = 67 THEN RIGHT% = 1
   90  IF UP% = 1 OR DOWN% = 1 OR LEFT% = 1 OR RIGHT% = 1 THEN PRINT "Arrow Keys pressed: Up:"; UP%; " Down:"; DOWN%; " Left:"; LEFT%; " Right:"; RIGHT%
  100  IF UP% = 0 AND DOWN% = 0 AND LEFT% = 0 AND RIGHT% = 0 THEN PRINT "Key pressed: "; CHR$(A%); " ASCII-Value: "; A%
