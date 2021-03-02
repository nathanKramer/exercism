def push_node(tree_node, datum):
    if not tree_node:
        return TreeNode(datum)
    return tree_node.push(datum)


class TreeNode:
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right

    def __str__(self):
        fmt = 'TreeNode(data={}, left={}, right={})'
        return fmt.format(self.data, self.left, self.right)

    def push(self, datum):
        if datum <= self.data:
            self.left = push_node(self.left, datum)
        else:
            self.right = push_node(self.right, datum)
        return self

    def dive(self):
        result = []
        if self.left:
            result += self.left.dive()
            result.append(self.data)
        else:
            result.append(self.data)

        if self.right:
            result += self.right.dive()
        return result


class BinarySearchTree:
    def __init__(self, tree_data):
        self.head = None
        for datum in tree_data:
            self.head = push_node(self.head, datum)

    def data(self):
        return self.head

    def sorted_data(self):
        return self.head.dive()
