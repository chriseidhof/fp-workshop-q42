// Playground - noun: a place where people can play

import Cocoa

func int_reduce(arr: [Int], initialValue: Int,
    combine: (Int, Int) -> Int) -> Int {
        var result = initialValue
        for i in arr {
            result = combine(result, i)
        }
        return result
}

let sum = { arr in int_reduce(arr, initialValue: 0, combine: +) }
let product = { arr in int_reduce(arr, initialValue: 1, combine: *) }

let numbers = Array(1..<10)

sum(numbers)
product(numbers)

// make reduce generic

func my_reduce<A,B>(arr: [A], initialValue: B,
    combine: (B, A) -> B) -> B {
    return initialValue     // TODO
}

let lines = ["Hello", "World"]

// TODO use reduce to create a single string "Hello World " and a string "Hello\nWorld\n"


func flatten(input: [Int?]) -> [Int] {
    return [] // TODO: write flatten using reduce instead of map and filter
}

// BONUS: define map and filter in terms of reduce
