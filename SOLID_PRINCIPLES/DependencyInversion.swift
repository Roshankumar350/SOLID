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
