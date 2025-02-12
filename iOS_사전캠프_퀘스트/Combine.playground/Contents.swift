import UIKit
import Combine

// Step 1: Combine 기본 구현
// 1. 간단한 Publisher와 Subscriber 만들기
let numbers = [1, 2, 3, 4, 5].publisher

let subscription = numbers
    .map { $0 * 2 }
    .sink { print($0) } // 2, 4, 6, 8, 10

// 2. Just Publisher 사용
let just = Just(100)
just.sink { completion in
    print("Just Completion: \(completion)")
} receiveValue: { number in
    var result = number + 50
    print("Just Value: \(result)")
}
// 실행 결과
//Just Value: 150
//Just Completion: finished


// Step 2: Combine로 비동기 데이터 처리
// 1. URLSession과 Combine 사용
struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!

var cancellables = Set<AnyCancellable>()

URLSession.shared
    .dataTaskPublisher(for: url)
    .tryMap() { element -> Data in
        guard let httpResponse = element.response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
        return element.data
        }
    .decode(type: Todo.self, decoder: JSONDecoder())
    .sink { completion in
        print("Completion: \(completion)")
    } receiveValue: { todo in
        print("title 값 출력: \(todo.title)")
    }
    .store(in: &cancellables)
// 실행 결과
//title 값 출력: delectus aut autem
//Completion: finished

// 2. Time Publisher 사용
let publisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

var counter = 0
let subscripton = publisher
    .sink(receiveValue: { value in
        counter += 1
        print("Timer: \(value)")
        if counter == 5 {
            publisher.upstream.connect().cancel()
        }
    })
// 실행 결과
//Timer: 2025-02-12 05:32:46 +0000
//Timer: 2025-02-12 05:32:47 +0000
//Timer: 2025-02-12 05:32:48 +0000
//Timer: 2025-02-12 05:32:49 +0000
//Timer: 2025-02-12 05:32:50 +0000
