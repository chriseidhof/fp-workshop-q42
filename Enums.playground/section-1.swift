// Playground - noun: a place where people can play

import Cocoa

let person = [
    "name": "Tim",
    "address": [
        "street": "Waldorpstraat 17F"
    ]
]

// TODO: take the dictionary above and turn it into a struct Person with a nested struct Address


enum GithubAPI {
    case Zen
    case UserProfile(String)
    case Repositories(username: String, sortAscending: Bool)
}

func path(endpoint: GithubAPI) -> String {
    return "" // todo
}


//----------------------------


public class Box<T> {
    public let unbox: T
    public init(_ value: T) { self.unbox = value }
}


enum Result<A> {
    case Error(String)
    case Success(Box<A>)
}

func lookup<A>(key: String, dict: [String:A]) -> Result<A> {
    return .Error("Not implemented yet") // todo
}

let x  = lookup("Chris", ["Chris": 10])