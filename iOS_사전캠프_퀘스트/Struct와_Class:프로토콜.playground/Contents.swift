import UIKit

// 1. Struct 구현하기
struct User {
    var name: String
    var age: Int
}

var user1 = User(name: "철수", age: 10)
var user2 = user1

user1.name = "김철수"
print(user1.name) // 김철수
print(user2.name) // 철수

user2.name = "박철수"
print(user1.name) // 김철수
print(user2.name) // 박철수


// 2. Class 사용 예제
class UserClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var user3 = UserClass(name: "영희", age: 10)
var user4 = user3

user3.name = "안영희"
print(user3.name) // 안영희
print(user4.name) // 안영희


// 3. Greetable 프로토콜
protocol Greetable {
    func greet()
}

struct Person: Greetable {
    var name: String
    
    func greet() {
        print("안녕, 난 \(name).")
    }
}

class Robot: Greetable {
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func greet() {
        print("안녕하세요, 저는 \(id)입니다.")
    }
}

var person = Person(name: "철수")
person.greet() // 안녕, 난 철수.
var robot = Robot(id: "R2-D2")
robot.greet() // 안녕하세요, 저는 R2-D2입니다.


// 4.프로토콜 확장(Extension)
extension Greetable {
    func greet() {
        print("Hello!")
    }
}

struct Alien: Greetable {
    func greet() {
        print("반갑습니다.")
    }
}

var alien = Alien()
alien.greet() // 반갑습니다.
