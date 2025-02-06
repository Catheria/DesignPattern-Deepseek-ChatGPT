// The monostate pattern is another way to achieve singularity. It works through a completely different mechanism, it enforces the behavior of singularity without imposing structural constraints. So in that case, monostate saves the state as static instead of the entire instance as a singleton.

// DeepSeek
/*
The Monostate design pattern is a variation of the Singleton pattern. While a Singleton ensures that only one instance of a class exists, the Monostate pattern allows multiple instances of a class to share the same state. This is achieved by storing the state in static or shared variables, so all instances of the class access the same data.
*/

class Monostate {
    // Shared state (static properties)
    private static var sharedState: [String: Any] = [:]

    // Accessors for the shared state
    var value: String {
        get {
            return Monostate.sharedState["value"] as? String ?? "Default"
        }
        set {
            Monostate.sharedState["value"] = newValue
        }
    }

    var count: Int {
        get {
            return Monostate.sharedState["count"] as? Int ?? 0
        }
        set {
            Monostate.sharedState["count"] = newValue
        }
    }
}

// Usage
let instance1 = Monostate()
let instance2 = Monostate()

instance1.value = "Heelo, Monostate!"
instance1.count = 42
print(instance2.value) // Output: "Hello, Monostate!"
print(instance2.count) // Output: 42

instance2.value = "Updated Value"
print(instance1.value) // Output: "Updated Value"

/*
Key Points:
1. Shared State: The state is stored in static properties (sharedState), which are shared across all instances of the class.
2. Multiple Instances: You can create multiple instances of the Monostate class, but they all share the same state.
3. Encapsulation: The state is encapsulated within the class, and access is controlled through computed properties.

When to Use Monostate:
- When you want ot allow mulitple instances of a class but ensure they all share the same state.
- When you want to avoid the strict restrictions of a Singleton (e.g., global access to a single instance).

Avantages:
- Flexibility: You can create multiple instances, which can be useful in certain scenarios.
- Encapsulation: The shared state is encapsulated within the class.

Disadvantages:
- Global State: Like Singleton, Monostate introduces global state, which can lead to tight coupling and make testing harder.
- Thread Safety: If multiple threads access the shared state concurrently, you may need to implement synchronization mechanisms (e.g., using DispatchQueue or @Atomic).

*/

// Thread-Safe Monostate
class ThreadSafeMonostate {
    private static var sharedState: [String: Any] = [:]
    private static let queue = DispatchQueue(label: "com.monostate.queue", attributes: .concurrent)

    var value: String {
        get {
            return ThreadSafeMonostate.queue.sync {
                ThreadSafeMonostate.sharedState["value"] as? String ?? "Default"
            }
        }
        set {
            ThreadSafeMonostate.queue.async(flags: .barrier) {
                ThreadSafeMonostate.sharedState["value"] = newValue
            }
        }
    }

    var count: Int {
        get {
            return ThreadSafeMonostate.queue.sync {
                ThreadSafeMonostate.sharedState["count"] as? Int ?? 0
            }
        }
        set {
            ThreadSafeMonostate.queue.async(flags: .barrier) {
                ThreadSafeMonostate.sharedState["count"] = newValue
            }
        }
    }
}