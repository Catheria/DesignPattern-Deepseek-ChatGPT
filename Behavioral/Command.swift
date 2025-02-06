// The command pattern is used to express a request, including the call to be made and all of its required parameters, in a command object. The command may then be executed immediately or held for later use.

// The command Design Pattern is a behavioral design pattern that encapsulates a request an object, allowing you to parameterize objects with different requests, queue or log requests, and support undoable operations. It is particularly useful when you want to decouple the object that invokes an operation from the one that knows how to perform it.

/* 
In Swift, implementing the Command Pattern typically involes four main components:
    1. Command Protocol: Defines a common interface for all commands.
    2. Concrete Command: Implements the command interface and defines the behavior for executing specific operations.
    3. Recevier: The object that performs the actual operations.
    4. Invoker: The object that keeps a reference to the command and executes it. 
*/

protocol Command {
    func execute()
    func undo() // Optional: Add for undo functionality   
}

// Receiver
class Light {
    func turnOn() {
        print("The light is ON")
        
    }

    func turnOff() {
        print("The light is OFF")
    }
}

// Concrete Command
class TurnOnLightCommand: Command {
    private let light: Light

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.turnOn()
    }

    func undo() {
        light.turnOff()
    }
}

class TurnOffLightCommand: Command {
    private let light: Light

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.turnOff()
    }

    func undo() {
        light.turnOn()
    }
}

// Invoker
class RemoteControl {
    private var command: Command

    func setCommand(_ command: Command) {
        self.command = command
    }

    func pressButton() {
        command?.execute()
    }

    func pressUndo() {
        command?.undo()
    }
}

// Create the receiver
let livingRoomLight = Light()

// Create commands
let turnOnCommand = TurnOnLightCommand(light: livingRoomLight)
let turnOffCommand = TurnOffLightCommand(light: livingRoomLight)

// Create the invoker
let remote = RemoteControl()

// Turn the light ON
remote.setCommand(turnOnCommand)
remote.pressButton()

// Turn the light OFF
remote.setCommand(turnOffCommand)
remote.pressButton()

// Undo the last command
remote.pressUndo()

/*
Key Benefits of Using the Command Pattern:
    1. Decoupling: It separates the sender (invoker) and receiver.
    2. Extensibility: Adding new commands is straightforward.
    3. Undo/Redo: Enables storing a history of commands for undo/redo functionality.
    4. Macro Commands: Allows combining multiple commands into one.

This pattern is particularly useful in scenarios like GUI applications (e.g., buttons triggering actions), transaction systems, or undoable operations in text editors.
*/