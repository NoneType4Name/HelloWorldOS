; импортируем макросы
include "include/macroefi.inc"

; назначаем точку входа
mEntry main

; импортируем вторую часть библиотеки (обязательно после mEntry!)
include "include/sysuefi.inc"

; секция '.text' code executable readable
mSect text, code

; главная функция
main:
	  ; инициализируем библеотеку
    mInit
    ; печатаем хеловорлд
    mPrint hello
    ; аналог _getch из msvcrt.dll,
    ; ждем клавиши и сохраняем в key
    mScankey key
    ; возвращаемся в UEFI shell
    ; со статусом ОК
    mExit EFI_SUCCESS

; импортируем третью часть библиотеки (желательно посте основного кода)
include "include/libuefi.inc"

; секция '.bsdata' data readable writable
mSect bsdata, data

; utf-8 строка для хеловорлда
hello sString 'Hello UEFI World!'

; ячейка для клавиши
key sKey

; финальный макрос библиотеки. ВСЕГДА в конце всего кода
mEfidata