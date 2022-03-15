void* a = (void*)4;

short* b = (short*)a;

b++;
b = a;
a = b;