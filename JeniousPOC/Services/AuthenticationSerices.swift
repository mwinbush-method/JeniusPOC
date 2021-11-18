//
//  AuthenticationSerices.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/15/21.
//

import Foundation

class AuthenticationServices {
    static func userLogin(userName: String, password: String, completion: ((APIResponse) -> Void)) {
//      GET request response {
//
//          completion(APIResponse(statusCode: response.statusCode, data: response.data, errorMessage: ""))
//      }
        
    }
}

enum ResponseStatus {
    case success
    case failed
}

struct APIResponse {
    let responseStatus: ResponseStatus
    let statusCode: Int
    let data: Any?
    let errorMessage: String?
}

//AuthenticationServices.userLogin(userName: "bobbarker", password: "1234567adsfjadsk", completion: { response in
//    switch response.responseStatus {
//    case .success:
//        print("hooray")
//    case .failed:
//        print(response.statusCode)
//    }
//})

