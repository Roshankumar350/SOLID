//
//  DependencyInversion.swift
//  SOLID_PRINCIPLES
//
//  Created by Roshan Sah on 26/12/25.
//

import Foundation

/* D: Dependency inversion principle
 * Depend on abstractions, not concretions
 * Instead of depending on a concrete `APIFetcher`, It depend on the Fetcher abstraction.
 */

/* Here Fetcing works over concerete type named `ConcreteTypeAPIFetcher`
 * So Ideally it should inverse its dependency to some abstraction
 */
// This is voilation of Dependency inversion principle
class ConcreteTypeAPIFetcher<T: Decodable> {
    func fetch(completion: @escaping (T?) -> Void) {
        // Do some realistic work
        sleep(2)
        do {
            let decoded = try JSONDecoder().decode(T.self, from: Data())
            completion(decoded)
        } catch {
            completion(nil)
        }
    }
}

/* This is correct implementation thats define in `SingleResponsibility.swift` file
 
 class APIFetcher<T: Decodable>: Fetcher {
     func fetch(completion: @escaping (T?) -> Void) {
         // Do some realistic work
         sleep(2)
         do {
             let decoded = try JSONDecoder().decode(T.self, from: Data())
             completion(decoded)
         } catch {
             completion(nil)
         }
     }
 }
 
 */


/* Another way by using dependency injection
   Example: dependency injection using the `Fetcher` abstraction.
   Consumer depends on the `Fetcher` protocol (abstraction), not a concrete type.
*/
class Consumer<F: Fetcher> where F.T == SomeModel {
    private let fetcher: F

    init(fetcher: F) {
        self.fetcher = fetcher
    }

    func load() {
        fetcher.fetch { model in
            print("completion chain called")
        }
    }
}

// Usage example (in real app this would be injected from outside)
// Just wrapped this two function in doSomething() to stop compiler complaining error
func doSomething() {
    let consumer = Consumer(fetcher: APIFetcher<SomeModel>())
    consumer.load()
}
