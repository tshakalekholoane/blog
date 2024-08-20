#include "binary_search_bridge.h"
#include <stdio.h>
#include <stdlib.h>

int main(void) {
  long a[] = {2, 5, 8, 12, 16, 23, 38, 56, 72, 91};
  long n = sizeof(a) / sizeof(long), x = 56, want = 7;
  long got = binary_search(a, n, x);
  if (got != want) {
    printf("binary_search(a, n, x) = %ld, want %ld\n", got, want);
    return EXIT_FAILURE;
  }
}
