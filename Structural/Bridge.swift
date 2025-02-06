// The Bridge Design Pattern is a structural pattern that decouples an abstraction from its implementation, allowing them to vary independently. This pattern is useful when you want to separate a class's interface (abstraction) from its implementation so that both can evolve independently.

/* 
Key concepts of the Bridge Pattern:
- Abstraction: Defines the high-level control logic. It contains a reference to the implementation.
- Implementation: Defines the platform-specific implementation details. It is an interface or protocol that concrete implementations adhere to.
- Refined Abstraction: Extends the abstraction further and utilizes the implementation in specific ways
- Concrete Implementaiton: Provides the actual implementation for the abstraction.
*/

/*
Example: Remote Control and TV
This example demonstrates the separation of different types of remote controls and televisions.
*/

protocol TV {
    func turnOn() 
    func turnOff()
    func setChannel(_ channel: Int)
}

class SamsungTV: TV {
    func turnOn() {
        print("Samsung TV is now ON")
    }

    func turnOff() {
        print("Samsung TV is now OFF")
    }

    func setChannel(_ channel: Int) {
        print("Samsung TV: Switched to channel \(channel)")
    }
}

class SonyTV: TV {
    func turnOn() {
        print("Sony TV is now ON")
    }

    func turnOff() {
        print("Sony TV is now OFF")
    }

    func setChannel(_ channel: Int) {
        print("Sony TV: Switched to channel \(channel)")
    }
}

// Abstraction
class RemoteControl {
    let tv: TV

    init(tv: TV) {
        self.tv = tv
    }

    func turnOn() {
        tv.turnOn()
    }

    func turnOff() {
        tv.turnOff
    }
}

// Refined Abstraction
class AdvancedRemoteControl: RemoteControl {
    func setChannel(_ channel: Int) {
        tv.setChannel(channel)
    }
}

// Usage
let samsungTV = SamsungTV()
let sonyTV = SonyTV()

let simpleRemote = RemoteControl(tv: samsungTV)
simpleRemote.turnOn()
simpleRemote.turnOff()

let advancedRemote = AdvancedRemoteControl(tv: sonyTV)
advancedRemote.turnOn()
advancedRemote.setChannel(5)
advancedRemote.turnOff()

/*
How It works:
1. Abstraction (RemoteControl) uses a reference to an Implementor (TV).
2. Concrete Implementations (SamsungTV and SonyTV) handle platform-specific behaviors.
3. The Bridge pattern allows for flexibility in adding new remote control types on new TV types without modifying existing code.

Key Benefits of the Bridge Pattern
1. Decoupling: The abstraction and implementation can vary independently.
2. Extensibility: You can add new abstractions or implementations without affecting the existing code.
3. Single Responsibility Principle: Each class has a single responsibility, making the code easier to maintain.

When to Use the Bridge Pattern
- When you want to avoid a permanent binding between an abstraction and its implementation.
- When both the abstraction and implementation need to be extended independently.
- When you want to hide the implementation details from the client.

This pattern is particularly useful in large systems where you need to manage multiple dimensions of variability.
*/

