.ORIG x3000
LD R0, x0FF
LD R1, x0FF
LD R2, x0FF ; store p, q, N

ADD R3, R0, #-1
NOT R4, R1
ADD R4, R4, x1
ADD R5, R5, #1
ADD R6, R6, #1
ADD R2, R2, #-1 ;prepare for minus

AND R5, R5, R3 
ADD R7, R6, #0
ADD R7, R7, R4
BRzp #-2
ADD R7, R7, R1 ;%

ADD R7, R7, R5 ;adding

ADD R5, R6, #0
ADD R6, R7, #0 ;sliding
ADD R2, R2, #-1
BRp #-10

ST R7, x0EF ;store
TRAP x25
.END