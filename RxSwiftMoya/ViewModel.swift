//
//  ViewModel.swift
//  RxSwiftMoya
//
//  Created by Chao Li on 9/23/16.
//  Copyright © 2016 ERStone. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class ViewModel {
    private let provider = RxMoyaProvider<MyAPI>()
    
    func getPosts() -> Observable<[Post]> {
        return provider.request(.Show)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapArray(type: Post.self)
    }
    
    func createPost(title: String, body: String, userId: Int) -> Observable<Post> {
        return provider.request(.Create(title: title, body: body, userId: userId))
            .mapJSON()
            .mapObject(type: Post.self)
    }
}
