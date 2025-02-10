import UIKit

// Step 1: 비동기 프로그래밍 구현
// 1. 비동기 데이터 처리
DispatchQueue.global().async {
    for i in 1...5 {
        print(i)
    }
    DispatchQueue.main.async {
        print("UI 업데이트 완료")
    }
}

// 2. 네트워크 시뮬레이션
print("데이터 요청 시작")
DispatchQueue.global().async {
    sleep(3)
    DispatchQueue.main.async {
        print("데이터 로드 완료")
    }
}


// Step 2: 제네릭 구현
// 1. 제네릭 함수 작성
func swapValues<T> (_ a: inout T, _ b: inout T) {
    var temp = a
    a = b
    b = temp
}
var a = 10
var b = 20
swapValues(&a, &b)
print(a, b)

// 2. 제네릭 스택 구현
struct Stack<T> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.popLast()
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack.pop()) // 2
