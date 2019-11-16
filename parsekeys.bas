   10  A% = 0 : B% = 0 : C% = 0 : D% = 0 : UP% = 0 : DOWN% = 0 : LEFT% = 0 : RIGHT% = 0 : FN% = 0
   20  MEH$ = INKEY$ : REM discard the initial value, because it holds the return key from hitting run
   30  A% = ASC(INKEY$)
   40  IF A% = 27 THEN B% = ASC(INKEY$)
   50  IF B% = 91 THEN C% = ASC(INKEY$)
   60  IF C% = 49 OR C% = 50 THEN D% = ASC(INKEY$)
   70  REM PRINT "A:"; A%; ",B:"; B%; ",C:"; C%; ",D:"; D%
   80  IF A% = 27 AND B% = 91 AND C% = 65 THEN UP% = 1
   90  IF A% = 27 AND B% = 91 AND C% = 66 THEN DOWN% = 1
  100  IF A% = 27 AND B% = 91 AND C% = 68 THEN LEFT% = 1
  110  IF A% = 27 AND B% = 91 AND C% = 67 THEN RIGHT% = 1
  120  IF A% = 27 AND B% = 91 AND C% = 49 AND D% = 49 THEN FN% = 1
  130  IF A% = 27 AND B% = 91 AND C% = 49 AND D% = 50 THEN FN% = 2
  140  IF A% = 27 AND B% = 91 AND C% = 49 AND D% = 51 THEN FN% = 3
  150  IF A% = 27 AND B% = 91 AND C% = 49 AND D% = 52 THEN FN% = 4
  160  IF A% = 27 AND B% = 91 AND C% = 49 AND D% = 53 THEN FN% = 5
  170  IF A% = 27 AND B% = 91 AND C% = 49 AND D% = 55 THEN FN% = 6
  180  IF A% = 27 AND B% = 91 AND C% = 49 AND D% = 56 THEN FN% = 7
  190  IF A% = 27 AND B% = 91 AND C% = 49 AND D% = 57 THEN FN% = 8
  200  IF A% = 27 AND B% = 91 AND C% = 50 AND D% = 48 THEN FN% = 9
  210  IF A% = 27 AND B% = 91 AND C% = 50 AND D% = 49 THEN FN% = 10
  220  IF A% = 27 AND B% = 91 AND C% = 50 AND D% = 51 THEN FN% = 11
  230  IF A% = 27 AND B% = 91 AND C% = 50 AND D% = 52 THEN FN% = 12
  240  IF UP% = 1 OR DOWN% = 1 OR LEFT% = 1 OR RIGHT% = 1 THEN PRINT "Arrow Keys pressed: Up:"; UP%; " Down:"; DOWN%; " Left:"; LEFT%; " Right:"; RIGHT%
  250  IF FN% = 0 AND UP% = 0 AND DOWN% = 0 AND LEFT% = 0 AND RIGHT% = 0 THEN PRINT "Key pressed: "; CHR$(A%); " ASCII-Value: "; A%
  260  IF FN% > 0 THEN PRINT "Pressed F-Key: "; FN%
