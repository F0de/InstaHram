//
//  NewPostInteractor.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol NewPostInteractorInput: AnyObject {
    func doSomething(request: NewPostRequest)
}

protocol NewPostInteractorOutput: AnyObject {
    func presentSomething(response: NewPostResponse)
}

class NewPostInteractor: NewPostInteractorInput {
    var output: NewPostInteractorOutput?
    var worker: NewPostWorker?
    
    // MARK: Business logic
    func doSomething(request: NewPostRequest) {
        // NOTE: Create some Worker to do the work
        worker = NewPostWorker()
        worker?.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = NewPostResponse()
        output?.presentSomething(response: response)
    }
}
