module [fromList, toList, push, pop, reverse, len]

SimpleLinkedList : [
    Empty,
    Node
        {
            value : U64,
            next : SimpleLinkedList,
        },
]

fromList : List U64 -> SimpleLinkedList
fromList = \list ->
    when list is
        [] -> Empty
        [data, .. as rest] -> Node { value: data, next: fromList rest }

toList : SimpleLinkedList -> List U64
toList = \linkedList ->
    help = \acc, next ->
        when next is
            Empty -> acc
            Node data ->
                newList = List.append acc data.value
                help newList data.next
    help [] linkedList

push : SimpleLinkedList, U64 -> SimpleLinkedList
push = \linkedList, item ->
    help = \ll ->
        when ll is
            Empty -> Node { value: item, next: Empty }
            Node data -> Node { value: data.value, next: help data.next }
    help linkedList

pop : SimpleLinkedList -> Result { value : U64, linkedList : SimpleLinkedList } _
pop = \linkedList ->
    when linkedList is
        Empty ->
            Err NoValue

        Node { value, next: Empty } ->
            Ok { value, linkedList: Empty }

        Node { value, next } ->
            when pop next is
                Ok { value: popped, linkedList: tail } ->
                    Ok { value: popped, linkedList: Node { value, next: tail } }

                Err err -> Err err

reverse : SimpleLinkedList -> SimpleLinkedList
reverse = \linkedList ->
    help = \prev, acc ->
        when prev is
            Empty -> acc
            Node { next, value } -> help next (Node { value, next: acc })

    help linkedList Empty

len : SimpleLinkedList -> U64
len = \linkedList ->
    help = \next, i ->
        when next is
            Empty -> i
            Node data -> help data.next (i + 1)
    help linkedList 0
