//
//  ProfileInteractor.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol ProfileInteractorInput: AnyObject {
    func doSomething(request: ProfileRequest)
}

protocol ProfileInteractorOutput: AnyObject {
    func presentSomething(response: ProfileResponse)
}

class ProfileInteractor: ProfileInteractorInput {
    var output: ProfileInteractorOutput?
    var worker: ProfileWorker?
    
    // MARK: Business logic
    func doSomething(request: ProfileRequest) {
        // NOTE: Create some Worker to do the work
        worker = ProfileWorker()
        worker?.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = ProfileResponse()
        output?.presentSomething(response: response)
    }
}
