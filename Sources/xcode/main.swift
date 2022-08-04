import Foundation
extension String {
    func charAt(characterIndex: Int) -> Self {
        return String(self[index(startIndex, offsetBy: characterIndex)])
    }
}

class Calculator: CustomStringConvertible {
    private var number: Double
    init(value: Double) {
        number = value
    }
    
    func add(x: Double) -> Calculator {
        number += x
        return self
    }
    
    func subtract(x: Double) -> Calculator {
        number -= x
        return self
    }
    
    func multiply(x: Double) -> Calculator {
        number *= x
        return self
    }
    
    func divide(x: Double) -> Calculator {
        number /= x
        return self
    }
    
    var description: String {
        return String(number)
    }
}

var application = true;
var calculator = Calculator(value: 0)

while (application) {
    let operations = CharacterSet(charactersIn: "+-*/")
    let input = readLine(strippingNewline: true)
    if (input != nil && input != "exit") {
        if (input?.rangeOfCharacter(from: operations) == nil) {
            calculator = Calculator(value: Double(input!)!)
        } else {
            let operation = input!.charAt(characterIndex: 0)
            let operand = Double(input![input!.index(after: input!.startIndex)...])!
            if (operation == "+") {
                calculator = calculator.add(x: operand)
            } else if (operation == "-") {
                calculator = calculator.subtract(x: operand)
            } else if (operation == "*") {
                calculator = calculator.multiply(x: operand)
            } else if (operation == "/") {
                calculator = calculator.divide(x: operand)
            }
        }
        print("Result is: \(calculator)")
    } else {
        application = false
    }
}

// todo: accept 2 numbers
// ability to undo/redo operation * (command pattern)

// implement primitive version of observable (after calculator)
