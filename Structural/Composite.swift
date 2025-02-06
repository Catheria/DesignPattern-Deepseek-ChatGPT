// The composite pattern is used to create hierarchical, recursive tree structures of related objects where any element of the structure may be accessed and utilised in a standard manner.

/*
The Composite Design Pattern is a structural pattern that allows you to treat individual objects uniformly. It is particularly useful when you have a tree-like structure where you want to perform operations on both individual components and groups of components in the same way.
*/

// Ex. 1
// Component
protocol FileSystemItem {
    var name: String { get }
    func display(indentation: String)
}

// Leaf 
class File: FileSystemItem {
    let name: String 

    init(name: String) {
        self.name = name
    }

    func display(indentation: String) {
        print("\(indentation)- \(name)")
    }
}

// Composite
class Folder: FileSystemItem {
    let name: String
    private var items: [FileSystemItem] = []

    init(name: String) {
        self.name = name
    }

    func add(item: FileSystemItem) {
        items.append(item)
    }

    func remove(item: FileSystemItem) {
        items.removeAll { $0.name == item.name }
    }

    func display(indentation: String = "") {
        print("\(indentation)+ \(name)")
        for item in items {
            item.display(indentation: indentation + "  ")
        }
    }
}

// Usage
let rootFolder = Folder(name: "Root")

let documentsFolder = Folder(name: "Documents")
documentsFolder.add(item: File(name: "Resume.pdf"))
documentsFolder.add(item: File(name: "CoverLetter.pdf"))

let picturesFoloder = Folder(name: "Pictures")
picturesFoloder.add(item: File(name: "Vacation.png"))
picturesFoloder.add(item: File(name: "Family.jpg"))

rootFolder.add(item: documentsFolder)
rootFolder.add(item: picturesFoloder)

rootFolder.display()

// Ex. 2
// Component
protocol Shape {
    func draw(fillColor: String)
}

// Leafs
final class Square: Shape {
    func draw(fillColor: String) {
        print("Drawing a Square with color \(fillColor)")
    }
}

final class Circle: Shape {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}

final class Whiteboard: Shape {
    private lazy var shapes = [Shape]()

    init(_ shapes: Shape...) {
        self.shapes = shapes
    }

    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}

// Usage
var whiteboard = Whiteboard(Circle(), Square())
whiteboard.draw(fillColor: "Red")

/*
Explanation
- Component Protocol: Defines common operations for both leaf and composite objects.
- Leaf Class: Represents individual objects that do not contain other components.
- Composite Class: Contains and manages child components (both leaf and composite).
- Client: Works uniformly with both individual files and folders.
*/

/*
Key Benefits of the Composite Pattern:
1. Uniformity: Clients can treat individual objects and compositions uniformly.
2. Flexibility: Easily add new types of components without changing the client code.
3. Hierarchy Management: Simplifies working with tree-like structures.
*/