#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "cmalloc.h"

// This code is loosely based on the algorithm in
// section 8.7 of the book "The C Programming
// Language", by Kernighan and Ritchie.

struct header
{
  struct header *next;
  int size;  
};
#define HEADER_SIZE (sizeof (struct header))
#define TAIL(p) (((char *)p)+p->size)

#define MEM_SIZE (1024 * 1024)
static void *memChunk = 0;
static struct header theHeader = {0, 0};
static struct header *freeList = 0;

static void die (const char *s);

static void 
die (const char *s)
{
  printf ("%s\n", s);
  exit (0);
}

void *
cmalloc (int bytes)
{
  if (bytes<0)
    die("bad mem length");

  if (!memChunk){
    // Use "malloc" instead of "brk" makes this 
    // allocator portable.
    memChunk = malloc (MEM_SIZE);
    if (!memChunk)
      die ("out of memory");

    freeList = &theHeader;

    assert ((void *)freeList < memChunk);

    freeList->next = (struct header *)memChunk;
    freeList = &theHeader;
    freeList->next->size = MEM_SIZE;
    freeList->next->next = 0;
  }
  // first time match
  struct header *prev = freeList;
  struct header *p = prev->next;
  while (p && p->size-HEADER_SIZE < bytes){
    prev = p;
    p = p->next;
  }
  if (!p)
    die ("no memory chunk found");
  
  if (p->size-HEADER_SIZE == bytes){
    prev->next = p->next;
    return ++p;
  }
  // p->size-HEADER_SIZE > bytes
  struct header *q = (struct header *)(TAIL(p)-bytes-HEADER_SIZE);
  q->next = 0;
  q->size = bytes+HEADER_SIZE;
  p->size -= (bytes+HEADER_SIZE);
  return ++q;
}

void 
cfree (void *ptr)
{
  struct header *q = (struct header *)ptr-1;
  int qsize = q->size;
  char *qtail = TAIL(q);
  
  struct header *prev = freeList;
  struct header *p = prev->next;
  
  while (p && p->next<q){
    prev = p;
    p = p->next;
  }
  char *prevtail = TAIL(prev);
  if (prevtail==(void *)q && qtail == (void *)p){
    prev->size += (q->size+p->size);
    prev->next = p->next;
    return;
  }
  else if (prevtail == (void *)q){
    prev->size += q->size;
    return;
  }
  else if (qtail == (void *)p){
    q->size += p->size;
    q->next = p;
    prev->next = q;
    return;
  }
  else {
    q->next = p;
    prev->next = q;
    return;
  }
}

