// The Decorator Design Pattern is a structural design pattern that allows behavior to be added to individual objects, either statically or dynamically, without affecting the behavior of other objects from the same class. It is useful for extending the functionality of objects in a flexible and reusable way.

/*
Key Concepts of the Decorator Pattern
1. Component: Defines the interface that objects can implement.
2. Concrete Component: The base implementation of the Component interface.
3. Decorator: Implements the Component interface and has a reference to a Component object to which it delegates the functionality.
4. Concrete Decorator: Extends the behavior of the Component it decorates.
*/

/*
Example: Coffee Customization
Let's implement a coffee shop example where we can decorate a basic coffee with various addons like milk, sugar, and whipped cream.
*/

// Component Protocol
protocol Coffee {
    func cost() -> Double
    func description() -> String
}

// Concrete Component
class BasicCoffee: Coffee {
    func cost() -> Double {
        5.0
    }

    func description() -> String {
        "Basic Coffee"
    }
}

// Decorator
class CoffeeDecorator: Coffee {
    private let decoratedCoffee: Coffee

    init(decoratedCoffee: Coffee) {
        self.decoratedCoffee = decoratedCoffee
    }

    func cost() -> Double {
        decoratedCoffee.cost()
    }

    func description() -> String {
        decoratedCoffee.description()
    }
}

// Concrete Decorators
class MilkDecorator: CoffeeDecorator {
    override func cost() -> Double {
        super.cost() + 1.0
    }

    override func description() -> String {
        super.description() + ", Milk"
    }
}

class SugarDecorator: CoffeeDecorator {
    override func cost() -> Double {
        super.cost() + 0.5
    }

    override func description() -> String {
        super.description() + ", Sugar"
    }
}

class WhippedCreamDecorator: CoffeeDecorator {
    override func cost() -> Double {
        super.cost() + 1.5
    }

    override func description() -> String {
        super.description() + ", Whipped Cream"
    }
}

// Usage
let basicCoffee: Coffee = BasicCoffee()
print("\(basicCoffee.description()): $\(basicCoffee.cost())")

let coffeeWithMilk = MilkDecorator(decoratedCoffee: basicCoffee)
print("\(coffeeWithMilk.description()): $\(coffeeWithMilk.cost())")

let coffeeWithMilkAndSugar = SugarDecorator(decoratedCoffee: coffeeWithMilk)
print("\(coffeeWithMilkAndSugar.description()): $\(coffeeWithMilkAndSugar.cost())")

let fullyLoadedCoffee = WhippedCreamDecorator(decoratedCoffee: coffeeWithMilkAndSugar)
print("\(fullyLoadedCoffee.description()): $\(fullyLoadedCoffee.cost())")

/*
How It Works
1. The Coffee protocol defines the common interface for all types of coffee.
2. The BasicCoffee class is the base implementation.
3. The CoffeeDecorator class serves as a base class for decorators, forwarding calls to the decorated Coffee.
4. Concrete decorators (e.g., MilkDecorator, SugarDecorator) extend functionality by override methods like cost and desciption.
*/

/* DeepSeek
Explanation
1. Base Protocol (Coffee): Defines the interface for all concrete components and decorators.
2. Concrete Component (SimpleCoffee): Implements the base behavior.
3. Base Decorator(CoffeeDecorator): Wraps a Coffee object and delegates calls to it. This is the core of the Decorator pattern.
4. Concrete Decorators (MilkDecorator, SugarDecorator): Add additional behavior by overriding from the base decorator.

Key Benefits:
- Open/Closed Principle: You can extend behavior without modifying existing code.
- Flexibility: You can dynamically add or remove behaviors at runtime.
- Single Responsibility Principle: Each decorator has a single responsibility.

This pattern is widely used in Swift, especially when working with frameworks like UIKit (e.g., decorating views or view controllers).
*/