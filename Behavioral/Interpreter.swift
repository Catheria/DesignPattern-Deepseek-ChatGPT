// The interpreter pattern is used to evaluate sentences in a language.

// The Interpreter Design Pattern is a behavioral design pattern that defines a way to evaluate language grammar or expressions. It is particularly useful for designing a simple language or grammar and interpreting sentences in that language.

// In Swift, the Interpreter pattern can be implemented by defining a grammar, creating an abstract syntax tree (AST) for the language, and then interpreting the AST to evaluate expressions.

/*
Key Components of the Interpreter Pattern
    1. Abstract Expression: Defines an interface for interpreting expressions.
    2. Terminal Expression: Represents terminal symbols in the grammar (e.g., literals, variables).
    3. Non-Terminal Expression: Represents non-terminal symbols in the grammar (e.g., operations, combinations of expressions).
    4. Context: Contains global information used during interpretation.
    5. Client: Builds the abstract syntax tree (AST) and invokes the interpreter.
*/

// Abstract Expression
protocol Expression {
    func interpret(_ context: inout [String: Int]) -> Int
}

// Terminal Expression
class Number: Expression {
    private let value: Int

    init(_ value: Int) {
        self.value = value
    }

    func interpret(_ context: inout [String: Int]) -> Int {
        value
    }
}

class Variable: Expression {
    private let name: String
    
    init(_ name: String) {
        self.name = name
    }

    func interpret(_ context: inout [String: Int]) -> Int {
        context[name] ?? 0
    }
}

// Non-Terminal Expression
class Add: Expression {
    private let left: Expression
    private let right: Expression

    init(_ left: Expression, _ right: Expression) {
        self.left = left
        self.right = right
    }

    func interpret(_ context: inout [String: Int]) -> Int {
        left.interpret(&context) + right.interpret(&context)
    }
}

class Subtract: Expression {
    private let left: Expression
    private let right: Expression

    init(_ left: Expression, _ right: Expression) {
        self.left = left
        self.right = right
    }

    func interpret(_ context: inout [String: Int]) -> Int {
        left.interpret(&context) - right.interpret(&context)
    }
}

// Context
var context: [String: Int] = [:]
context["x"] = 10
context["y"] = 5

// Build the Abstract Syntax Tree (AST)
// x + y - 2
let expression: Expression = Subtract(
    Add(Variable("x"), Variable("y")),
    Number(2)
)

let result = expression.interpret(&context)
print("Result: \(result)")


/*
When to Use the Interpreter Pattern
    - When you need to implement a simple language or grammar.
    - When the grammar is relatively simple and stable.
    - When performance is not a critical concern (the Interpreter pattern can be slow for complex grammars).

Alternatives
    For more complex grammars, consider using a parser generator (e.g., ANTLR) or a compiler-compiler tool instead of manually implementing the Interpreter pattern.
*/