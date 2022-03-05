//
//  Network.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 3/4/22.
//

import Apollo
import Foundation

class Network {
  static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: APIConstants.baseUrl)!)
}


