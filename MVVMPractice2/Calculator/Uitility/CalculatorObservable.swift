//
//  CalculatorObservable.swift
//  MVVMPractice2
//
//  Created by 권현석 on 2023/09/13.
//

import Foundation

final class CalculatorObservable<T> {
    
    private var lister: ((T) -> Void)?
    
    var value: T {
        didSet {
            lister?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> Void ) {
        completion(value)
        lister = completion
    }
}
