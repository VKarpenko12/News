//
//  Appliable.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import Foundation

protocol Appliable {}

extension Appliable {
    
    // MARK: - Appearance

    @discardableResult
    func apply(_ configuration: (Self) throws -> Void) rethrows -> Self {
        try configuration(self)

        return self
    }
    
    func `do`<R>(_ configuration: (Self) throws -> R) rethrows -> R {
        try configuration(self)
    }
}

extension NSObject: Appliable {}
