#include "linked_list.h"

typedef struct list_item
{
   struct list_item *next;
   struct list_item *previous;
   ll_data_t data;
} list_item_t;

list_item_t **new_list()
{
   list_item_t *list =
       &(list_item_t){.next = 0, .previous = 0, .data = 0};
   return list;
}

bool is_list_empty(struct list_item **list)
{
   return !(list && *list);
}
