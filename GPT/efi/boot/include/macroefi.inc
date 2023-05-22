if ~ defined __MACROEFI__
__MACROEFI__ EQU 0


;; --- constants --- ;;
true EQU 1
false EQU 0
null EQU 0
nl EQU 13,10
via EQU ,

;; --- structures --- ;;

struc sString [value] {
	common
	if ~ value eq 
	. du value, null
	else
	. du null
	end if
}

struc sStrbuf _len {
	if ~ len eq 
.len dq _len*2
.val rw _len
	else
.len dq 1024*2
.val rw 1024
	end if
}

struc sKey scan, utf {
	if ~ scan eq 
.scancode dw scan
	else
.scancode dw null
	end if
	if ~ utf eq 
.unicode du utf
	else
.unicode:
	end if
	du null
}

;; --- macros --- ;;

macro mEntry _ofs {
	format pe64 dll efi
	entry _ofs
}

macro mInit {
	InitializeLib
	jnc @f
	mExit EFI_SUCCESS
@@:
}

macro mPrint _str {
    if ~_str eq 
	uefi_call_wrapper ConOut, OutputString, ConOut, _str
	end if
}

macro mPrintln _str {
	if ~ _str eq 
	mPrint _str
	end if
	mPrint _crlf
}

macro mReturn [data] {
	if ~ data eq 
	forward
	push data
	end if
	common
	ret
}

macro mInvoke func, [arg] {
	if ~ arg eq 
	reverse
	push arg
	end if
	call func
}; vacuum example: mInvoke fSend via message

macro mEfidata {
	common
	mSect data
	__crlf sString nl
	__key_buf sKey null, null
}

macro mScankey _key {
	if ~ _key eq 
	mov [_key], dword 0
@@:
	uefi_call_wrapper ConIn, ReadKeyStroke, ConIn, _key
	cmp dword [_key], 0
	jz @b
	end if
}

macro mExit status {
	if status eq 
	mov eax, EFI_SUCCESS
	else
	mov eax, status
	end if
	retn
}

macro mSect name, type {
	if type eq data
	section '.#name' data readable writable
	else if type eq code
	section '.#name' code executable readable
	else if type eq text
	section '.#name' code executable readable
	else if type eq fixup
	section '.#name' fixups data discardable
	end if
}

end if