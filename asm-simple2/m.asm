EXTRN GetStdHandle: PROC
EXTRN WriteFile:    PROC
EXTRN lstrlen:      PROC
EXTRN ExitProcess:  PROC

STD_OUTPUT = -11

.DATA

    hFile        QWORD 0
    msglen       DWORD 0
    BytesWritten DWORD 0
    msg          BYTE  "Hello x64 World!", 13, 10, 0
    

.CODE

    main PROC

	;int 3              ; breakpoint for debugger

        sub rsp, 28h    ; obligatoire, mais pourquoi (pas obligatoire si sortie avec call ExitProcess) 
        ;space for 4 arguments + 16byte aligned stack
        ;https://stackoverflow.com/questions/19128291/stack-alignment-in-x64-assembly

        lea rcx, msg
        call lstrlen
        mov msglen, eax

	mov ecx, STD_OUTPUT        ; STD_OUTPUT
	call GetStdHandle
        mov hFile, rax

        lea r9, BytesWritten
       	mov r8d, msglen
	lea rdx, msg
        mov rcx, hFile
	call WriteFile

	
    ;xor ecx, ecx        ; exit code = 0
	;call ExitProcess
    add rsp,28h
    ret

    main ENDP

END