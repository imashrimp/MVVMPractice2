//
//  LottoObservable.swift
//  MVVMPractice2
//
//  Created by 권현석 on 2023/09/13.
//

import Foundation

class Observable<T> {
    
    var listener: ((T) ->Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(completionHandler: @escaping (T) -> Void) {
        completionHandler(value)
        listener = completionHandler
    }
}
