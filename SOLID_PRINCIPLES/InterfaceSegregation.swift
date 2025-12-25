//
//  InterfaceSegregation.swift
//  SOLID_PRINCIPLES
//
//  Created by Roshan Sah on 26/12/25.
//

import Foundation

/* I: Interface segregation principle
 * Interface `Fetcher` is fetcing data, Not uploading
 */

protocol Fetcher {
    associatedtype T: Decodable
    func fetch(completion: @escaping ((T?) -> Void))
}


/*
 * Suppose we want to upload data then we should create another interface say `Uploadable`
 */

protocol Uploadable {
    associatedtype T: Encodable
    func upload(data: Data, completion: @escaping (_ isComplete: Bool) -> Void)
}



/* This is voilation of Interface segregation principle as `SomeFetcher` is doing two things
 protocol SomeFetcher {
    associatedtype T: Codable
    func fetch(completion: @escaping ((T?) -> Void))
    func upload(data: Data, completion: @escaping (_ isComplete: Bool) -> Void)
 }
 */
