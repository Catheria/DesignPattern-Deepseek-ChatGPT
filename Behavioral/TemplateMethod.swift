// The template method pattern defines the steps of an algorithm and allows the redefinition of one or more of these steps. In this way, the template method protects the algorithm, the order of execution and provides abstract methods that can be implemented by concrete types.

/*
Chat GPT
The Template Method design pattern is a behavioral pattern that defines the skeleton of an algorithm in a base class and lets subclasses override specific steps without changing the overall algorithm structure. It promotes code reuse and enforces consistent behavior across subclasses.

When to Use the Template Method Pattern
- When multiple subclasses share a common algorithm with variations in some steps.
- To avoid code duplication and ensure consistent execution flow across subclasses.
*/

/*
Components of the Template Method Pattern
1. Abstract Class: Defines the template method and any common methods.
2. Template Method: The method that outlines the algorithm, often marked as final to prevent overriding.
3. Hook Methods: Optional methods that can be overriden by subclasses for additional behavior.
4. concrete Subclasses: Implement the variable steps of the algorithm.
*/

/*
Example in Swift
Here's a simple example of a MealPreparation template where different types of meals (like VegetarianMeal and NonVegetarianMeal) define their specific steps.
*/

// Abstract class with template method
class MealPreparation {
    // Template method
    final func prepareMeal() {
        gatherIngredients()
        cook()
        serve()
        cleanUp()
    }

    // Steps that must be implemented by subclasses
    func gatherIngredients() {
        fatalError("This method must be overriden by subclasses")
    }

    func cook() {
        fatalError("This method must be overriden by subclasses")
    }

    // Default steps that subclasses may optionally override
    func serve() {
        print("Serving the meal.")
    }

    func cleanUp() {
        print("Cleaning up after the meal.")
    }
}

// Concrete subclass 1
class VegetarianMeal: MealPreparation {
    override func gatherIngredients() {
        print("Gathering vegetables, spices, and tofu.")
    }

    override func cook() {
        print("Cooking vegetables and tofu.")
    }
}

// Concrete subclass 2
class NonVegetarianMeal: MealPreparation {
    override func gatherIngredients() {
        print("Gathering chicken, spices, and rice.")
    }

    override func cook() {
        print("Cooking chicken and rice.")
    }
}

// Usage
let vegetarianMeal = VegetarianMeal()
vegetarianMeal.prepareMeal()

let nonVegetarianMeal = NonVegetarianMeal()
nonVegetarianMeal.prepareMeal()

/*
Key Points
- Reusability: The common parts of the algorithm are defined in the base class, reducing duplication.
- Extensibility: Subclasses can provide their specific implementation for certain steps.
- Encapsulation: The template method ensures that the algorithm's structure remains intact.
*/



/*
Deepseek
Example: Beverage Preparation
Imagine a scenario where you want to prepare different types of beverages (e.g., tea and coffee). The steps for preparing these beverages are similar, but some steps vary.
*/

// Step 1: Define the Base Class (Template)
class Beverage {
    // Template method: Defines the algorithm structure
    final func prepareBeverage() {
        boilWater()
        brew()
        pourInCup()
        addCondiments()
    }

    // Common steps (can be overriden if needed)
    func boilWater() {
        print("Boiling water")
    }

    func pourInCup() {
        print("Pouring into cup")
    }

    // Abstract steps (must be overriden by subclasses)
    func brew() {
        fatalError("Subclass must implement brew()")
    }

    func addCondiments() {
        fatalError("Subclass must implement addCondiments()")
    }
}

// Step 2: Create Subclasses
class Tea: Beverage {
    override func brew() {
        print("Steeping the tea")
    }

    override func addCondiments() {
        print("Adding lemon")
    }
}

class Coffee: Beverage {
    override func brew() {
        print("Dripping coffee through filter")
    }

    override func addCondiments() {
        print("Adding sugar and milk")
    }
}

// Step 3: Use the Template Method
let tea = Tea()
tea.prepareBeverage()
// Output:
// Boiling water
// Steeping the tea
// Pouring into cup
// Adding lemon

let coffee = Coffee()
coffee.prepareBeverage()
// Output:
// Boiling water
// Dripping coffee through filter
// Pouring into cup
// Adding sugar and milk

/*
Key Points
1. Template Method (prepareBeverage): Defines the algorithm's structure and calls abstract of overridable methods.
2. Abstract Methods (brew, addCondiments): Must be implemented by subclasses to provide specific behavior.
3. Common Methods (boilWater, pourInCup): Can be shared across subclasses and optionally overriden.

Advantages:
- Promotes code reuse by encapsulating common behavior in the base class.
- Allows subclasses to customize specific steps without modifying the overall algorithm.
- Ensures the algorithm's structure remains consistent.

When to Use:
- When you have an algorithm with invariant steps and variant steps.
- When you want to avoid code duplication by centralizing common behavior.
- When you want to enforce a specific order of steps in algorithm.

This pattern is widely used in frameworks and libraries where the overall process is fixed, but certain steps need to be customizable. 
*/