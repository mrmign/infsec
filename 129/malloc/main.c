#include <stdio.h>
#include "cmalloc.h"

int main()
{
  int *p0;
  int *p1;
  int *p2;

  // malloc a "p0" and initialize it
  p0 = cmalloc (4);
  *p0 = 0xdeadbeef;

  // to check that the initialization is OK.
  // Q1: what's the output?
  printf ("*p0 = 0x%x\n", *p0);  // [1]

  // malloc a pointer "p1"
  p1 = cmalloc (4);
  // do some magic!
  *(p1-1) *= 2;
  // and then free "p1"
  cfree (p1);
  
  // malloc a fresh "p2" and initialize the memory
  p2 = cmalloc (4);
  *p2 = 0xbeefdead;
  printf("%p %p\n", p0,p2);
  // check the memory "p0" is pointing to...
  // Q2: what's the output? Is this output the same as the
  // one above in Q1? Should they be same or not? Explain
  // your observations.
  printf ("*p0 = 0x%x\n", *p0);  // [2]
  
  // uncomment the following 3 statement and try it.
  // Q3: what do you get? Explain your observations.
 
  *(p2-1) *= 0x0fffffff;      // [3]
  cfree (p2);                 // [4]
  cmalloc (0);                // [5]
  
  return 0;
}

