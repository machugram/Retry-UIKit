//
//  Apollo.swift
//  Retry-UIKit
//
//  Created by Rexford Machu on 9/30/21.
//

import Foundation
import Apollo

class Apollo{
    static let shared = Apollo()
    let client : ApolloClient
    init(){
        client  = ApolloClient(url: URL(string: "https://sharkybackend.herokuapp.com/graphql")!)
    }
}
