// The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object. Protection proxy is restricting access.

// ChatGPT 
/*
The Protection Proxy Design Pattern is a structural design pattern where a proxy controls access to an object, typically by applying security checks or access control rules before allowing the actual object to handle the request.

When to Use
- You need to control access to sensitive or restricted resources.
- You want to validate user permissions before performing operations on an object.
- Reducing the exposure of critical resources to unauthorized interactions.
*/

protocol File {
    func read() -> String
}

class RealFile: File {
    private var fileName: String

    init(fileName: String) {
        self.fileName = fileName
    }

    func read() -> String {
        "Reading contents of \(fileName)"
    }
}

class ProtectedFileProxy: File {
    private let realFile: RealFile
    private let userRole: String

    init(fileName: String, userRole: String) {
        self.realFile = RealFile(fileName: fileName)
        self.userRole = userRole
    }

    func read() -> String {
        if userRole == "Admin" {
            return realFile.read()
        } else {
            return "Access Denied: Insufficient Permissions"
        }
    }
}

let adminFile = ProtectedFileProxy(fileName: "SensitiveData.txt", userRole: "Admin")
print(adminFile.read()) // Output: Reading contents of SensitiveData.txt

let guestFile = ProtectedFileProxy(fileName: "SensitiveData.txt", userRole: "Guest")
print(guestFile.read()) // Output: Access Denied: Insufficient Permissions

/*
Key Points
- RealFile is the concrete implementation that performs the actual file read operation.
- ProtectedFileProxy acts as a proxy and controls access based on user's role.
- Encapsulation of Access Logic: The proxy cleanly encapsulates access control logic, keeping it separate from the real object.

This pattern can easily be extended for more sophisticated security mechanisms, such as authentication tokens or logging access attemps.
*/


// DeepSeek
// The Protection Proxy design pattern is a structural pattern that controls access to an object. It acts as a surrogate or placeholder for another object, allowing you to add additional behavior (such as access control) when accessing the object. This is useful in scenarios where you want to restrict or manage access to sensitive or expensive-to-create objects.

/*
Example: Protection Proxy for a Sensitive Document
Let's say you have a Document class that represents a sensitive document, and you want to restrict access to it based on user roles.
*/

protocol Document {
    func read() -> String
    func write(content: String)
}

class SensitiveDocument: Document {
    private var content: String

    init(content: String) {
        self.content = content
    }

    func read() -> String {
        content
    }

    func write(content: String) {
        self.content = content
        print("Document updated: \(content)")
    }
}

class DocumentProxy: Document {
    private let realDocument: SensitiveDocument
    private let userRole: String

    init(content: String, userRole: String) {
        self.realDocument = SensitiveDocument(content: content)
        self.userRole = userRole
    }

    func read() -> String {
        realDocument.read()
    }

    func write(content: String) {
        // Restrict write access to admins only
        if userRole == "admin" {
            realDocument.write(content: content)
        } else {
            print("Access denied: You do not have permission to write to this document.")
        }
    }
}

// Usage
let adminDocument = DocumentProxy(content: "Top Secret", userRole: "admin")
let userDocument = DocumentProxy(content: "Confidential", userRole: "user")

// Admin can read and write
print("Admin reads: \(adminDocument.read())")
adminDocument.write(content: "New Top Secret Content")

// User can read but cannot write
print("User reads: \(userDocument.read())")
userDocument.write(content: "Attempted Unauthorized Edit")