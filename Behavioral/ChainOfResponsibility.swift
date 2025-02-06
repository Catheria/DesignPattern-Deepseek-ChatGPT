// The Chain of Responsibility design pattern is a behavioral pattern that allows multiple objects to handle a request in a chain without coupling the sender of the request to its receiver. Each object in the chain decides whether to process the request or pass it along to the next handler.

protocol Handler {
    var next: Handler? { get set }
    func handleRequest(_ message: String, level: LogLevel)
}

enum LogLevel {
    case debug
    case info
    case error
}

class DebugHandler: Handler {
    var next: Handler?

    func handleRequest(_ message: String, level: LogLevel) {
        if level == .debug {
            print("Debug: \(message)")
        } else {
            next?.handleRequest(message, level: level)
        }
    }
}

class InfoHandler: Handler {
    var next: Handler?

    func handleRequest(_ message: String, level: LogLevel) {
        if level == .info {
            print("Info: \(message)")
        } else {
            next?.handleRequest(message, level: level)
        }
    }
}

class ErrorHandler: Handler {
    var next: Handler?

    func handleRequest(_ message: String, level: LogLevel) {
        if level == .error {
            print("Error: \(message)")
        } else {
            next?.handleRequest(message, level: level)
        }
    }
}

let debugHandler = DebugHandler()
let infoHandler = InfoHandler()
let errorHandler = ErrorHandler()

debugHandler.next = inforHandler
infoHandler.next = errorHandler

func logMessage(_ message: String, level: LogLevel) {
    debugHandler.handleRequest(message, level: level)
}

logMessage("This is a debug message", level: .debug)
logMessage("This is an info message", level: .info)
logMessage("This is an error message", level: .error)

/*
Key Points
    1. Each handler checks if it can process the request; if not, it forwards the request to the next handler.
    2. The chain decouples the sender and receiver, allowing flexibility in handling requests dynamically.
    3. The pattern can be easily extended by adding new handlers without altering existing code.

This approach is great for scenarios like logging, request validation, or approval workflows.

*/