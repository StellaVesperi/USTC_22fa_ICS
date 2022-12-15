.ORIG x3000
INIT LDI R0, NUM ; N
    LD R1, DATA ; index
    LDR R2, R1, #0 ; right
    ADD R3, R2, #0 ; left
    ADD R1, R1, #1 ; index++
    AND R4, R4, #0 ; 
    ADD R4, R4, #1 ; temp
    ADD R5, R4, #0 ; length
    ADD R0, R0, #-1 ; N--
WHILE BRz UPDATE
    LDR R2, R1, #0 ; right = S[index]
    ADD R1, R1, #1 ; index++
    ; if left = right
    NOT R6, R3 
    ADD R6, R6, #1
    ADD R6, R2, R6
    BRnp UPDATE
    ADD R4, R4, #1 ; temp++
BACK ADD R3, R2, #0 ; left <- right
    ADD R0, R0, #-1 ; N--
    BR WHILE
    ; temp > length    
UPDATE NOT R6, R4
    ADD R6, R6, #1
    ADD R6, R5, R6
    BRzp #1
    ADD R5, R4, #0 ; length <- temp
    AND R4, R4, #0
    ADD R4, R4, #1 ; temp <- 1
    ADD R0, R0, #0 ; N > 0
    BRz OUTPUT
    BR BACK

OUTPUT STI R5, RESULT

HALT

RESULT .FILL x3050
NUM .FILL x3100
DATA .FILL x3101
.END
