#define SP_H = 0x3e
#define SP_L = 0x3d
#define SREG = 0x3f
#define tmp_reg = 0
#define zero_reg = 1

.LC0:
        .string "Error: String size must be 64, 128, or 256 bits."
.LC1:
        .string "KeySize: %d\n"

checkKeySize(char*):
        push r28
        push r29
        rcall .

        in r28, SP_L
        in r29, SP_H

.L__stack_usage = 6
        std Y+4, r25
        std Y+3, r24
        ldd r24, Y+3
        ldd r25, Y+4
        rcall strlen

        lsl r24
        rol r25
        lsl r24
        rol r25
        lsl r24
        rol r25

        std Y+2, r25
        std Y+1, r24
        ldd r24, Y+1
        ldd r25, Y+2
        cpi r24, 64
        cpc r25, zero_reg

        breq .L2

        ldd r24, Y+1
        ldd r25, Y+2

        cpi r24, -128
        cpc r25, zero_reg

        breq .L2

        ldd r24, Y+1
        ldd r25, Y+2
        cp r24, zero_reg
        ldi r18, 1
        cpc r25, r18

        breq .L2

        ldi r24, lo8(.LC0)
        ldi r25, hi8(.LC0)
        rcall puts

        ldi r24, lo8(1)
        ldi r25, 0
        rcall exit

.L2:
        ldd r24, Y+2
        push r24
        ldd r24, Y+1
        push r24
        ldi r24, lo8(.LC1)
        ldi r25, hi8(.LC1)
        mov r24, r25
        push r24
        ldi r24, lo8(.LC1)
        ldi r25, hi8(.LC1)
        push r24
        rcall printf

        pop tmp_reg
        nop

pop tmp_reg
        pop r29
        pop r28
        ret

rjmp $
