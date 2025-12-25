//
//  Open–Closed.swift
//  SOLID_PRINCIPLES
//
//  Created by Roshan Sah on 25/12/25.
//

import Foundation

/* O: Open–Closed Principle
 * Open for extension, closed for modification.
 * `Fetcher` is open for extension but is closed for modification (we are not modifying signature)
 * - Like `LocalFileFetcher` is responsibile for `fetching` Local data at the same time in  `APIFetcher` was responsibile for `fetching` network data. So here we are open for extension and closed for modification.
 */

class LocalFileFetcher<T: Decodable>: Fetcher {
    func fetch(completion: @escaping (T?) -> Void) {
        // Do some realistic work
        sleep(5)
        do {
            let decoded = try JSONDecoder().decode(T.self, from: Data())
            completion(decoded)
        } catch {
            completion(nil)
        }
    }
}
