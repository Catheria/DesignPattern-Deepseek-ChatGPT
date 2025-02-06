// The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object. Virtual proxy is used for loading object on demand.

// The Virtual Proxy Design Pattern is a structural design pattern used to control access to an object by creating a placeholder that performs specific actions (like lazy initialization or security checks) before delegating to the actual object.

// In Swift, the Virtual Proxy is useful when the real object is resource-intensive to create or load, and you want to delay that initialization until it's absolutely necessary.

/*
Example: Image Loading using Virtual Proxy
Let's implement a simple example where an image loader uses a proxy to defer loading until the image is actually required.
*/

// Protocol that both the Real Image and Proxy conform to
protocol Image {
    func display()
}

// Real Image class which simulates a time-consuming image loading process
class RealImage: Image {
    private var filename: String

    init(filename: String) {
        self.filename = filename
        loadFromDisk(filename: filename)
    }

    private func loadFromDisk(filename: String) {
        print("Loading image from disk: \(filename)")
        // Simulate a delay for image loading
        sleep(2)
    }

    func display() {
        print("Displaying image: \(filename)")
    }
}

// Proxy Image class to delay the loading of the real image
class ProxyImage: Image {
    private var filename: String
    private var realImage: RealImage?

    init(filename: String) {
        self.filename = filename
    }

    func display() {
        if realImage == nil {
            realImage = RealImage(filename: filename)
        }
        realImage?.display()
    }
}

print("Creating proxy image instance...")
let image: Image = ProxyImage(filename: "photo.jpg")
print("Image created, but not loaded yet.")
print("Now displaying the image...")
image.display() // Triggers the actual loading 

/*
Explanation
1. The ProxyImage acts as a placeholder for the RealImage.
2. The RealImage is only created and loaded when the display() method is called on the proxy.
3. This allows for lazy initialization, improving performance be deferring the expensive operation until it's actually needed.
*/

/*
Benefits of Virtual Proxy
- Lazy Initialization: The real object is created only when needed.
- Access Control: The proxy can add additional logic (e.g., permissions) before accessing the real object. Provides control over when and how the real object is accessed.
- Performance Optimization: Expensive operations are deferred until necessary.
- Resource Management: Useful when object creation is expensive or resource-intensive.

This pattern is particularly useful in scenarios where resource-intensive objects need to be managed efficiently.
It is hightly effective in cases like image rendering, remote service access, or large dataset processing.
*/
