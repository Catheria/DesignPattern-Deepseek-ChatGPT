// The flyweight pattern is used to minimize memory usage or computational expenses by sharing as much as possbile with other similar objects.

// The Flyweight Design Pattern is a structural design pattern aimed at reducing memory usage by sharing common objects instead of instantiating multiple copies of identical objects. This pattern is particularly useful when dealing with a large number of similar objects.

/*
Key Concept
The Flyweight pattern uses a factory to ensure that the same instance of an object is shared where possible, distinguishing between intrinsic (shared) and extrinsic (unique) states.
- Intrinsic State: Immutable and shared among objects.
- Extrinsic State: Provided by the client and varies per object.

When to Use Flyweight
- When your application needs to handle a large number of similar objects.
- Memory optimization is a priority.
- Identifying shared states in objects can help reduce memory overhead.
*/

// Flyweight: Shared Tree Type
class TreeType {
    let name: String
    let color: String
    let texture: String

    init(name: String, color: String, texture: String) {
        self.name = name
        self.color = color
        self.texture = texture
    }

    func display(x: Int, y: Int) {
        print("Displaying '\(name)' tree at (\(x), \(y)) with color \(color) and texture \(texture).")
    }
}

// Flyweight Factory
class TreeFactory {
    private var treeTypes: [String: TreeType] = [:]

    func getTreeType(name: String, color: String, texture: String) -> TreeType {
        let key = "\(name)-\(color)-\(texture)"
        if let treeType = treeTypes[key] {
            return treeType
        } else {
            let newTreeType = TreeType(name: name, color: color, texture: texture)
            treeTypes[key] = newTreeType
            return newTreeType
        }
    }
}

// Flyweight Consumer 
struct Tree {
    let x: Int
    let y: Int
    let type: TreeType

    func display() {
        type.display(x: x, y: y)
    }
}

// Context
class Forest {
    private var trees: [Tree] = []
    private let treeFactory = TreeFactory()

    func plantTree(x: Int, y: Int, name: String, color: String, texture: String) {
        let treeType = treeFactory.getTreeType(name: name, color: color, texture: texture)
        let tree = Tree(x: x, y: y, type: treeType)
        trees.append(tree)
    }

    func displayTrees() {
        for tree in trees {
            tree.display()
        }
    }
}

// Usage
let forest = Forest()
forest.plantTree(x: 1, y: 1, name: "Oak", color: "Green", texture: "Rough")
forest.plantTree(x: 2, y: 3, name: "Pine", color: "Dark Green", texture: "Smooth")
forest.plantTree(x: 3, y: 5, name: "Oak", color: "Green", texture: "Rough") // Shares the existing Oak type

forest.displayTrees()

/*
Explanation
- TreeType: Represents the intrinsic shared state.
- TreeFactory: Ensures that the same instance of TreeType is reused.
- Forest: Manages a collection of trees using shared TreeType instances.
- Display Optimization: Multiple trees share the same type, reducing memory usage.

This example demonstrates how the Flyweight pattern can effectively minimize memory usage by sharing object instances in Swift.
*/