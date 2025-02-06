// The state pattern is used to alter the behaviour of an object as its internal state changes. The pattern allows the class for an object to apparently change at run-time.

/*
DeepSeek
The State Design Pattern is a behavioral design pattern that allows an object to change its behavior when its internal state changes. This pattern is useful when an object needs to change its behavior dynamically based on its state, and when there are many conditional statements that depends on object's state.
*/

// Define the protocol for the state
protocol State {
    func handle(context: Context)    
}

// Define the concrete states
class ConcreteStateA: State {
    func handle(context: Context) {
        print("Handling state A")
        context.state = ConcreteStateB()
    }
}

class ConcreteStateB: State {
    func handle(context: Context) {
        print("Handling state B")
        context.state = ConcreteStateA()
    }
}

// Define the context class
class Context {
    var state: State

    init(state: State) {
        self.state = state
    }

    func request() {
        state.handle(context: self)
    }
}

// Usage
let context = Context(state: ConcreteStateA())
context.request() // Output: Handling state A
context.request() // Output: Handling state B
context.request() // Output: Handling state A

/*
In this example, the State protocol defines the interface for the states, and the ConcreteStateA and ConcreteStateB classes implement the State protocol. The Context class maintains a reference to the current state and delegates the handling of requests to the current state. When the state changes, the behavior of the Context object changes accordingly.

The State Design Pattern is useful when you need to manage complex state transitions and when you want to avoid using large conditional statements to handle different states. It also makes it easier to add new states and behaviors without modifying existing code.
*/




/*
Chat GPT
The State Design Pattern is a behavioral design pattern that allows an object to change its behavior based on its internal state. In Swift, this pattern is particularly useful when you have an object that can have different behaviors based on a finite set of states.
*/

/*
Key components of the State Pattern
1. Context: Maintains an instance of a state object and provides an interface to clients.
2. State Protocol: Defines methods that each state must implement.
3. concrete States: Implements behavior specific to a particular state.
*/

// State Protocol
protocol AudioPlayerState {
    func play()
    func pause()
    func stop()
}

// Context
class AudioPlayer {
    private var state: AudioPlayerState

    init(state: AudioPlayerState) {
        self.state = state
    }

    func setState(_ state: AudioPlayerState) {
        self.state = state
        print("State changed to \(type(of: state))")
    }

    func play() {
        state.play()
    }

    func pause() {
        state.pause()
    }

    func stop() {
        state.stop()
    }
}

// Concrete States
class PlayingState: AudioPlayerState {
    private var player: AudioPlayer

    init(player: AudioPlayer) {
        self.player = player
    }

    func play() {
        print("Already playing.")
    }

    func pause() {
        print("Pausing playback.")
        player.setState(PausedState(player: player))
    }

    func stop() {
        print("Stopping playback.")
        player.setState(StoppedState(player: player))
    }
}

class PausedState: AudioPlayerState {
    private var player: AudioPlayer

    init(player: AudioPlayer) {
        self.player = player
    }

    func play() {
        print("Resuming playback.")
        player.setState(PlayingState(player: player))
    }

    func pause() {
        print("Already paused.")
    }

    func stop() {
        print("Stopping playback.")
        player.setState(StoppedState(player: player))
    }
}

class StoppedState: AudioPlayerState {
    private var player: AudioPlayer

    init(player: AudioPlayer) {
        self.player = player
    }

    func play() {
        print("Starting playback.")
        player.setState(PlayingState(player: player))
    }
    
    func pause() {
        print("Cannot pause. The player is already stopped.")
    }
    
    func stop() {
        print("Already stopped.")
    }
}
