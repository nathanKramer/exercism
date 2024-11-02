module [fromList, toList]

BinaryTree : [Nil, Node { value : U64, left : BinaryTree, right : BinaryTree }]

fromList : List U64 -> BinaryTree
fromList = \data ->
    help = \tree, item ->
        when tree is
            Nil -> Node { value: item, left: Nil, right: Nil }
            Node { value, left, right } ->
                if item <= value then
                    Node { value, left: help left item, right }
                else
                    Node { value, left, right: help right item }
    List.walk data Nil help

toList : BinaryTree -> List U64
toList = \tree ->
    help = \acc, subTree ->
        when subTree is
            Nil -> acc
            Node { value, left, right } ->
                leftSide = help acc left
                rightSide = help (List.append leftSide value) right
                rightSide
    help [] tree
