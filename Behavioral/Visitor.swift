// ChatGPT
/*
The Visitor Design Pattern is a behavioral design pattern that allows you to separate algorithms or operations from the objects on which they operate. It is particularly useful when you need to perform different kinds of operations on a group of related objects without modifying their structure.

Components of the Visitor Pattern
    1. Visitor Protocol
        Defines an interface for operations that can be performed on elements of an object structure.
    2. ConcreteVisitor
        Implements the operations defined in the Visitor Protocol for specific types of elements.
    3. Element Protocol
        Defines an interface for elements that can accept a visitor.
    4. Concrete Element
        Implements the Element protocol and provides an implementation for accepting visitors.
    5. Object Structure
        A collection or hierarchy of objects that can be visited by the Visitor.

Example in Swift 
    Suppose we have a system with shapes, and we want to calculate the area and perimeter for each shape without modifying the shape classes.
*/

protocol ShapeVisitor {
    func visitCircle(_ circle: Circle)
    func visitRectangle(_ rectangle: Rectangle)
}

protocol Shape {
    func accept(visitor: ShapeVisitor)
}

class Circle: Shape {
    let radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func accept(visitor: ShapeVisitor) {
        visitor.visitCircle(self)
    }
}

class Rectangle: Shape {
    let width: Double
    let height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func accept(visitor: ShapeVisitor) {
        visitor.visitRectangle(self)
    }
}

class AreaCalculator: ShapeVisitor {
    func visitCircle(_ circle: Circle) {
        let area = Double.pi * pow(circle.radius, 2)
        print("Circle area: \(area)")
    }

    func visitRectangle(_ rectangle: Rectangle) {
        let area = rectangle.width * rectangle.height
        print("Rectangle area: \(area)")
    }
}

class PerimeterCalculator: ShapeVisitor {
    func visitCircle(_ circle: Circle) {
        let perimeter = 2 * Double.pi * circle.radius
        print("Circle perimeter: \(perimeter)")
    }

    func visitRectangle(_ rectangle: Rectangle) {
        let perimeter = 2 * (rectangle.width + rectangle.height)
        print("Rectange perimeter: \(perimeter)")
    }
}

let shapes: [Shape] = [
    Circle(radius: 5),
    Rectange(width: 4, height: 7)
]

let areaCalculator = AreaCalculator()
let perimeterCalculator = PerimeterCalculator()

for shape in shapes {
    shape.accept(visitor: areaCalculator)
    shape.accept(visitor: perimeterCalculator)
}

/*
Benefits of the Visitor Pattern
    - Separation of concerns: The logic for the operations is separated from the data structures.
    - Open/Closed Principle: You can add new operations without modifying the existing data structures.
    - Double Dispatch: It allows the operation to vary based on both the type of the visitor and the type of the element it is visiting.

When to Use the Visitor Pattern
    - When you have a complex object structure with many types and need to perform multiple unrelated operations.
    - When the object structure is stable, but the operations might change or grow.
*/



// DeepSeek
/*
Key Points
    1. Separation of Concerns: The Visitor pattern separates the algorithm (e.g. area calculation, JSON export) from the object structure.
    2. Extensibility: You can add new operations by creating new visitors without modifying the existing shape classes.
    3. Double Dispatch: The accept method in each shape calls the appropriate visit method on the visitor, enabling dynamic dispatch.

This pattern is particularly useful when you have a stable object structure but frequently need to add new operations.
*/