//
//  MyAPI.swift
//  RxSwiftMoya
//
//  Created by Chao Li on 9/20/16.
//  Copyright © 2016 ERStone. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Alamofire

enum MyAPI {
    case Show
    case Create(title: String, body: String, userId: Int)
}

extension MyAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .Show:
            return "/posts"
        case .Create(_, _, _):
            return "/posts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .Show:
            return .GET
        case .Create(_, _, _):
            return .POST
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .Show:
            return nil
        case .Create(let title, let body, let userId):
            return ["title": title, "body": body, "userId": userId]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .Show:
            return "[{\"userId\": \"1\", \"Title\": \"Title String\", \"Body\": \"Body String\"}]".data(using: String.Encoding.utf8)!
        case .Create(_, _, _):
            return "Create post successfully".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        return .request
    }
}
