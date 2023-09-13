//
//  CalculatorViewModel.swift
//  MVVMPractice2
//
//  Created by 권현석 on 2023/09/13.
//

import Foundation

final class CalculatorViewModel {
    
    var firstNumber: CalculatorObservable<String?> = CalculatorObservable("")
    var secondNumber: CalculatorObservable<String?> = CalculatorObservable("")
    var selectedOperator: CalculatorObservable<OperatorEnum?> = CalculatorObservable(nil)
    var resultValue: CalculatorObservable<String> = CalculatorObservable("")
    
    func calculate() {
        guard
            let first = firstNumber.value,
            let firstNumInt = Int(first) else {
            resultValue.value = "첫 번째 숫자가 잘못됨 수정하세요."
            return
        }
        
        guard
            let second = secondNumber.value,
            let secondNumInt = Int(second) else {
            resultValue.value = "두번째 숫자가 잘못됨 수정하세요."
            return
        }
        
        guard let myOperator = selectedOperator.value else { return }
        
        switch myOperator {
        case .plus:
            resultValue.value = "\(firstNumInt + secondNumInt)"
        case .minus:
            resultValue.value = "\(firstNumInt - secondNumInt)"
        case .multiply:
            resultValue.value = "\(firstNumInt * secondNumInt)"
        case .divide:
            resultValue.value = "\(firstNumInt / secondNumInt)"
        }
    }
}
