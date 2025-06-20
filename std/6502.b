putchar(c) {
    0xFFEF(c);
}

malloc() {
    return (0x200);
}
// __heap_ptr 0x200;
// malloc(size) {
//     return(__heap_ptr += size);
// }

// TODO: add other arguments
printf(str) {
    extrn char;
    auto i, c;
    i = 0;

    c = char(str, i);
    while (c) {
        if (c == '\n') {
            putchar(0xD); // \r
        }
        putchar(c);
        i++;
        c = char(str, i);
    }
}

// read a single byte
byte(addr) {
    extrn char;
    return (char(addr, 0));
}

getchar() {
    while ((byte(0xD011) < 0) == 0) {}
    auto b;
    b = byte(0xD010) & 0x7F;
    if (b == 0xD) {
        b = '\n';
    }
    return (b);
}
