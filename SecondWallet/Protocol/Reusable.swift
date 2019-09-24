//
//  Reusable.swift
//  SecondWallet
//
//  Created by Chris Xu on 2019/9/8.
//  Copyright © 2019 chrisxu. All rights reserved.
//

import Foundation

protocol Reusable {
    
    static var reuseIdentifier: String { get }
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
