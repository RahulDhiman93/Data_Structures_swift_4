class Node<T> {
  var value: T
  var leftChild: Node?
  var rightChild: Node?

  init(value: T) {
    self.value = value
  }
}

enum BinaryTree<T> {
  case empty
  indirect case node(BinaryTree, T, BinaryTree)
}

//customStringConvertible

extension BinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
    case .empty:
      return ""
    }
  }

private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
  switch self {
  // 1
  case .empty:
    return .node(.empty, newValue, .empty)
  // 2 
  case let .node(left, value, right):
    if newValue < value {
      return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
    } else {
      return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
    }
  }
}

// Getting the count

var count: Int {
  switch self {
  case let .node(left, _, right):
    return left.count + 1 + right.count
  case .empty:
    return 0
  }
}

// write in binary tree

var binaryTree: BinaryTree<Int> = .empty
binaryTree.naiveInsert(newValue: 5) // binaryTree now has a node value with 5
binaryTree.naiveInsert(newValue: 7) // binaryTree is unchanged
binaryTree.naiveInsert(newValue: 9) // binaryTree is unchanged
}

// function to insert

mutating func insert(newValue: T) {
  self = newTreeWithInsertedValue(newValue: newValue)
}

//traversal in order

func traverseInOrder(process: @noescape (T) -> ()) {
  switch self {
  // 1
  case .empty:
    return 
  // 2
  case let .node(left, value, right):
    left.traverseInOrder(process: process)
    process(value)
    right.traverseInOrder(process: process)
  }
}

//traversal pre order 

func traversePreOrder( process: @noescape (T) -> ()) {
  switch self {
  case .empty:
    return
  case let .node(left, value, right):
    process(value)
    left.traversePreOrder(process: process)
    right.traversePreOrder(process: process)
  }
}

//traversal post order

func traversePostOrder( process: @noescape (T) -> ()) {
  switch self {
  case .empty:
    return
  case let .node(left, value, right):
    left.traversePostOrder(process: process)
    right.traversePostOrder(process: process)
    process(value) 
  }
}