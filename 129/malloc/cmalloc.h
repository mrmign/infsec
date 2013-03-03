#ifndef CMALLOC_H
#define CMALLOC_H

// To distinguish from the standard library, I 
// renamed the two functions to "cmalloc" and "cfree".
void *cmalloc (int bytes);
void cfree (void *p);

#endif
