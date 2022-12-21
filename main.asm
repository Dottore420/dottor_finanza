.LC0:
        .string "Principale EUR "
.LC1:
        .string "%f"
.LC2:
        .string "\nNumero Rate : "
.LC3:
        .string "%d"
.LC4:
        .string "\nTasso di interesse %% "
.LC7:
        .string "Rata %d : EUR %f\n"
.LC8:
        .string "\nIl totale pagato e' di EUR %.2f \nIl principale ha subito un aumento di EUR %.2f\n"
prestitoSemplice():
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        lea     rax, [rbp-20]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, OFFSET FLAT:.LC2
        mov     eax, 0
        call    printf
        lea     rax, [rbp-28]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC3
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, OFFSET FLAT:.LC4
        mov     eax, 0
        call    printf
        lea     rax, [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, 10
        call    putchar
        movss   xmm0, DWORD PTR [rbp-20]
        movss   DWORD PTR [rbp-4], xmm0
        mov     DWORD PTR [rbp-12], 0
        jmp     .L2
.L3:
        pxor    xmm0, xmm0
        movss   DWORD PTR [rbp-16], xmm0
        movss   xmm0, DWORD PTR [rbp-20]
        mov     eax, DWORD PTR [rbp-28]
        pxor    xmm2, xmm2
        cvtsi2ss        xmm2, eax
        movaps  xmm1, xmm0
        divss   xmm1, xmm2
        movss   xmm0, DWORD PTR [rbp-24]
        movss   xmm2, DWORD PTR .LC6[rip]
        divss   xmm0, xmm2
        mulss   xmm0, DWORD PTR [rbp-4]
        addss   xmm0, xmm1
        movss   DWORD PTR [rbp-16], xmm0
        pxor    xmm3, xmm3
        cvtss2sd        xmm3, DWORD PTR [rbp-16]
        movq    rax, xmm3
        mov     edx, DWORD PTR [rbp-12]
        add     edx, 1
        movq    xmm0, rax
        mov     esi, edx
        mov     edi, OFFSET FLAT:.LC7
        mov     eax, 1
        call    printf
        movss   xmm0, DWORD PTR [rbp-20]
        mov     eax, DWORD PTR [rbp-28]
        pxor    xmm2, xmm2
        cvtsi2ss        xmm2, eax
        movaps  xmm1, xmm0
        divss   xmm1, xmm2
        movss   xmm0, DWORD PTR [rbp-4]
        subss   xmm0, xmm1
        movss   DWORD PTR [rbp-4], xmm0
        movss   xmm0, DWORD PTR [rbp-8]
        addss   xmm0, DWORD PTR [rbp-16]
        movss   DWORD PTR [rbp-8], xmm0
        add     DWORD PTR [rbp-12], 1
.L2:
        mov     eax, DWORD PTR [rbp-28]
        cmp     DWORD PTR [rbp-12], eax
        jl      .L3
        movss   xmm1, DWORD PTR [rbp-20]
        movss   xmm0, DWORD PTR [rbp-8]
        subss   xmm0, xmm1
        cvtss2sd        xmm0, xmm0
        pxor    xmm4, xmm4
        cvtss2sd        xmm4, DWORD PTR [rbp-8]
        movq    rax, xmm4
        movapd  xmm1, xmm0
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC8
        mov     eax, 2
        call    printf
        nop
        leave
        ret
.LC9:
        .string "cls"
.LC10:
        .string "pause"
.LC11:
        .string "\n Desideri calcolare un altro valore? 1/0 ->"
.LC12:
        .string "%s"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     BYTE PTR [rbp-1], 49
        jmp     .L5
.L6:
        mov     BYTE PTR [rbp-1], 48
        mov     edi, OFFSET FLAT:.LC9
        call    system
        call    prestitoSemplice()
        mov     edi, OFFSET FLAT:.LC10
        call    system
        mov     edi, OFFSET FLAT:.LC11
        mov     eax, 0
        call    printf
        lea     rax, [rbp-1]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC12
        mov     eax, 0
        call    __isoc99_scanf
.L5:
        movzx   eax, BYTE PTR [rbp-1]
        cmp     al, 49
        je      .L6
        mov     edi, OFFSET FLAT:.LC9
        call    system
        mov     eax, 0
        leave
        ret
__static_initialization_and_destruction_0(int, int):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], edi
        mov     DWORD PTR [rbp-8], esi
        cmp     DWORD PTR [rbp-4], 1
        jne     .L10
        cmp     DWORD PTR [rbp-8], 65535
        jne     .L10
        mov     edi, OFFSET FLAT:_ZStL8__ioinit
        call    std::ios_base::Init::Init() [complete object constructor]
        mov     edx, OFFSET FLAT:__dso_handle
        mov     esi, OFFSET FLAT:_ZStL8__ioinit
        mov     edi, OFFSET FLAT:_ZNSt8ios_base4InitD1Ev
        call    __cxa_atexit
.L10:
        nop
        leave
        ret
_GLOBAL__sub_I_prestitoSemplice():
        push    rbp
        mov     rbp, rsp
        mov     esi, 65535
        mov     edi, 1
        call    __static_initialization_and_destruction_0(int, int)
        pop     rbp
        ret
.LC6:
        .long   1120403456