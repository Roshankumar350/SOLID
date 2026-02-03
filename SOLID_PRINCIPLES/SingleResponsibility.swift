//
//  SingleResponsibility.swift
//  SOLID_PRINCIPLES
//
//  Created by Roshan Sah on 25/12/25.
//

import Foundation

/* S: Single Responsibility Principle
 * A type should have only one responsibility.
 * APIFetcher has only one responsibile, and that is fetching network data
 */

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
