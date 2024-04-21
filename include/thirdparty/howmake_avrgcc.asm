.org 0x0000

#define SP_H     0x3e
#define SP_L     0x3d
#define SREG     0x3f
#define tmp_reg  0
#define zero_reg 1

createKeyValuePair:
        push r28
        push r29
        rcall .
        in r28, SP_L
        in r29, SP_H

.L__stack_usage = 8
        std Y+4, r25
        std Y+3, r24
        std Y+6, r23
        std Y+5, r22

        ldi r24, lo8(4)
        ldi r25, 0

        rcall malloc

        std Y+2, r25
        std Y+1, r24

        ldd r24, Y+3
        ldd r25, Y+4

        rcall strdup

        mov r18, r24
        mov r19, r25

        ldd r24, Y+1
        ldd r25, Y+2

        mov r30, r24
        mov r31, r25

        std Z+1, r19

        st Z, r18

        ldd r24, Y+1
        ldd r25, Y+2
        ldd r18, Y+5
        ldd r19, Y+6

        mov r30, r24
        mov r31, r25

        std Z+3, r19
        std Z+2, r18

        ldd r24, Y+1
        ldd r25, Y+2

        pop tmp_reg
        pop r29
        pop r28

        ret

destroyKeyValuePair:
        push r28
        push r29
        rcall .
        in r28, SP_L
        in r29, SP_H

.L__stack_usage = 4
        std Y+2, r25
        std Y+1, r24
        
        ldd r24, Y+1
        ldd r25, Y+2

        mov r30, r24
        mov r31, r25
        
        ld r24, Z
        ldd r25, Z+1
        
        rcall free
        
        ldd r24, Y+1
        ldd r25, Y+2
        
        rcall free
        
        nop

pop tmp_reg
        pop r29
        pop r28
        ret

createHashMap:
        push r28
        push r29
        rcall .
        in r28, SP_L
        in r29, SP_H

.L__stack_usage = 4
        ldi r24, lo8(6)
        ldi r25, 0
        
        rcall malloc
        
        std Y+2, r25
        std Y+1, r24
        
        ldd r24, Y+1
        ldd r25, Y+2
        
        mov r30, r24
        mov r31, r25
        
        std Z+1, zero_reg
        
        st Z, zero_reg
        
        ldd r24, Y+1
        ldd r25, Y+2
        
        mov r30, r24
        mov r31, r25
        
        std Z+3, zero_reg
        std Z+2, zero_reg
        
        ldd r24,Y+1
        ldd r25,Y+2
        
        mov r30,r24
        mov r31,r25
        
        std Z+5, zero_reg
        std Z+4, zero_reg
        
        ldd r24,Y+1
        ldd r25,Y+2
        
        pop tmp_reg
        pop r29
        pop r28

        ret

destroyHashMap:
        push r28
        push r29

        rcall .

        in r28, SP_L
        in r29, SP_H

.L__stack_usage = 6
        std Y+4, r25
        std Y+3, r24
        std Y+2, zero_reg
        std Y+1, zero_reg
        rjmp .L7

.L8:
        ldd r24, Y+3
        ldd r25, Y+4
        
        mov r30, r24
        mov r31, r25
        
        ld r18, Z
        
        ldd r19, Z+1
        ldd r24, Y+1
        ldd r25, Y+2
        
        lsl r24
        
        rol r25
        
        add r24, r18
        adc r25, r19
        
        mov r30, r24
        mov r31, r25
        
        ld r24, Z
        
        ldd r25, Z+1
        
        rcall destroyKeyValuePair
        
        ldd r24, Y+1
        ldd r25, Y+2
        
        adiw r24, 1
        
        std Y+2, r25
        std Y+1, r24

.L7:
        ldd r24, Y+3
        ldd r25, Y+4
        
        mov r30, r24
        mov r31, r25
        
        ldd r24, Z+2
        ldd r25, Z+3
        ldd r18, Y+1
        ldd r19, Y+2
        
        cp r18, r24
        cpc r19, r25
        
        brlt .L8
        
        ldd r24, Y+3
        ldd r25, Y+4
        
        mov r30, r24
        mov r31, r25
        
        ld r24, Z
        ldd r25, Z+1
        
        rcall free
        
        ldd r24, Y+3
        ldd r25, Y+4
        
        rcall free
        
        nop

pop __tmp_reg__
        pop r29
        pop r28
        ret

put:
        push r28
        push r29
        
        in r28, SP_L
        in r29, SP_H
        
        sbiw r28,10
        
        in tmp_reg, SREG

        cli
        out SP_H, r29
        out SREG, tmp_reg
        out SP_L, r28

.L__stack_usage = 12
        std Y+6, r25
        std Y+5, r24
        std Y+8, r23
        std Y+7, r22
        std Y+10, r21
        std Y+9, r20
        std Y+2, zero_reg
        std Y+1, zero_reg
        rjmp .L10

.L13:
        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25

        ld r18, Z
        ldd r19, Z+1
        ldd r24, Y+1
        ldd r25, Y+2

        lsl r24
        rol r25

        add r24, r18
        adc r25, r19

        mov r30, r24
        mov r31, r25

        ld r24, Z
        ldd r25, Z+1
        mov r30, r24
        mov r31, r25

        ld r24, Z
        ldd r25, Z+1
        ldd r18, Y+7
        ldd r19, Y+8
        mov r22, r18
        mov r23, r19

        rcall strcmp

        sbiw r24, 0
        brne .L11

        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25
        ld r18, Z
        ldd r19, Z+1
        ldd r24, Y+1
        ldd r25, Y+2
        lsl r24
        rol r25
        add r24, r18
        adc r25, r19
        mov r30, r24
        mov r31, r25
        
        ld r24, Z
        ldd r25, Z+1
        ldd r18, Y+9
        ldd r19, Y+10
        
        mov r30, r24
        mov r31, r25
        
        std Z+3, r19
        std Z+2, r18
        
        rjmp .L9

.L11:
        ldd r24, Y+1
        ldd r25, Y+2

        adiw r24, 1

        std Y+2, r25
        std Y+1, r24

.L10:
        ldd r24, Y+5
        ldd r25, Y+6

        mov r30, r24
        mov r31, r25

        ldd r24, Z+2
        ldd r25, Z+3
        ldd r18, Y+1
        ldd r19, Y+2

        cp r18, r24
        cpc r19, r25

        brge .+2
        rjmp .L13

        ldd r18, Y+9
        ldd r19, Y+10
        ldd r24, Y+7
        ldd r25, Y+8

        mov r22, r18
        mov r23, r19

        rcall createKeyValuePair
        
        std Y+4, r25
        std Y+3, r24
        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25

        ldd r18, Z+2
        ldd r19, Z+3
        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25

        ldd r24, Z+4
        ldd r25, Z+5

        cp r18, r24
        cpc r19, r25

        brlt .L14

        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25
        ldd r24, Z+4
        ldd r25, Z+5
        sbiw r24, 0
        breq .L15

        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25
        ldd r24, Z+4
        ldd r25, Z+5

        lsl r24
        rol r25
        rjmp .L16

.L15:
        ldi r24, lo8(1)
        ldi r25, 0

.L16:
        ldd r18, Y+5
        ldd r19, Y+6
        mov r30, r18
        mov r31, r19
        std Z+5, r25
        std Z+4, r24
        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25
        ldd r24, Z+4
        ldd r25, Z+5
        mov r18, r24
        mov r19, r25

        lsl r18
        rol r19

        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25
        ld r24, Z

        ldd r25, Z+1
        mov r22, r18
        mov r23, r19
        rcall realloc

        mov r18, r24
        mov r19, r25
        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25
        std Z+1, r19

        st Z, r18

.L14:
        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25
        ld r18, Z

        ldd r19, Z+1
        ldd r24, Y+5
        ldd r25, Y+6
        mov r30, r24
        mov r31, r25
        ldd r24, Z+2
        ldd r25, Z+3
        mov r22, r24
        mov r23, r25

        subi r22,-1
        sbci r23,-1
        ldd r20, Y+5
        ldd r21, Y+6
        mov r30, r20
        mov r31, r21
        std Z+3, r23
        std Z+2, r22

        lsl r24
        rol r25

        add r24, r18
        adc r25, r19
        ldd r18, Y+3
        ldd r19, Y+4
        mov r30, r24
        mov r31, r25
        std Z+1, r19
        st Z, r18

.L9:
        adiw r28, 10
        in tmp_reg, SREG

        cli

        out SP_H, r29
        out SREG, tmp_reg
        out SP_L, r28
        pop r29
        pop r28

        ret

get:
        push r28
        push r29
        rcall .

        in r28, SP_L
        in r29, SP_H

.L__stack_usage = 8
        std Y+4, r25
        std Y+3, r24
        std Y+6, r23
        std Y+5, r22

        std Y+2, zero_reg
        std Y+1, zero_reg

        rjmp .L18

.L21:
        ldd r24, Y+3
        ldd r25, Y+4
        mov r30, r24
        mov r31, r25
        ld r18, Z

        ldd r19, Z+1
        ldd r24, Y+1
        ldd r25, Y+2

        lsl r24
        rol r25

        add r24, r18
        adc r25, r19
        mov r30, r24
        mov r31, r25

        ld r24, Z

        ldd r25, Z+1
        mov r30, r24
        mov r31, r25

        ld r24, Z

        ldd r25, Z+1
        ldd r18, Y+5
        ldd r19, Y+6
        mov r22, r18
        mov r23, r19
        rcall strcmp

        sbiw r24, 0
        brne .L19

        ldd r24, Y+3
        ldd r25, Y+4
        mov r30, r24
        mov r31, r25
        ld r18, Z
        ldd r19, Z+1
        ldd r24, Y+1
        ldd r25, Y+2
        lsl r24
        rol r25
        add r24, r18
        adc r25, r19
        mov r30, r24
        mov r31, r25

        ld r24, Z
        ldd r25, Z+1
        mov r30, r24
        mov r31, r25
        ldd r24, Z+2
        ldd r25, Z+3
        rjmp .L20

.L19:
        ldd r24, Y+1
        ldd r25, Y+2
        
        adiw r24, 1

        std Y+2, r25
        std Y+1, r24

.L18:
        ldd r24, Y+3
        ldd r25, Y+4
        mov r30, r24
        mov r31, r25
        ldd r24, Z+2
        ldd r25, Z+3
        ldd r18, Y+1
        ldd r19, Y+2

        cp r18, r24
        cpc r19, r25

        brge .+2
        rjmp .L21

        ldi r24, 0
        ldi r25, 0

.L20:
        pop tmp_reg

        pop r29
        pop r28
        ret

.LC0:
        .string "A"
.LC1:
        .string "a"
.LC2:
        .string "B"
.LC3:
        .string "b"
.LC4:
        .string "C"
.LC5:
        .string "c"
.LC6:
        .string "D"
.LC7:
        .string "d"
.LC8:
        .string "E"
.LC9:
        .string "e"
.LC10:
        .string "F"
.LC11:
        .string "f"
.LC12:
        .string "G"
.LC13:
        .string "g"
.LC14:
        .string "H"
.LC15:
        .string "h"
.LC16:
        .string "I"
.LC17:
        .string "i"
.LC18:
        .string "J"
.LC19:
        .string "j"
.LC20:
        .string "K"
.LC21:
        .string "k"
.LC22:
        .string "L"
.LC23:
        .string "l"
.LC24:
        .string "M"
.LC25:
        .string "m"
.LC26:
        .string "N"
.LC27:
        .string "n"
.LC28:
        .string "O"
.LC29:
        .string "o"
.LC30:
        .string "P"
.LC31:
        .string "p"
.LC32:
        .string "Q"
.LC33:
        .string "q"
.LC34:
        .string "R"
.LC35:
        .string "r"
.LC36:
        .string "S"
.LC37:
        .string "s"
.LC38:
        .string "T"
.LC39:
        .string "t"
.LC40:
        .string "U"
.LC41:
        .string "u"
.LC42:
        .string "V"
.LC43:
        .string "v"
.LC44:
        .string "W"
.LC45:
        .string "w"
.LC46:
        .string "X"
.LC47:
        .string "x"
.LC48:
        .string "Y"
.LC49:
        .string "y"
.LC50:
        .string "Z"
.LC51:
        .string "z"

; without D&SpSymb

addValues:
        push r28
        push r29
        rcall .
        in r28, SP_L
        in r29, SP_H

.L__stack_usage = 4
        std Y+2, r25
        std Y+1, r24
        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-89)
        ldi r21, lo8(-31)
        ldi r22, lo8(.LC0)
        ldi r23, hi8(.LC0)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-117)
        ldi r21, lo8(-47)
        ldi r22, lo8(.LC1)
        ldi r23, hi8(.LC1)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(77)
        ldi r21, lo8(-62)
        ldi r22, lo8(.LC2)
        ldi r23, hi8(.LC2)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(79)
        ldi r21, lo8(83)
        ldi r22, lo8(.LC3)
        ldi r23, hi8(.LC3)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-80)
        ldi r21, lo8(21)
        ldi r22, lo8(.LC4)
        ldi r23, hi8(.LC4)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-2)
        ldi r21, lo8(59)
        ldi r22, lo8(.LC5)
        ldi r23, hi8(.LC5)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(52)
        ldi r21, lo8(-7)
        ldi r22, lo8(.LC6)
        ldi r23, hi8(.LC6)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(79)
        ldi r21, lo8(25)
        ldi r22, lo8(.LC7)
        ldi r23, hi8(.LC7)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(35)
        ldi r21, lo8(-72)
        ldi r22, lo8(.LC8)
        ldi r23, hi8(.LC8)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(124)
        ldi r21, lo8(124)
        ldi r22, lo8(.LC9)
        ldi r23, hi8(.LC9)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-49)
        ldi r21, lo8(83)
        ldi r22, lo8(.LC10)
        ldi r23, hi8(.LC10)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(111)
        ldi r21, lo8(39)
        ldi r22, lo8(.LC11)
        ldi r23, hi8(.LC11)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(47)
        ldi r21, lo8(-45)
        ldi r22, lo8(.LC12)
        ldi r23, hi8(.LC12)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-32)
        ldi r21, lo8(62)
        ldi r22, lo8(.LC13)
        ldi r23, hi8(.LC13)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-47)
        ldi r21, lo8(127)
        ldi r22, lo8(.LC14)
        ldi r23, hi8(.LC14)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(51)
        ldi r21, lo8(29)
        ldi r22, lo8(.LC15)
        ldi r23, hi8(.LC15)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-16)
        ldi r21, lo8(-58)
        ldi r22, lo8(.LC16)
        ldi r23, hi8(.LC16)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(86)
        ldi r21, lo8(101)
        ldi r22, lo8(.LC17)
        ldi r23, hi8(.LC17)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-64)
        ldi r21, lo8(71)
        ldi r22, lo8(.LC18)
        ldi r23, hi8(.LC18)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-36)
        ldi r21, lo8(-126)
        ldi r22, lo8(.LC19)
        ldi r23, hi8(.LC19)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(123)
        ldi r21, lo8(-49)
        ldi r22, lo8(.LC20)
        ldi r23, hi8(.LC20)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-55)
        ldi r21, lo8(-42)
        ldi r22, lo8(.LC21)
        ldi r23, hi8(.LC21)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(44)
        ldi r21, lo8(92)
        ldi r22, lo8(.LC22)
        ldi r23, hi8(.LC22)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-123)
        ldi r21, lo8(95)
        ldi r22, lo8(.LC23)
        ldi r23, hi8(.LC23)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-44)
        ldi r21, lo8(113)
        ldi r22, lo8(.LC24)
        ldi r23, hi8(.LC24)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(73)
        ldi r21, lo8(21)
        ldi r22, lo8(.LC25)
        ldi r23, hi8(.LC25)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(60)
        ldi r21, lo8(111)
        ldi r22, lo8(.LC26)
        ldi r23, hi8(.LC26)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(120)
        ldi r21, lo8(78)
        ldi r22, lo8(.LC27)
        ldi r23, hi8(.LC27)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(89)
        ldi r21, lo8(-54)
        ldi r22, lo8(.LC28)
        ldi r23, hi8(.LC28)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-74)
        ldi r21, lo8(-84)
        ldi r22, lo8(.LC29)
        ldi r23, hi8(.LC29)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-97)
        ldi r21, lo8(102)
        ldi r22, lo8(.LC30)
        ldi r23, hi8(.LC30)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-25)
        ldi r21, lo8(88)
        ldi r22, lo8(.LC31)
        ldi r23, hi8(.LC31)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-61)
        ldi r21, lo8(88)
        ldi r22, lo8(.LC32)
        ldi r23, hi8(.LC32)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-111)
        ldi r21, lo8(57)
        ldi r22, lo8(.LC33)
        ldi r23, hi8(.LC33)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-20)
        ldi r21, lo8(69)
        ldi r22, lo8(.LC34)
        ldi r23, hi8(.LC34)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-6)
        ldi r21, lo8(13)
        ldi r22, lo8(.LC35)
        ldi r23, hi8(.LC35)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-33)
        ldi r21, lo8(125)
        ldi r22, lo8(.LC36)
        ldi r23, hi8(.LC36)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(114)
        ldi r21, lo8(-47)
        ldi r22, lo8(.LC37)
        ldi r23, hi8(.LC37)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-39)
        ldi r21, lo8(63)
        ldi r22, lo8(.LC38)
        ldi r23, hi8(.LC38)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(46)
        ldi r21, lo8(9)
        ldi r22, lo8(.LC39)
        ldi r23, hi8(.LC39)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(15)
        ldi r21, lo8(123)
        ldi r22, lo8(.LC40)
        ldi r23, hi8(.LC40)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(67)
        ldi r21, lo8(70)
        ldi r22, lo8(.LC41)
        ldi r23, hi8(.LC41)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(10)
        ldi r21, lo8(117)
        ldi r22, lo8(.LC42)
        ldi r23, hi8(.LC42)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-26)
        ldi r21, lo8(43)
        ldi r22, lo8(.LC43)
        ldi r23, hi8(.LC43)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-51)
        ldi r21, lo8(84)
        ldi r22, lo8(.LC44)
        ldi r23, hi8(.LC44)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-11)
        ldi r21, lo8(39)
        ldi r22, lo8(.LC45)
        ldi r23, hi8(.LC45)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-47)
        ldi r21, lo8(98)
        ldi r22, lo8(.LC46)
        ldi r23, hi8(.LC46)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-21)
        ldi r21, lo8(-126)
        ldi r22, lo8(.LC47)
        ldi r23, hi8(.LC47)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-105)
        ldi r21, lo8(1)
        ldi r22, lo8(.LC48)
        ldi r23, hi8(.LC48)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-67)
        ldi r21, lo8(42)
        ldi r22, lo8(.LC49)
        ldi r23, hi8(.LC49)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(-31)
        ldi r21, lo8(112)
        ldi r22, lo8(.LC50)
        ldi r23, hi8(.LC50)
        rcall put

        ldd r24, Y+1
        ldd r25, Y+2
        ldi r20, lo8(43)
        ldi r21, lo8(122)
        ldi r22, lo8(.LC51)
        ldi r23, hi8(.LC51)
        rcall put

        nop

pop tmp_reg
        pop r29
        pop r28

        ret

.LC52:
        .string "Enter a string: "

.LC53:
        .string "\n"

.LC54:
        .string "Value for key %c: %d\n"

main:
        push r28
        push r29

        in r28, SP_L
        in r29, SP_H

        subi r28, 17
        sbci r29, 2

        in tmp_reg, SREG

        cli

        out SP_H, r29
        out SREG, tmp_reg
        out SP_L, r28

.L__stack_usage = 531
        rcall createHashMap

        std Y+10, r25
        std Y+9, r24
        ldd r24, Y+9
        ldd r25, Y+10
        rcall addValues

        ldi r24, lo8(.LC52)
        ldi r25, hi8(.LC52)
        mov r24, r25
        push r24

        ldi r24, lo8(.LC52)
        ldi r25, hi8(.LC52)
        push r24

        rcall printf
        
        pop tmp_reg

        lds r18, __iob
        lds r19, __iob+1
        mov r24, r28
        mov r25, r29
        adiw r24, 17
        mov r20, r18
        mov r21, r19
        ldi r22, lo8(-1)
        ldi r23, 0
        rcall fgets

        mov r24, r28
        mov r25, r29
        adiw r24, 17
        ldi r22, lo8(.LC53)
        ldi r23, hi8(.LC53)
        rcall strcspn

        mov r18, r24
        mov r19, r25
        mov r24, r28
        mov r25, r29
        adiw r24, 17
        add r24, r18
        adc r25, r19
        mov r30, r24
        mov r31, r25

        st Z, zero_reg

        mov r24, r28
        mov r25, r29
        adiw r24, 17
        rcall strlen

        std Y+12, r25
        std Y+11, r24
        ldd r24, Y+11
        ldd r25, Y+12
        ldi r18, lo8(-1)
        ldi r19, 0
        mov r22, r18
        mov r23, r19
        rcall __divmodhi4

        mov r24, r22
        mov r25, r23
        std Y+2, r25
        std Y+1, r24
        ldd r24, Y+11
        ldd r25, Y+12
        ldi r18, lo8(-1)
        ldi r19, 0
        mov r22, r18
        mov r23, r19
        rcall __divmodhi4

        sbiw r24, 0

        breq .L24

        ldd r24, Y+1
        ldd r25, Y+2
        adiw r24, 1
        std Y+2, r25
        std Y+1, r24

.L24:
        std Y+4, zero_reg
        std Y+3, zero_reg
        rjmp .L25

.L29:
        ldd r18, Y+3
        ldd r19, Y+4
        mov r24, r18
        mov r25, r19

        swap r24
        swap r25

        andi r25, 0xf0
        eor r25, r24
        andi r24, 0xf0

        eor r25, r24
        sub r24, r18
        sbc r25, r19
        mov r18, r24
        mov r19, r25

        swap r18
        swap r19

        andi r19, 0xf0
        eor r19, r18
        andi r18, 0xf0
        eor r19, r18
        add r24, r18
        adc r25, r19
        std Y+14, r25
        std Y+13, r24
        ldd r24, Y+3
        ldd r25, Y+4
        mov r18, r24
        mov r19, r25
        subi r18, -1
        sbci r19, -1
        mov r24, r18
        mov r25, r19

        swap r24
        swap r25
        andi r25, 0xf0
        eor r25, r24
        andi r24, 0xf0
        eor r25, r24
        sub r24, r18
        sbc r25, r19
        mov r18, r24
        mov r19, r25

        swap r18
        swap r19
        andi r19, 0xf0
        eor r19, r18
        andi r18, 0xf0
        eor r19, r18
        add r24, r18
        adc r25, r19
        std Y+6, r25
        std Y+5, r24
        ldd r24, Y+5
        ldd r25, Y+6
        ldd r18, Y+11
        ldd r19, Y+12
        cp r18, r24
        cpc r19, r25

        brge .L26
        
        ldd r24, Y+11
        ldd r25, Y+12
        std Y+6, r25
        std Y+5, r24

.L26:
        ldd r18, Y+5
        ldd r19, Y+6
        ldd r24, Y+13
        ldd r25, Y+14
        mov r20, r18
        mov r21, r19
        sub r20, r24
        sbc r21, r25
        mov r24, r20
        mov r25, r21
        mov r20, r24
        mov r21, r25
        ldd r24, Y+13
        ldd r25, Y+14
        mov r18, r28
        mov r19, r29

        subi r18, -17
        sbci r19, -1
        add r18, r24
        adc r19, r25
        mov r24, r28
        mov r25, r29
        subi r24, -18
        sbci r25, -2
        mov r22, r18
        mov r23, r19
        rcall strncpy

        ldd r18, Y+5
        ldd r19, Y+6
        ldd r24, Y+13
        ldd r25, Y+14
        mov r30, r18
        mov r31, r19
        sub r30, r24
        sbc r31, r25
        mov r24, r30
        mov r25, r31
        mov r18, r28
        mov r19, r29
        subi r18, -18
        sbci r19, -2
        add r24, r18
        adc r25, r19
        mov r30, r24
        mov r31, r25

        st Z, zero_reg
        std Y+8, zero_reg
        std Y+7, zero_reg
        rjmp .L27

.L28:
        mov r18, r28
        mov r19, r29
        subi r18, -18
        sbci r19, -2
        ldd r24, Y+7
        ldd r25, Y+8
        add r24, r18
        adc r25, r19
        mov r30, r24
        mov r31, r25
        ld r18, Z
        mov r24, r28
        mov r25, r29

        subi r24, -16
        sbci r25, -2

        mov r30, r24
        mov r31, r25
        st Z, r18
        mov r24, r28
        mov r25, r29
        subi r24, -16
        sbci r25, -2
        mov r30, r24
        mov r31, r25
        std Z+1, zero_reg
        mov r18, r28
        mov r19, r29
        subi r18, -16
        sbci r19, -2
        ldd r24, Y+9
        ldd r25, Y+10
        mov r22, r18
        mov r23, r19
        rcall get

        std Y+16, r25
        std Y+15, r24
        mov r18, r28
        mov r19, r29
        subi r18, -18
        sbci r19, -2
        ldd r24, Y+7
        ldd r25, Y+8
        add r24, r18
        adc r25, r19
        mov r30, r24
        mov r31, r25
        ld r24, Z
        mov tmp_reg, r24
        lsl r0
        sbc r25, r25
        ldd r18, Y+16
        push r18
        ldd r18, Y+15
        push r18
        mov r18, r25
        push r18
        push r24
        ldi r24, lo8(.LC54)
        ldi r25, hi8(.LC54)
        mov r24, r25
        push r24
        ldi r24, lo8(.LC54)
        ldi r25, hi8(.LC54)
        push r24
        rcall printf

        pop tmp_reg
        ldd r24, Y+7
        ldd r25, Y+8
        adiw r24, 1
        std Y+8, r25
        std Y+7, r24

.L27:
        mov r24, r28
        mov r25, r29
        subi r24, -18
        sbci r25, -2
        rcall strlen

        mov r18, r24
        mov r19, r25
        ldd r24, Y+7
        ldd r25, Y+8
        cp r24, r18
        cpc r25, r19

        brsh .+2
        rjmp .L28

        ldd r24, Y+3
        ldd r25, Y+4
        adiw r24, 1
        std Y+4, r25
        std Y+3, r24

.L25:
        ldd r18, Y+3
        ldd r19, Y+4
        ldd r24, Y+1
        ldd r25, Y+2
        cp r18, r24
        cpc r19, r25

        brge .+2
        rjmp .L29

        ldd r24, Y+9
        ldd r25, Y+10
        rcall destroyHashMap

        ldi r24, 0
        ldi r25, 0
        subi r28, -17
        sbci r29, -3
        in tmp_reg, SREG
        
        cli

        out SP_H, r29
        out SREG, tmp_reg
        out SP_L, r28
        pop r29
        pop r28
        ret

rjmp $
