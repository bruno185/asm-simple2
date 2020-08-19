.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data

	; variables here

.code

main PROC

	; code here
	mov eax,1
	mov ebx,2
	add eax,ebx
	sal eax,1
	INVOKE ExitProcess, 0

main ENDP
END main
