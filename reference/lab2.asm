.ORIG x3000

LD R0, x0ff ;R0 <- p
LD R1, x0ff ;R1 <- q
LD R2, x0ff ;R2 <- N
ADD R0, R0, #-1 ; p = p-1
ADD R2, R2, #-1 ; N = N - 1

AND R3, R3, #0 ; R3 <- 0
ADD R3, R3, #1 ; f(n-2) = 1
ADD R4, R3, #0 ; f(n-1) = f(n-2) = 1

AND R5, R3, R0 ; temp1 = f(n-2)%p

; temp2 = f(n-1)%q
ADD R6, R4, #0 ; temp2 = f(n-1)

; -q
NOT R7, R1 
ADD R7, R7, #1

ADD R6, R6, R7 ; temp2 - q
BRzp #-2 ; x300C
ADD R6, R6, R1 ; temp2 = temp2 + q

ADD R7, R5, R6 ; R7 = f(n) = t1 + t2

ADD R3, R4, #0 ; f(n-2) = f(n-1) = 1
ADD R4, R7, #0 ; f(n-1) = f(n)

ADD	R2,	R2,	#-1
BRp #-12 ; x3008
ST R7, xEE ; x3103
TRAP x25

.END
