//
//  HelloController.swift
//  Test-ServerPackageDescription
//
//  Created by Ozgun Zor on 2/11/18.
//

import Vapor
import HTTP

final class HelloController {
    
    //
    func sayHello (_ req: Request) throws -> ResponseRepresentable {
        guard let name = req.data["name"] else {
            throw Abort(.badRequest)
            
        }
        
        return "Hello \(name)"
    }
}
