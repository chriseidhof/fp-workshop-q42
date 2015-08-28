import Cocoa

enum Result<A> {
    case Error(String)
    case Success(A)
}

func success<A>(x: A) -> Result<A> {
    return .Success(x)
}

func loadData(url: NSURL) -> Result<NSData> {
    if let data = NSData(contentsOfURL: url) {
        return success(data)
    } else {
        return .Error("Couldn't load data")
    }
}

typealias JSONDictionary = [String:AnyObject]

func parseJSON(data: NSData) -> Result<JSONDictionary> {
    if let json = NSJSONSerialization.JSONObjectWithData(data,
        options: .allZeros, error: nil) as?  JSONDictionary {
        return success(json)
    } else {
        return .Error("Couldn't parse JSON")
    }
}

extension Result {
    func flatMap<B>(f: A -> Result<B>) -> Result<B> {
        // TODO
        return .Error("TODO")
    }
}


func avatarURL(json: JSONDictionary) -> Result<NSURL> {
    // TODO
    return .Error("TODO")
}

let json = flatMap(flatMap(loadData(NSURL(string: "https://api.github.com/users/objcio")!), parseJSON), avatarURL)

// BONUS: define >>= as an operator that does the same thing as flatMap. Rewrite the above code
// BONUS 2: can you write a function that goes from (A throws -> B) to (A -> Result<B>) ? And the other way around?

switch json {
case .Success(let x): println("Success: \(x.unbox)")
case .Error(let e): println("Error: \(e)")
}
