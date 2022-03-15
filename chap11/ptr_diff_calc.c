int arr[128];

int* ptr1 = &arr[50];

int* ptr2 = &arr[90];

ptrdiff_t d = ptr2 - ptr1;