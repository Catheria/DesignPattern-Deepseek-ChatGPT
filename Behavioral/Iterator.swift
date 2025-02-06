// The Iterator Design Pattern is used to provide a standard interface for traversing a collection of items in an aggregate object without the need to understand its underlying structure.

// The Iterator Design Pattern is a behavioral design pattern that provides a way to access the elements of a collection sequentially without exposing its underlying representation.

/* Key Components
    1. IteratorProtocol: Defines the interface for accessing and traversing elements.
    2. Sequence: Defines a type that provides an iterator.
*/

struct Book {
    let title: String
}

class BookShelfIterator: IteratorProtocol {
    private let books: [Book]
    private var currentIndex = 0

    init(books: [Book]) {
        self.books = books
    }

    func next() -> Book? {
        guard currentIndex < books.count else { return nil }
        defer { currentIndex += 1 }
        return books[currentIndex]
    }
}

struct BookShelf: Sequence {
    private var books: [Book]

    init(books: [Book]) {
        self.books = books
    }

    // Sequence Protocol Requirement
    func makeIterator() -> BookShelfIterator {
        BookShelfIterator(books: books)
    }
}

let bookShelf = BookShelf(books: [
    Book(title: "The Catcher in the Rye"),
    Book(title: "To Kill a Mockingbird"),
    Book(title: "1984")
])

for book in bookShelf {
    print(book.title)
}

/*
How It Works
    - BookShelfIterator conforms to IteratorProtocol, managing traversal and returning the next element.
    - BookShelf conforms to Sequence and returns the custom iterator via makeIterator()
    - With this setup, the standard for-in loop can be used to iterate over BookShelf items.

Advantages
    - Decouples the traversal logic form the collection structure.
    - Provides a clean and consistent way to iterate over custom collections.
    - Easily intergrates with Swift's standard iteration mechanisms.

This approach makes your collections reusable, maintainable, and extensible.
*/