// The abstract factory pattern is used to provide a client with a set of related or dependant objects. The 'family' of objects created by the factory are determined at run-time.

/*
The Abstract Factory Design Pattern is a creational design pattern that provides an interface for creating families of related or dependent objects without specifying their concrete classes. This is particularly useful when the client code needs to work with different product families while remaining decoupled from their concrete implementations. It is particularly useful when you need to ensure that the created objects are compatible with each other.
*/

// Product Protocols
protocol Chair {
    var hasLegs: Bool { get }
    func sitOn()
}

protocol Sofa {
    var material: String { get }
    func lieOn()
}

// Concrete Products
class VictorianChair: Chair {
    var hasLegs: Bool = true
    func sitOn() {
        print("Sitting on a Victorian chair.")
    }
}

class ModernChair: Chair {
    var hasLegs: Bool = false
    func sitOn() {
        print("Sitting on a modern chair.")
    }
}

class VictorianSofa: Sofa {
    var material: String = "Leather"
    func lieOn() {
        print("Lying on a Victorian leather sofa.")
    }
}

class ModernSofa: Sofa {
    var material: String = "Fabric"
    func lieOn() {
        print("Lying on a modern fabric sofa.")
    }
}

// Abstract Factory
protocol FurnitureFactory {
    func createChair() -> Chair
    func createSofa() -> Sofa
}

// Concrete Factory
class VictorianFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        VictorianChair()
    }

    func createSofa() -> Sofa {
        VictorianSofa()
    }
}

class ModernFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        ModernChair()
    }

    func createSofa() -> Sofa {
        ModernSofa()
    }
}

// Client Code
func furnishRoom(factory: FurnitureFactory) {
    let chair = factory.createChair()
    let sofa = factory.createSofa()

    chair.sitOn()
    sofa.lieOn()
}

let victorianFactory = VictorianFurnitureFactory()
print("Victorian Room:")
furnishRoom(factory: victorianFactory)

let modernFactory = ModernFurnitureFactory()
print("\nModern Room:")
furnishRoom(factory: modernFactory)

/*
Key Advantages of Abstract Factory
- Encapsulation: Factory encapsulates object creation, promoting loose coupling.
- Consistency: Ensures that products from the same family are used together.
- Extensibility: Adding new product families become straightforward.
*/

/*
Key Points
1. Abstract Factory provides an interface for creating families of related objects.
2. Concrete Factories implement the interface to create platform-specific objects.
3. Products are created through the factory, ensuring compatibility.
4. The pattern promotes loose coupling and makes it easy to switch between families of objects.

This pattern is especially useful in scenarios where you need to support multiple platforms, themes, or configurations.
*/