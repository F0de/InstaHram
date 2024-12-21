//
//  NotificationsInteractor.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol NotificationsInteractorInput: AnyObject {
    func doSomething(request: NotificationsRequest)
}

protocol NotificationsInteractorOutput: AnyObject {
    func presentSomething(response: NotificationsResponse)
}

class NotificationsInteractor: NotificationsInteractorInput {
    var output: NotificationsInteractorOutput?
    var worker: NotificationsWorker?
    
    // MARK: Business logic
    func doSomething(request: NotificationsRequest) {
        // NOTE: Create some Worker to do the work
        worker = NotificationsWorker()
        worker?.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = NotificationsResponse()
        output?.presentSomething(response: response)
    }
}
