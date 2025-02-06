// The Builder Design Pattern is a creational design pattern that allows for step-by-step creation of complex objects. This pattern is particularly useful when an object requires numerous configurations, making it cleaner and more maintainable than using multiple constructors.

// Product
struct Burger {
    let size: Int
    let cheese: Bool
    let lettuce: Bool
    let pickles: Bool

    func description() {
        print("Burger - Size: \(size), Cheese: \(cheese), Lettuce: \(lettuce), Pickles: \(pickles)")
    }
}

// Builder
class BurgerBuilder {
    private var size: Int = 0
    private var cheese: Bool = false
    private var lettuce: Bool = false
    private var pickles: Bool = false

    func setSize(_ size: Int) -> BurgerBuilder {
        self.size = size
        return self
    }

    func addCheese() -> BurgerBuilder {
        self.cheese = true
        return self
    }

    func addLettuce() -> BurgerBuilder {
        self.lettuce = true
        return self
    }

    func addPickles() -> BurgerBuilder {
        self.pickles = true
        return self
    }

    func build() -> Burger {
        Burger(size: size, cheese: cheese, lettuce: lettuce, pickles: pickles)
    }
}

// Usage
let burger = BurgerBuilder()
                .setSize(5)
                .addCheese()
                .addLettuce()
                .build()
burger.description()

/*
Key Points
    1. Encapsulation: The BurgerBuilder class encapsulates the creation logic and configurations for the Burger.
    2. Fluent API: Methods return the BurgerBuilder instance itself, allowing for method chaining.
    3. Immutability: The final Burger object is immutable, ensuring a safe and consistent state.

Advantages
    - Simplifies object creation when there are many option configurations.
    - Makes the code more readable and easier to maintain.
    - Promotes immutability by constructing the object in a single step.
*/