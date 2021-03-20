    1  a = 1
    2  b = 0
   10  def fnShl(x,n)=x*(2^n)
   15  input "enter a string:", dat$
   30  valuelen = len(dat$)
   40  for i = 1 to valuelen
   50  a = (a + asc(mid$(dat$,i,1))) mod 65521
   60  b = (b + a) mod 65521
   70  next i
   80  result$ = hex$(fnShl(b,16) or a)
   85  result2$ = ""
   86  if len(result$) = 8 then goto 120
   90  for i = 1 to 8 - len(result$)
  100  result2$ = str$(result2$) + "0"
  110  next i
  120  endresult$ = mid$(result2$,1,len(result2$)) + mid$(result$,1,len(result$))
  130  print "The Result is:" + mid$(endresult$,1,len(endresult$))
