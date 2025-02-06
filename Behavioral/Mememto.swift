// The memento pattern is used to capture the current state of an object and store it in such a manner that it can be restored at a later time without breaking the rules of encapsulation.

// The Memento Design Pattern is a behavioral design pattern that allows an object to capture and externalize its internal state without violating encapsulation, so that the object can be restored to this state later. It is particularly useful for implementing undo/redo functionality or saving and restoring an object's state.

/*
In Swift, the Memento pattern typically involves three key components:
    1. Originator: The object whose state needs to be saved or restored.
    2. Memento: A lightweight object that stores the internal state of the Originator.
    3. Caretaker: Manages and stores the Memento objects, but does not modify or inspect their contents.

Example: Implementing Mememto Pattern in Swift
Let's say we have a TextEditor class (Originator) that allows users to type text. We want to implement an undo feature using the Memento pattern.
*/

struct TextMemento {
    let text: String
}

class TextEditor {
    private var text: String = ""

    func setText(_ text: String) {
        self.text = text
    }

    func getText() -> String {
        text
    }

    // Creates a memento containing the current state
    func save() -> TextMemento {
        TextMemento(text: text)
    }

    // Restores the state from a memento
    func restore(from memento: TextMemento) {
        self.text = memento.text
    }
}

class Caretaker {
    private var mementos: [TextMemento] = []

    func saveMemento(_ memento: TextMemento) {
        mementos.append(memento)
    }

    func getMemento(at index: Int) -> TextMemento? {
        guard index >= 0 && index < mementos.count else { return nil }
        return mementos[index]
    }
}

let editor = TextEditor()
let careTaker = Caretaker()

// Edit text and save state
editor.setText("Hello, World!")
careTaker.saveMemento(editor.save())

// Edit text again
editor.setText("This is a new text.")
careTaker.saveMemento(editor.save())

// Undo to previous state
if let previousState = careTaker.getMemento(at: 0) {
    editor.restore(from: previousState)
    print(editor.getText()) // Output: "Hello, World!"
}

/*
Key Points:
1. Encapsulation: The Memento object ensures that the Originator's state is encapsulated and not exposed directly.
2. Undo/Redo: The Caretaker can store multiple mementos to support undo/redo functionality.
3. Flexibility: The Memento pattern decouples the state-saving logic from the Originator, making it easier to extend or modify.

This pattern is particularly useful in applications where you need to maintain a history of an object's state, such as text editors, games, or any application with undo/redo functionality.
*/