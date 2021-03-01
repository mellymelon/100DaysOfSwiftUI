//
//  Card.swift
//  Flashzilla
//
//  Created by Yong Liang on 2/27/21.
//

struct Card: Codable {
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
