.data
    array db 10           ; 10 elemanlık bir dizi oluşturuyoruz
    counter db 10         ; Döngü için sayaç, başlangıç değeri 10
    prompt db "Enter a value: ", 0
    prompt_len equ $ - prompt
    newline db 10         ; Yeni satır karakteri

section .bss
    value resb 2          ; Kullanıcıdan alınacak değeri saklamak için 2 byte'lık bir alan ayrıyoruz

.text
.global start

start:
    ; Döngü başlangıcı
    mov ecx, dword [counter]    ; ecx'e döngü sayacı değerini yükle

input_loop:
    ; Kullanıcıdan değer al
    mov eax, 4                  ; write sistem çağrısı
    mov ebx, 1                  ; stdout
    mov ecx, prompt             ; prompt'u ecx'e yükle
    mov edx, prompt_len         ; prompt'un uzunluğunu edx'e yükle
    int 0x80                    ; sistem çağrısını yap

    ; Değeri al
    mov eax, 3                  ; read sistem çağrısı
    mov ebx, 0                  ; stdin
    mov ecx, value              ; değeri value adresine yükle
    mov edx, 2                  ; 2 byte oku
    int 0x80                    ; sistem çağrısını yap

    ; Alınan değeri diziye ekle
    movzx edx, byte [counter]  ; edx'e counter değerini yükle
    sub edx, 1                 ; edx'den 1 çıkararak array indeksini belirle
    movzx eax, byte [value]    ; eax'e alınan değeri yükle
    mov [array + edx], al      ; array[edx] adresine alınan değeri yükle

    ; Döngüden çıkma koşulu
    dec dword [counter]         ; counter değerini bir azalt
    jnz input_loop              ; counter sıfıra eşit değilse döngüye geri dön

    ; Değerleri ekrana yazdır
    mov ecx, 10                 ; ekrana yazdırılacak eleman sayısı
    mov esi, array              ; esi'yi array'in başlangıç adresine yükle

print_loop:
    mov eax, 4                  ; write sistem çağrısı
    mov ebx, 1                  ; stdout
    mov edx, 1                  ; bir byte yazdır
    mov al, byte [esi]          ; esi'nin gösterdiği değeri al
    add al, '0'                 ; sayı değerini ASCII'ye dönüştür
    int 0x80                    ; sistem çağrısını yap

    ; Yeni satır yazdır
    mov eax, 4                  ; write sistem çağrısı
    mov ebx, 1                  ; stdout
    mov ecx, newline            ; newline'ı ecx'e yükle
    mov edx, 1                  ; bir byte yazdır
    int 0x80                    ; sistem çağrısını yap

    inc esi                     ; bir sonraki dizi elemanına geç

    ; Döngüden çıkma koşulu
    loop print_loop             ; ecx sıfıra ulaşana kadar döngüyü tekrarla

    ; Programı sonlandır
    mov eax, 1                  ; exit sistem çağrısı
    xor ebx, ebx                ; return code 0
    int 0x80                    ; sistem çağrısını yap
