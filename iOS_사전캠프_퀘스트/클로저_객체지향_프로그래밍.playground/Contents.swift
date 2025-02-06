import UIKit

// Step 1: 클로저 구현하기
// 1. 간단한 클로저 구현
let numbers = [1, 2, 3, 4, 5]
//let doubled = numbers.map {(number: Int) -> Int in
//    return number * 2
//}
let doubled = numbers.map { $0 * 2 }
print(doubled)

// 2. 클로저 캡처 이해
var counter = 0
let incrementCounter = {
    counter += 1
}
incrementCounter()
incrementCounter()
print(counter) // 2



// Step 2: 객체지향 프로그래밍 구현하기
// 1. 동물 클래스 설계
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Some generic sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Bark!")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Meow!")
    }
}

// 2. 다형성 확인
var dog = Dog(name: "멍멍이")
var cat = Cat(name: "야옹이")
let animals: [Animal] = [dog, cat]
for animal in animals {
    animal.makeSound()
}
