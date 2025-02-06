// The Singleton design pattern is a creational pattern that ensures a class has only one instance and provides a global point of access to that instance. This is useful when exactly one object is needed to coordinate actions across the system, such as configuration manager, a shared resource, or a logging service.

final class Singleton { 
    static let shared = Singleton()

    private init() {
        print("Singleton instance created")
    }

    func performAction() {
        print("Action performed by Singleton instance")
    }
}

let instance1 = Singleton.shared()
instance1.performAction()

let instance2 = Singleton.shared()
print(instance1 === instance2) // true
// Since both instance1 and instance2 refer to the same instance, the comparison will return true.


/*
Key Points:
1. Thread Safety: In Swift, the static shared property is lazily initialized and thread-safe by default, so you don't need to worry about multiple threads creating separate instances.
2. Final Class: Marking the class as final prevents subclassing, which ensures the Singleton pattern is not broken.
3. Global Access: The shared property provides a global access point to the singleton instance.

When to Use Singleton:
    - When you need a single, shared instance of a class.
    - When you want to control access to a shared resource.
    - When you need a global point of access for coordination across the system.

When Not to Use Singleton
    - Overusing singletons can lead to tightly coupled code and make testing difficult.
    - If the object doesn't need to be shared globally, consider dependency injection or other patterns instead.
*/

/*
Common Use Cases
    - Network Managers (e.g., URLSessionManager)
    - Database Connections
    - Configuration Management
    - Analytics Logging
*/