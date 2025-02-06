// The facade pattern is used to define a simplified interface to a more complex subsystem.

// The Facade Design Pattern is a structural design pattern that provides a simplified interface to a complex system of classes, libraries, or frameworks. It hides the complexities of the underlying system and provides a unified interface to the client, making it easier to use. It acts as a 'facade' or a front-facing interface.

/*
Key Benefits of the Facade Pattern:
1. Simplifies the interface to a complex system.
2. Reduces coupling between subsystems and clients.
3. Improves code readbility and maintainability by providing a unified entry point.
4. Makes it easier to swap out subsystems without affecting clients.
*/

/*
Example: 
Imagine you're building a home theater system. The subsystems include components like a DVD Player, Amplifier, Projector, and Lights. The user doesn't need to interact with each component individually. Instead, a HomeTheaterFAcade provides a simplified interface.
*/

// Subsystem
class DVDPlayer {
    func on() {
        print("DVD Player is on.")
    }

    func play(movie: String) {
        print("Playing movie: \(movie).")
    }

    func off() {
        print("DVD Player is off.")
    }
}

class Amplifier {
    func on() {
        print("Amplifier is on.")
    }

    func setVolumn(_ level: Int) {
        print("Setting volumn to \(level).")
    }

    func off() {
        print("Amplifier is off.")
    }
}

class Projector {
    func on() {
        print("Projector is on.")
    }

    func setWideScreenMode() {
        print("Projector is set to widescreen mode.")
    }

    func off() {
        print("Projector is off.")
    }
}

class Lights {
    func dim(to level: Int) {
        print("Lights dimmed to \(level)%.")
    }
}

// Facade: Home Theater
class HomeTheaterFacade {
    private let dvdPlayer: DVDPlayer
    private let amplifier: Amplifier
    private let projector: Projector
    private let lights: Lights

    init(dvdPlayer: DVDPlayer, amplifier: Amplifier, projector: Projector, lights: Lights) {
        self.dvdPlayer = dvdPlayer
        self.amplifier = amplifier
        self.projector = projector
        self.lights = lights
    }

    func watchMovie(_ movie: String) {
        print("\nStarting movie experience...\n")
        lights.dim(to: 10)
        projector.on()
        projector.setWideScreenMode()
        amplifier.on()
        amplifier.setVolumn(7)
        dvdPlayer.on()
        dvdPlayer.play(movie: movie)
    }

    func endMovie() {
        print("\nShutting down movie experience...\n")
        dvdPlayer.off()
        amplifier.off()
        projector.off()
        lights.dim(to: 100)
    }
}

// Client Code
let dvdPlayer = DVDPlayer()
let amplifier = Amplifier()
let projector = Projector()
let lights = Lights()

let homeTheater = HomeTheaterFacade(dvdPlayer: dvdPlayer, amplifier: amplifier, projector: projector, lights, lights)
homeTheater.watchMovie("The Matrix")
homeTheater.endMovie()

/*
Explanation
1. Subsystems (DVDPlayer, Amplifier, Projector, Lights) represent the individual components of the system.
2. Facade (HomeTheaterFacade) provides a unified interface to the client for using the subsystems.
3. The client code interacts only with the HomeTheaterFacade, simplifying its interaction with the home theater system.
This pattern keeps the client code clean and abstracted from the complexities of the underlying systems.
*/

/*
When to Use the Facade Pattern
- When you want to provide a simple interface to a complex system.
- When you need to reduce dependencies between the client and subsystems.
- When you want to layer your system and provide a clear entry point for specific functionalities.
This pattern is widely used in frameworks, libraries, and APIs to make them more user-friendly.
*/