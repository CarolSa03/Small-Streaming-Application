//
//  Box.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class Box<T> {
    var value: T { didSet { listener?(value) } }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) { self.value = value }
    
    func bind(listener: ((T) -> Void)?){
        self.listener = listener
        listener?(value)
    }
}
