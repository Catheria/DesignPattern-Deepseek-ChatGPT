// The Strategy Design Pattern is a behavioral design pattern that enables you to define a faily of algorithms, encapsulate each one, and make them interchangeable. It allows the algorithm to vary independently from the clients that use it. This pattern is particularly useful when you have multiple ways to perform a task and want to switch between them dynamically.

/* 
Key Components
    1. Strategy Procol/Interface: Defines the common interface for all concrete strategies.
    2. Concrete Strategies: Implment the strategy interface with specific algorithms.
    3. Context: Maintains a reference to a strategy object and allows the strategy to be changed at runtime.
*/

// DeepSeek
/*
Example in Swift
    Let’s say you are building a navigation app that can use different routing algorithms (e.g., driving, walking, cycling). You can use the Strategy Pattern to encapsulate each routing algorithm.
*/
protocol RoutingStrategy {
    func calculateRoute(from: String, to: String)
}

class DrivingStrategy: RoutingStrategy {
    func calculateRoute(from: String, to: String) {
        print("Calculating the fastest driving route from \(from) to \(to).")
    }
}

class WalkingStrategy: RoutingStrategy {
    func calculateRoute(from: String, to: String) {
        print("Calculating the most walking route from \(from) to \(to).")
    }
}

class CyclingStrategy: RoutingStrategy {
    func calculateRoute(from: String, to: String) {
        print("Calculating the safest cycling route from \(from) to \(to).")
    }
}

class Navigator {
    private var routingStrategy: RoutingStrategy

    init(routingStrategy: RoutingStrategy) {
        self.routingStrategy = routingStrategy
    }

    func setRoutingStrategy(_ routingStrategy: RoutingStrategy) {
        self.routingStrategy = routingStrategy
    }

    func navigate(from: String, to: String) {
        routingStrategy.calculateRoute(from: from, to: to)
    }
}

let navigator = Navigator(routingStrategy: DrivingStrategy())
navigator.navigate(from: "Home", to: "Office")

navigator.setRoutingStrategy(WalkingStrategy())
navigator.navigate(from: "Home", to: "Park") 

navigator.setRoutingStrategy(CyclingStrategy())
navigator.navigate(from: "Home", to: "Gym") 

/*
Explanation:
    1. RoutingStrategy Protocol: Defines the calculateRoute(from:to:) method that all concrete strategies must implement.
    2. Concrete Strategies: DrivingStrategy, WalkingStrategy, and CyclingStrategy implement the RoutingStrategy protocol with specific routing logic.
    3. Navigator (Context): Holds a reference to a RoutingStrategy and delegates the routing calculation to the current strategy. It also allows the strategy to be changed at runtime using the setRoutingStrategy method.
    4. Usage: The Navigator can switch between different routing strategies dynamically.

Benefits of the Strategy Pattern:
    1. Flexibility: You can easily switch between different algorithms at runtime.
    2. Separation of Concerns: The algorithm implementation is separated from the context that uses it.
    3. Extensibility: Adding new strategies is easy without modifying the context.

This pattern is widely used in scenarios where you need to dynamically change the behavior of an object, such as sorting algorithms, compression algorithms, or payment methods.
*/


// ChatGPT
protocol PaymentStrategy {
    func pay(amount: Double)
}

class CreditCardPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid \(amount) using Credit Card.")
    }
}

class PaypalPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid \(amount) using Paypal.")
    }
}

class PaymentContext {
    private var strategy: PaymentStrategy

    init(strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func setStrategy(strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func checkout(amount: Double) {
        strategy.pay(amount: amount)
    }
}

let paymentContext = PaymentContext(strategy: CreditCardPayment())
paymentContext.checkout(amount: 100.0)

paymentContext.setStrategy(strategy: PaypalPayment())
paymentContext.checkout(amount: 200.0)