import UIKit

// Step 1: 자료구조 구현
// 1. 큐(Queue) 구현하기
struct Queue {
    private var elements: [Int] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func enqueue(_ element: Int) {
        elements.append(element)
    }
    
    mutating func dequeue() -> Int? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    func printIsEmpty() {
        print(isEmpty)
    }
}

var queue = Queue()
queue.enqueue(1)
queue.enqueue(2)
queue.printIsEmpty() // false
queue.dequeue()
queue.printIsEmpty() // false
queue.dequeue()
queue.printIsEmpty() // true


// 2. 스택(Stack) 구현하기
struct Stack {
    private var elements: [String] = []
    
    mutating func push(_ element: String) {
        elements.append(element)
    }
    
    mutating func pop() -> String? {
        elements.popLast()
    }
    
    func peek() -> String? {
        return elements.last
    }
}

var stack = Stack()
stack.push("a")
stack.push("b")
print(stack.peek() ?? "") // b
print(stack.pop() ?? "") // b
print(stack.peek() ?? "") // a
print(stack.pop() ?? "") // a
print(stack.peek() ?? "") // ""


// Step 2: ARC와 순환 참조 해결
// 1. 순환 참조 문제 구현
//class Person {
//    var name: String
//    var pet: Pet?
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    deinit {
//        print("\(name) 메모리 해제")
//    }
//}
//
//class Pet {
//    var owner: Person?
//    
//    deinit {
//        print("펫 메모리 해제")
//    }
//}
//
//var person: Person? = Person(name: "홍길동")
//var pet: Pet? = Pet()
//
//person?.pet = pet
//pet?.owner = person
//
//person = nil 
//pet = nil

// 2. 순환 참조 해결
class Person {
    var name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Pet {
    weak var owner: Person?
    
    deinit {
        print("펫 메모리 해제")
    }
}

var person: Person? = Person(name: "홍길동")
var pet: Pet? = Pet()

person?.pet = pet
pet?.owner = person

person = nil // 홍길동 메모리 해제
pet = nil // 펫 메모리 해제
