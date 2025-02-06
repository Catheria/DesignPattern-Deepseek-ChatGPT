// The factory method is used to replace class constructors, abstracting the process of object generation so that the type of the object instantiated can be determined at run-time.

/*
The Factory Method Design Pattern is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created. This pattern promotes loose coupling by eliminating the nedd to instantiate classes directly. It is useful when you want to delegate the responsibility of object instantiation to subclasses.
*/

/*
Key Concepts
- Creator: Declares a factory method and may provide a default implementation.
- Concrete Creators: Override the factory method to create specific products.
- Product: Defines the interface for objects the factory method creates.
- Concrete Products: Implements the Product interface.
*/

// Product Protocol
protocol Vehicle {
    func drive()
}

// Concrete Products
class Car: Vehicle {
    func drive() {
        print("Driving a car.")
    }
}

class Bike: Vehicle {
    func drive() {
        print("Riding a bike.")
    }
}

// Creator
protocol VehicleFactory {
    func createVehicle() -> Vehicle
}

// concrete Creators
class CarFactory: VehicleFactory {
    func createVehicle() -> Vehicle {
        Car()
    }
}

class BikeFactory: VehicleFactory {
    func createVehicle() -> Vehicle {
        Bike()
    }
}

// Usage
func getVehicle(factory: VehicleFactory) {
    let vehicle = factory.createVehicle()
    vehicle.drive()
}

let carFactory = CarFactory()
let bikeFactory = BikeFactory()

getVehicle(factory: carFactory)  // Output: Driving a car.
getVehicle(factory: bikeFactory) // Output: Riding a bike.

/*
Key Benefits
- Decouples object creation: The client code depends only on the factory interface, not on the concrete classes.
- Single Responsibility: Factory classes handle object creation, keeping client code clean.
- Open/Closed Principle: Adding new vehicle types require only extending the factory, without changing existing code.
*/

/*
Key Points:
1. Decoupling: The Factory Method pattern decouples the creation of objects from their usage.
2. Extensibility: You can easily add new types of products (e.g., a new vehicle type) without modifying existing code.
3. Subclass Responsibility: Subclasses decide which class to instantiate.

When to Use the Factory Method Pattern:
- When the exact type of object to be created is determined by a subclass.
- When you want to provide a way to extend the system with new products without modifying existing code.
- When the creation logic is complex or involves dependencies.

This pattern is widely useful in frameworks and libraries where the framework needs to delegate object creation to the application code.
*/