//
//  ExploreInteractor.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol ExploreInteractorInput: AnyObject {
    func doSomething(request: ExploreRequest)
}

protocol ExploreInteractorOutput: AnyObject {
    func presentSomething(response: ExploreResponse)
}

class ExploreInteractor: ExploreInteractorInput {
    var output: ExploreInteractorOutput?
    var worker: ExploreWorker?
    
    // MARK: Business logic
    func doSomething(request: ExploreRequest) {
        // NOTE: Create some Worker to do the work
        worker = ExploreWorker()
        worker?.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = ExploreResponse()
        output?.presentSomething(response: response)
    }
}
