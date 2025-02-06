// The prototype pattern is used to instantiate a new object by copying all of the properties of an existing object, creating an independent clone. This practise is particularly useful when the construction of a new object is inefficient.

// The Prototype Design Pattern is a creational design pattern used to create new objects by copying an existing object (called a prototype). This can be beneficial when object creation is resource-intensive or when objects have complex initialization logic.  Swift supports this pattern naturally using value types and protocols.

/*
Key Components:
1. Prototype: An interface for clining objects.
2. Concrete Prototype: The class or struct implementing the cloning operation.
3. Client: The part of the system that uses the cloned objects.
*/

/*
Implementation in Swift
1. Using NSCopying
*/

class Car: NSObject, NSCopying {
    var make: String
    var model: String

    init(make: String, model: String) {
        self.make = make
        self.model = model
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Car(make: self.make, model: self.model)
    }
}

let originalCar = Car(make: "Tesla", model: "Model S")
if let clonedCar = originalCar.copy() as? Car {
    print("Original Car: \(originalCar.make) \(originalCar.model)")
    print("Cloned Car: \(clonedCar.make) \(clonedCar.model)")
}

// Using Custom Protocol for Copying
protocol Prototype: AnyObject {
    func clone() -> Self
}

class Smartphone: Prototype {
    var brand: String 
    var model: String

    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }

    func clone() -> Self {
        return type(of: self).init(brand: self.brand, model: self.model)
    }

    required init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
}

// Usage
let originalPhone = Smartphone(brand: "Apple", model: "iPhone 14")
let clonedPhone = originalPhone.clone()

print("Original Phone: \(originalPhone.brand) \(originalPhone.model)")
print("Cloned Phone: \(clonedPhone.brand) \(clonedPhone.model)")

/*
Advantages:
- Reduces the cost of creating objects.
- Simplifies object creation for complex configurations.
- Avoids tight coupling to concrete classes.

Disadvantages:
- Cloning complex objects may be tricky if there are nested references.
- Proper deep cloning can require additional effort.
*/

/*
Key Points
1. NSCopying Protocol: The NSCopying protocol requires implementing the copy(with:) method, which returns a copy of the object.
2. Deep vs Shallow Copy: In this example, the Car class has value-type properties, so the copy is a deep copy. If the class had reference-type properties, you would need to handle copying those properties explicily to avoid shared references.
3. Flexibility: The Prototype Pattern is useful when object creation is expensive or when you want to avoid subclassing for object creation.

When to Use the Prototype Pattern:
- When creating a new object is more expensive than copying an existing one.
- When you want to avoid a complex initialization process.
- When you need to create objects that are similar but not identical to existing objects.

This pattern is particularly useful in scenarios like game development (e.g., cloning game entities) or when working with complex object graphs.
*/