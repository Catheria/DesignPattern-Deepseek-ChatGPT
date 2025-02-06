// The observer pattern is used to allow an object to publish changes to its state. Other objects subscribe to be immediately notified of any changes.

// The Observer Design Pattern is a behavioral design pattern that allows an object (called the subject) to notify other objects (called observers) about changes in its state. This pattern is commonly used to implement distributed event-handling systems.

// Manual Implementation of the Observer Pattern in Swift
class Subject {
    private var observers: [Observer] = []

    var state: String = "" {
        didSet {
            notifyObservers()
        }
    }

    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }

    func removeObserver(_ observer: Observer) {
        observers = observers.filter { $0 !== observer }
    }

    private func notifyObservers() {
        for observer in observers {
            observer.update(state: state)
        }
    }
}

protocol Observer: AnyObject {
    func update(state: String)
}

class ConcreteObserver: Observer {
    private let name: String
    
    init(name: String) {
        self.name = name
    }

    func update(state: String) {
        print("\(name) observed new state: \(state)")
    }
}

let subject = Subject()
let observer1 = ConcreteObserver(name: "Observer 1")
let observer2 = ConcreteObserver(name: "Observer 2")
subject.addObserver(observer1)
subject.addObserver(observer2)

subject.state = "New State 1"
subject.state = "New State 2"