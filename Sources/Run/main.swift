import App

/// We have isolated all of our App's logic into
/// the App module because it makes our app
/// more testable.
///
/// In general, the executable portion of our App
/// shouldn't include much more code than is presented
/// here.
///
/// We simply initialize our Droplet, optionally
/// passing in values if necessary
/// Then, we pass it to our App's setup function
/// this should setup all the routes and special
/// features of our app
///
/// .run() runs the Droplet's commands, 
/// if no command is given, it will default to "serve"

let config = try Config()
try config.setup()

let drop = try Droplet(config)
try drop.setup()

drop.get { request in
    return "Hello First!"
}

drop.get("helloSecond") { request in
    return try JSON(node: [
        "message": "Hello Second"
    ])
}

drop.get("hello", "third") { request in
    return try JSON(node: [
        "message": "Hello Third"
    ])
}

//drop.get("hello", Int.self) { request, intParam in
//    return try JSON(node: [
//        "message": "Hello \(intParam)"
//    ])
//}

drop.post("helloPost") { request in
    
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return try JSON(node: [
        "message": "Hello \(name)"
    ])
}

try drop.run()
