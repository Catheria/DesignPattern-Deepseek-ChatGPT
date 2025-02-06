// The Adapter Design Pattern allows incompatible classes or objects to work together by converting the interface of one class into an interface expected by the client. This pattern acts as a bridge between two interfaces, promoting better code flexibility and maintainability.

/*
Use Cases
- When you need to use a class whose interface does not match the required one.
- When you want to create resuable libraries with flexible APIs.
- Adapting legacy code to a modern system.
*/

/*
UML Structure
- Client: Uses the Target interface.
- Target: Defines the interface expected by the Client.
- Adaptee: The existing component with an incompatible interface.
- Adapter: Converts the interface of the Adaptee to the Target interface.
*/

// Target: Defines the expected interface
protocol Target {
    func request() -> String
}

// Adaptee: The existing class with an incompatible interface
class Adaptee {
    func specificRequest() -> String {
        "Specific request from Adaptee"
    }
}

// Adapter: Makes the Adaptee compatible with the Target
class Adapter: Target {
    private let adaptee: Adaptee

    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }

    func request() -> String {
        "Adapter: " + adaptee.specificRequest()
    }
}

// Client code
let adaptee = Adaptee()
print("Adaptee Output: \(adaptee.specificRequest())")

let adapter = Adapter(adaptee: adaptee)
print("Client Output using Adapter: \(adapter.request())")

/*
Key Points
1. Encapsulation: The adapter encapsulates the logic required to adapt between interfaces.
2. Single Responsibility: The adapter's solo job is adapting interfaces without altering existing code.
3. Loose Coupling: Client code becomes decoupled from specific implementation details.
*/

/*
when to Use in iOS Development
- Adapting a third-party library's API to your app's architecture.
- Bridging between different system versions.
- Integrating legacy code with a modern app structure.
*/