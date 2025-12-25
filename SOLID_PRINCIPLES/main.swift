//
//  main.swift
//  SOLID_PRINCIPLES
//
//  Created by Roshan Sah on 25/12/25.
//

import Foundation

/*!
 ~~~~~~~~~~~~~~~ S.O.L.I.D is an acronym of five principles  ~~~~~~~~~~~~~~~
 S: Single Responsibility Principle
 O: Open–Closed Principle
 L: Liskov Substitution Principle
 I: Interface segregation principle
 D: Dependency inversion principle
 */

// Ref: https://en.wikipedia.org/wiki/SOLID


/*
 In this project, We will discuss on fetcing data
 */

/*
 * This is just a supporting type
 */

struct SomeModel: Decodable {
    let someAttribute: Int
}
