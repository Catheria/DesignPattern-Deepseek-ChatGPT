// The mediator pattern is used to reduce coupling between classes that communicate with each other. Instead of classes commnicating directly, and thus requiring knowledge of their implementation, the classes send messages via a mediator object.

// The Mediator Design Pattern is a behavioral design pattern used to reduce dependencies between components (colleagues) by having them communicate through a central mediator object instead of directly interacting with one another. This promotes loose coupling and makes the system more maintainable and flexible.

protocol ChatRoomMediator {
    func showMessage(user: User, message: String)
}

class ChatRoom: ChatRoomMediator {
    func showMessage(user: User, message: String) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        print("\(timestamp) [\(user.name)]: \(message)")
    }
}

class User {
    let name: String
    private var chatRoom: ChatRoomMediator

    init(name: String, chatRoom: ChatRoomMediator) {
        self.name = name
        self.chatRoom = chatRoom
    }

    func sendMessage(_ message: String) {
        chatRoom.showMessage(user: self, message: message)
    }
}

let chatRoom = ChatRoom()
let user1 = User(name: "Alice", chatRoom: chatRoom)
let user2 = User(name: "Bob", chatRoom: chatRoom)

user1.sendMessage("Hello, Bob!")
user2.sendMessage("Hey Alice, how are you?")

/*
How It Works
    - The ChatRoom class acts as the mediator, handling communication between users.
    - User objects send messages through the ChatRoom, which decouples the users from directly interacting with one another.
    - If additional behavior or logic is needed for communication, it can be encapsulated in the ChatRoom mediator.

Benefits
    - Loose Coupling: Components are decoupled from one another, promoting better maintainability.
    - Single Responsibility: The mediator centralizes commnication logic, reducing clutter in the colleague classes.
*/