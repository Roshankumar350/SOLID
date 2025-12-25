//
//  LiskovSubstitution.swift
//  SOLID_PRINCIPLES
//
//  Created by Roshan Sah on 26/12/25.
//

import Foundation

/* L: Liskov Substitution Principle
 * Subtypes or any confiming type must be substitutable for their base or confiming type
 */

func fetchData<F: Fetcher>(from fetcher: F) {
    fetcher.fetch { (decodableType) in
        print("completion chain called")
    }
}


let apiFetcher = APIFetcher<SomeModel>()
let localFileFetcher = LocalFileFetcher<SomeModel>()

// Just wrapped this two function in show() to stop compiler complaining error
func show() {
    fetchData(from: apiFetcher)
    fetchData(from: localFileFetcher)
}

