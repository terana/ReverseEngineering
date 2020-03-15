IFDEF RAX
.CODE 

; rcx, rdx, r8, r9 - arg0, arg1, arg2, arg3
; 
; rsp+28 - arg4
; rsp+8,10,18,20 - home
; rsp+0 - ret addr
;
; The fastcall is ignored by com[iler, used MS x64 calling convention.
asm_fastcall PROC
 sub rcx, rdx
 sub rcx, r8
 sub rcx, r9
 sub rcx, [rsp+28h]
 mov rax, rcx
 ret
asm_fastcall ENDP

; rcx, rdx, r8, r9 - arg0, arg1, arg2, arg3
; 
; rsp+28 - arg4
; rsp+8,10,18,20 - home
; rsp+0 - ret addr
; used MS x64 calling convention.
asm_stdcall PROC
 sub rcx, rdx
 sub rcx, r8
 sub rcx, r9
 sub rcx, [rsp+28h]
 mov rax, rcx
 ret 
asm_stdcall ENDP

; rcx, rdx, r8, r9 - arg0, arg1, arg2, arg3
; 
; rsp+28 - arg4
; rsp+8,10,18,20 - home
; rsp+0 - ret addr
; used MS x64 calling convention.
asm_cdecl PROC
 sub rcx, rdx
 sub rcx, r8
 sub rcx, r9
 sub rcx, [rsp+28h]
 mov rax, rcx
 ret
asm_cdecl ENDP

ELSE

.MODEL FLAT
.CODE

; ecx, edx - arg0, arg1
; 
; esp+C - arg4
; esp+8 - arg3
; esp+4 - arg2
; esp+0 - ret addr
;
@asm_fastcall@20 PROC
 sub ecx, edx
 sub ecx, [esp+4]
 sub ecx, [esp+8]
 sub ecx, [esp+0Ch]
 mov eax, ecx
 retn 0Ch
@asm_fastcall@20 ENDP

;
; esp+14 - arg4
; esp+10 - arg3
; esp+C - arg2
; esp+8 - arg1
; esp+4 - arg0
; esp+0 - ret addr
;
_asm_stdcall@20 PROC
 mov eax, [esp+4]
 sub eax, [esp+8]
 sub eax, [esp+0Ch]
 sub eax, [esp+10h]
 sub eax, [esp+14h]
 retn 14h
_asm_stdcall@20 ENDP

;
; esp+14 - arg4
; esp+10 - arg3
; esp+C - arg2
; esp+8 - arg1
; esp+4 - arg0
; esp+0 - ret addr
;
_asm_cdecl PROC
 mov eax, [esp+4]
 sub eax, [esp+8]
 sub eax, [esp+0Ch]
 sub eax, [esp+10h]
 sub eax, [esp+14h]
 retn
_asm_cdecl ENDP

ENDIF
END