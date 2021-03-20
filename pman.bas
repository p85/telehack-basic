    0  CLS : GOSUB 9000
    1  IF ARGV$(1) = "" THEN MAPTYPE$ = "Default Level" : CANWIN% = 1
    2  MY_DIR% = 1
    3  T_P$(0) = "V" : T_P$(1) = "<" : T_P$(2) = "A" : T_P$(3) = ">"
    4  INVALID_INPUT% = 0
    5  SCORE% = 0
    6  DEATH% = 0
    7  MAPTYPE$ = ""
    8  OWIDTH% = WIDTH
    9  OHEIGHT% = HEIGHT
   10  T_WALL$ = "#"
   20  RESET$ = CHR$(27) + "[39;49m"
   21  YELLOW$ = CHR$(27) + "[33m"
   22  BLUE$ = CHR$(27) + "[34;44m"
   23  RED$ = CHR$(27) + "[31m"
   30  T_FREE$ = " "
   31  T_BOB$ = "B"
   32  T_START$ = "@"
   33  T_DOT$ = "."
   34  T_POB$ = "P"
   39  MY_POS%(0) = 2 : MY_POS%(1) = 2
   41  IF LEN(ARGV$(1)) = 0 THEN GOSUB 10000
   42  IF LEN(ARGV$(1)) > 0 THEN GOSUB 6000
   45  GOSUB 14000
   50  GOSUB 7000
 1000  REM PAINT MAP$
 1001  MAP$(MY_POS%(0), MY_POS%(1)) = T_P$(MY_DIR%)
 1006  PRINT CHR$(27) + "[H"
 1007  GOSUB 14000
 1010  FOR I% = 0 TO MAP_SIZE_Y%
 1020  FOR J% = 1 TO MAP_SIZE_X%
 1025  IF MAP$(I%, J%) = T_P$(2) OR MAP$(I%, J%) = T_P$(1) OR MAP$(I%, J%) = T_P$(3) OR MAP$(I%, J%) = T_P$(0) THEN PRINT YELLOW$;
 1026  IF MAP$(I%, J%) = T_WALL$ THEN PRINT BLUE$;" ";
 1027  IF MAP$(I%, J%) = T_POB$ OR MAP$(I%, J%) = T_BOB$ THEN PRINT RED$;
 1030  IF MAP$(I%, J%) <> T_WALL$ THEN PRINT MAP$(I%, J%);
 1035  IF MAP$(I%, J%) = T_P$(2) OR MAP$(I%, J%) = T_P$(1) OR MAP$(I%, J%) = T_P$(3) OR MAP$(I%, J%) = T_P$(0) OR MAP$(I%, J%) = T_WALL$ THEN PRINT YELLOW$;
 1037  IF MAP$(I%, J%) = T_POB$ OR MAP$(I%, J%) = T_BOB$ THEN PRINT RESET$;
 1038  PRINT RESET$;
 1050  NEXT J%
 1055  PRINT ""
 1060  NEXT I%
 2000  REM READ INPUT
 2001  INVALID_INPUT% = 0
 2010  REM INP$ = INKEY$
 2011  GOSUB 13000
 2013  REM UNCOMMENT THIS TO DUMP THE MAP DATA: IF INP$ = "x" THEN GOTO 12000
 2015  GOSUB 3000 : IF DEATH% = 1 THEN PRINT CHR$(10) + "You are dead :(" : PRINT "" : END
 2016  GOSUB 8000 : GOSUB 3000 : IF INVALID_INPUT% = 1 THEN GOTO 1000
 2017  GOSUB 4000
 2020  IF INP$ = "w" THEN MAP$(MY_POS%(0), MY_POS%(1)) = T_FREE$ : MY_POS%(0) = MY_POS%(0) - 1 : MY_DIR% = 0
 2030  IF INP$ = "s" THEN MAP$(MY_POS%(0), MY_POS%(1)) = T_FREE$ : MY_POS%(0) = MY_POS%(0) + 1 : MY_DIR% = 2
 2040  IF INP$ = "a" THEN MAP$(MY_POS%(0), MY_POS%(1)) = T_FREE$ : MY_POS%(1) = MY_POS%(1) - 1 : MY_DIR% = 3
 2050  IF INP$ = "d" THEN MAP$(MY_POS%(0), MY_POS%(1)) = T_FREE$ : MY_POS%(1) = MY_POS%(1) + 1 : MY_DIR% = 1
 2997  GOSUB 5000
 2998  GOSUB 11000
 2999  GOTO 1000
 3000  REM COLLISION DETETCTION SUB
 3010  IF INP$ = "w" AND MAP$(MY_POS%(0) - 1, MY_POS%(1)) = T_WALL$ THEN INVALID_INPUT% = 1
 3020  IF INP$ = "s" AND MAP$(MY_POS%(0) + 1, MY_POS%(1)) = T_WALL$ THEN INVALID_INPUT% = 1
 3030  IF INP$ = "a" AND MAP$(MY_POS%(0), MY_POS%(1) - 1) = T_WALL$ THEN INVALID_INPUT% = 1
 3040  IF INP$ = "d" AND MAP$(MY_POS%(0), MY_POS%(1) + 1) = T_WALL$ THEN INVALID_INPUT% = 1
 3050  IF INP$ = "w" AND (MAP$(MY_POS%(0) - 1, MY_POS%(1)) = T_BOB$ OR MAP$(MY_POS%(0) - 1, MY_POS%(1)) = T_POB$) THEN DEATH% = 1
 3060  IF INP$ = "s" AND (MAP$(MY_POS%(0) + 1, MY_POS%(1)) = T_BOB$ OR MAP$(MY_POS%(0) + 1, MY_POS%(1)) = T_POB$) THEN DEATH% = 1
 3070  IF INP$ = "a" AND (MAP$(MY_POS%(0), MY_POS%(1) - 1) = T_BOB$ OR MAP$(MY_POS%(0), MY_POS%(1) - 1) = T_POB$) THEN DEATH% = 1
 3080  IF INP$ = "d" AND (MAP$(MY_POS%(0), MY_POS%(1) + 1) = T_BOB$ OR MAP$(MY_POS%(0), MY_POS%(1) + 1) = T_POB$) THEN DEATH% = 1
 3100  RETURN
 4000  REM CONSUME . SUB
 4010  IF INP$ = "w" AND MAP$(MY_POS%(0) - 1, MY_POS%(1)) = T_DOT$ THEN SCORE% = SCORE% + 1
 4020  IF INP$ = "s" AND MAP$(MY_POS%(0) + 1, MY_POS%(1)) = T_DOT$ THEN SCORE% = SCORE% + 1
 4030  IF INP$ = "a" AND MAP$(MY_POS%(0), MY_POS%(1) - 1) = T_DOT$ THEN SCORE% = SCORE% + 1
 4040  IF INP$ = "d" AND MAP$(MY_POS%(0), MY_POS%(1) + 1) = T_DOT$ THEN SCORE% = SCORE% + 1
 4999  RETURN
 5000  REM PRINT SCORE SUB
 5010  LOCATE MAP_SIZE_Y% + 3, 1
 5020  PRINT "Score: "; SCORE%
 5030  RETURN
 6000  REM READ MAP SUB
 6010  OPEN ARGV$(1), AS #1
 6015  J% = 0
 6020  IF EOF(1) = -1 THEN GOTO 6080
 6030  INPUT# 1, MAP_ROW$
 6035  IF MAP_SIZE_X% = 0 THEN MAP_SIZE_X% = LEN(MAP_ROW$)
 6040  FOR I% = 1 TO LEN(MAP_ROW$)
 6050  MAP$(J%, I%) = MID$(MAP_ROW$, I%, 1)
 6060  NEXT I%
 6065  J% = J% + 1
 6070  GOTO 6020
 6080  CLOSE #1
 6086  MAP_SIZE_Y% = J%
 6090  RETURN
 7000  REM LOCATE STARTING POS SUB
 7001  BID% = 0
 7002  MAXBID% = 0
 7010  FOR I% = 0 TO MAP_SIZE_X%
 7020  FOR J% = 0 TO MAP_SIZE_Y%
 7030  IF MAP$(J%, I%) = T_START$ THEN  MAP$(J%, I%) = T_P$(MY_DIR%) : MY_POS%(0) = J% : MY_POS%(1) = I%
 7031  IF MAP$(J%, I%) = T_BOB$ THEN BOBS_X%(BID%) = I% : BOBS_Y%(BID%) = J% : BOBS_DIR%(BID%) = 1 : BID% = BID% + 1 : MAXBID% = MAXBID% + 1
 7032  IF MAP$(J%, I%) = T_POB$ THEN BOBS_X%(BID%) = I% : BOBS_Y%(BID%) = J% : BOBS_DIR%(BID%) = 0 : BID% = BID% + 1 : MAXBID% = MAXBID% + 1
 7040  NEXT J%
 7050  NEXT I%
 7060  RETURN
 8000  REM MOVE BOBS SUB
 8010  FOR I% = 0 TO MAXBID%
 8013  IF BOBS_DIR%(I%) = 1 AND MAP$(BOBS_Y%(I%), BOBS_X%(I%) + 1) <> T_WALL$ THEN OLDTILE$ = MAP$(BOBS_Y%(I%), BOBS_X%(I%)) : MAP$(BOBS_Y%(I%), BOBS_X%(I%)) = T_FREE$ : BOBS_X%(I%) = BOBS_X%(I%) + 1 : MAP$(BOBS_Y%(I%), BOBS_X%(I%)) = OLDTILE$
 8014  IF BOBS_DIR%(I%) = 3 AND MAP$(BOBS_Y%(I%), BOBS_X%(I%) - 1) <> T_WALL$ THEN OLDTILE$ = MAP$(BOBS_Y%(I%), BOBS_X%(I%)) : MAP$(BOBS_Y%(I%), BOBS_X%(I%)) = T_FREE$ : BOBS_X%(I%) = BOBS_X%(I%) - 1 : MAP$(BOBS_Y%(I%), BOBS_X%(I%)) = OLDTILE$
 8015  IF BOBS_DIR%(I%) = 0 AND MAP$(BOBS_Y%(I%) - 1, BOBS_X%(I%)) <> T_WALL$ THEN OLDTILE$ = MAP$(BOBS_Y%(I%), BOBS_X%(I%)) : MAP$(BOBS_Y%(I%), BOBS_X%(I%)) = T_FREE$ : BOBS_Y%(I%) = BOBS_Y%(I%) - 1 : MAP$(BOBS_Y%(I%), BOBS_X%(I%)) = OLDTILE$
 8016  IF BOBS_DIR%(I%) = 2 AND MAP$(BOBS_Y%(I%) + 1, BOBS_X%(I%)) <> T_WALL$ THEN OLDTILE$ = MAP$(BOBS_Y%(I%), BOBS_X%(I%)) : MAP$(BOBS_Y%(I%), BOBS_X%(I%)) = T_FREE$ : BOBS_Y%(I%) = BOBS_Y%(I%) + 1 : MAP$(BOBS_Y%(I%), BOBS_X%(I%)) = OLDTILE$
 8020  IF BOBS_DIR%(I%) = 1 AND MAP$(BOBS_Y%(I%), BOBS_X%(I%) + 1) = T_WALL$ THEN BOBS_DIR%(I%) = 3
 8021  IF BOBS_DIR%(I%) = 3 AND MAP$(BOBS_Y%(I%), BOBS_X%(I%) - 1) = T_WALL$ THEN BOBS_DIR%(I%) = 1
 8022  IF BOBS_DIR%(I%) = 0 AND MAP$(BOBS_Y%(I%) - 1, BOBS_X%(I%)) = T_WALL$ THEN BOBS_DIR%(I%) = 2
 8023  IF BOBS_DIR%(I%) = 2 AND MAP$(BOBS_Y%(I%) + 1, BOBS_X%(I%)) = T_WALL$ THEN BOBS_DIR%(I%) = 0
 8030  NEXT I%
 8999  RETURN
 9000  REM START PAGE
 9001  IF ARGV$(1) = "" THEN MAPTYPE$ = "Default Level"
 9002  IF ARGV$(1) <> "" THEN MAPTYPE$ = "Custom Level " + ARGV$(1)
 9005  PRINT "pacman 1.0"
 9006  PRINT "by archer"
 9007  PRINT "=========="
 9008  PRINT ""
 9009  PRINT "You can move with the arrow keys or with the w,a,s,d keys"
 9010  PRINT "< > V A is the Player, depending on the direction"
 9020  PRINT ". you can eat the dots to score points"
 9030  PRINT "B P dont touch them, they will kill you! they also eat the dots"
 9040  PRINT ""
 9045  PRINT "Map: "; MAPTYPE$
 9046  PRINT ""
 9050  PRINT "Press e to start..."
 9060  A$ = INKEY$ : IF A$ <> "e" THEN GOTO 9060
 9065  PRINT CHR$(27) + "[?25l";
 9070  CLS
 9080  RETURN
10000  REM LOAD BUILTIN DEFAULT LEVEL IF NO ONE PASSED THRU SUB
10010  DEFLVL$(0) = "#########################"
10020  DEFLVL$(1) = "#.....P.....#...........#"
10030  DEFLVL$(2) = "#.####.####.#.####.####.#"
10040  DEFLVL$(3) = "#.####.####.#.####.####.#"
10050  DEFLVL$(4) = "#@..........B...........#"
10060  DEFLVL$(5) = "#.####.#.#######.#.####.#"
10070  DEFLVL$(6) = "#......#....#....#......#"
10080  DEFLVL$(7) = "######.####.#.####.######"
10090  DEFLVL$(8) = "######.#....#....#.######"
10100  DEFLVL$(9) = "######.#B........#.######"
10110  DEFLVL$(10) = "######.#.#######.#.######"
10120  DEFLVL$(11) = "######.#.#######.#.######"
10130  DEFLVL$(12) = "######.#.B.......#.######"
10140  DEFLVL$(13) = "######.#....#....#.######"
10150  DEFLVL$(14) = "######.####.#.####.######"
10160  DEFLVL$(15) = "#......#....#....#......#"
10170  DEFLVL$(16) = "#.####.#.#######.#.####.#"
10180  DEFLVL$(17) = "#..........P............#"
10190  DEFLVL$(18) = "#.####.####.#.####.####.#"
10200  DEFLVL$(19) = "#.####.####.#.####.####.#"
10210  DEFLVL$(20) = "#...........#...........#"
10220  DEFLVL$(21) = "#########################"
10230  DEFLVLSIZE% = 21
10240  FOR J% = 0 TO DEFLVLSIZE%
10250  FOR I% = 1 TO LEN(DEFLVL$(J%))
10260  MAP$(J%, I%) = MID$(DEFLVL$(J%), I%, 1)
10270  NEXT I%
10280  NEXT J%
10290  MAP_SIZE_X% = I%
10300  MAP_SIZE_Y% = J%
10310  RETURN
11000  REM CHECK WINNING CONDITION SUB
11001  DOTCOUNT% = 0
11010  FOR J% = 0 TO MAP_SIZE_Y%
11020  FOR I% = 0 TO MAP_SIZE_X%
11030  IF MAP$(J%, I%) = T_DOT$ THEN DOTCOUNT% = DOTCOUNT% + 1
11040  NEXT I%
11050  NEXT J%
11060  IF DOTCOUNT% = 0 THEN PRINT "" : PRINT "You won!" : PRINT "" : GOSUB 12345 : END
11070  RETURN
12000  REM DEBUG
12005  CLS
12010  FOR J% = 0 TO MAP_SIZE_Y%
12020  FOR I% = 0 TO MAP_SIZE_X%
12030  PRINT MAP$(J%, I%);
12040  NEXT I%
12050  PRINT ""
12060  NEXT J%
12345  IF CANWIN% = 1 THEN UWIN% = 1 : RETURN
13000  REM READ ARROW KEYS INPUT SUB
13010  KEY$ = INKEY$
13020  IF KEY$ = CHR$(27) THEN KEY$ = INKEY$ : IF KEY$ = "[" THEN GOTO 13040
13025  INP$ = INKEY$
13030  RETURN
13040  KEY$ = INKEY$
13050  IF KEY$ = "A" THEN INP$ = "w"
13060  IF KEY$ = "B" THEN INP$ = "s"
13070  IF KEY$ = "C" THEN INP$ = "d"
13080  IF KEY$ = "D" THEN INP$ = "a"
13090  RETURN
14000  REM CHECK TERMINAL SIZE
14010  IF HEIGHT <> OHEIGHT% OR WIDTH <> OWIDTH% THEN PRINT "Terminal size has changed, please restart" : END
14020  IF MAP_SIZE_X% > WIDTH THEN PRINT "Your Terminal Width is " + STR$(WIDTH) + " but should be atleast " + STR$(MAP_SIZE_X%) : END
14030  IF MAP_SIZE_Y% > (HEIGHT - 3) THEN PRINT "Your Terminal Height is " + STR$(HEIGHT) + " but should be atleast " + STR$(MAP_SIZE_Y% + 3) : END
14040  RETURN
