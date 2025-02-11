import UIKit
import Combine

//// Step 1: Combine 기본 구현
//// 1. 간단한 Publisher와 Subscriber 만들기
//let numbers = [1, 2, 3, 4, 5].publisher
//
//let subscription = numbers
//    .map { $0 * 2 }
//    .sink { print($0) }
//
//// 2. Just Publisher 사용
//let just = Just(100)
//just.sink { completion in
//    print("Just Completion: \(completion)")
//} receiveValue: { number in
//    var result = number + 50
//    print("Just Value: \(result)")
//}
//
//
//// Step 2: Combine로 비동기 데이터 처리
//// 1. URLSession과 Combine 사용
//struct Todo: Codable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let completed: Bool
//}
//
//let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
//
//var cancellables = Set<AnyCancellable>()
//
//URLSession.shared
//    .dataTaskPublisher(for: url)
//    .tryMap() { element -> Data in
//        guard let httpResponse = element.response as? HTTPURLResponse,
//            httpResponse.statusCode == 200 else {
//                throw URLError(.badServerResponse)
//            }
//        return element.data
//        }
//    .decode(type: Todo.self, decoder: JSONDecoder())
//    .sink { completion in
//        print("Completion: \(completion)")
//    } receiveValue: { todo in
//        print("title 값 출력: \(todo.title)")
//    }
//    .store(in: &cancellables)

// 2. Time Publisher 사용
let publisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

var counter = 0
let subscripton = publisher
    .map { data in
        counter += 1 }
    .sink(receiveValue: { value in
        print("Timer: \(value)")
        if counter == 3 {
            publisher.upstream.connect().cancel()
        }
    })
