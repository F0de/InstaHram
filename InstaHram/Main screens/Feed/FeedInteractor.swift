//
//  FeedInteractor.swift
//  InstaHram
//
//  Created by Влад Тимчук on 17.10.2024.
//

import UIKit

protocol FeedInteractorInput: AnyObject {
    func doSomething(request: FeedRequest)
}

protocol FeedInteractorOutput: AnyObject {
    func presentSomething(response: FeedResponse)
}

class FeedInteractor: FeedInteractorInput {
    var output: FeedInteractorOutput?
    var worker: FeedWorker?
    
    // MARK: Business logic
    func doSomething(request: FeedRequest) {
        // NOTE: Create some Worker to do the work
        worker = FeedWorker()
        worker?.fetchPosts()
        
        // NOTE: Pass the result to the Presenter
        let response = FeedResponse()
        output?.presentSomething(response: response)
    }
}
