//
//  CalculatorViewController.swift
//  MVVMPractice2
//
//  Created by 권현석 on 2023/09/13.
//

import UIKit
import SnapKit

final class CalculatorViewController: UIViewController {
    
   private let firstNumberTextField = {
        let view = UITextField()
        view.placeholder = "첫 번째 숫자를 입력하세요"
        view.textAlignment = .center
        view.borderStyle = .roundedRect
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private let secondNumberTextField = {
        let view = UITextField()
        view.placeholder = "두 번째 숫자를 입력하세요"
        view.textAlignment = .center
        view.borderStyle = .roundedRect
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private let plusButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setTitle("+", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.darkGray, for: .highlighted)
        view.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let minusButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setTitle("-", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.darkGray, for: .highlighted)
        view.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let multiplicationButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setTitle("x", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.darkGray, for: .highlighted)
        view.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let divisionButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setTitle("÷", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.darkGray, for: .highlighted)
        view.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    private let resultLabel = {
        let view = UILabel()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 3
        view.font = .systemFont(ofSize: 25, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private let viewModel = CalculatorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraints()
        
        viewModel.firstNumber.bind { number in
            self.firstNumberTextField.text = number
        }
        
        viewModel.secondNumber.bind { number in
            self.secondNumberTextField.text = number
        }
        
        viewModel.resultValue.bind { result in
            self.resultLabel.text = result
        }
        
    }
    
    @objc private func plusButtonTapped() {
        viewModel.firstNumber.value = firstNumberTextField.text
        viewModel.secondNumber.value = secondNumberTextField.text
        viewModel.selectedOperator.value = OperatorEnum.plus
        viewModel.calculate()
    }
    
    @objc private func minusButtonTapped() {
        viewModel.firstNumber.value = firstNumberTextField.text
        viewModel.secondNumber.value = secondNumberTextField.text
        viewModel.selectedOperator.value = OperatorEnum.minus
        viewModel.calculate()
    }
    
    @objc private func multiplicationButtonTapped() {
        viewModel.firstNumber.value = firstNumberTextField.text
        viewModel.secondNumber.value = secondNumberTextField.text
        viewModel.selectedOperator.value = OperatorEnum.multiply
        viewModel.calculate()
    }
    
    @objc private func divisionButtonTapped() {
        viewModel.firstNumber.value = firstNumberTextField.text
        viewModel.secondNumber.value = secondNumberTextField.text
        viewModel.selectedOperator.value = OperatorEnum.divide
        viewModel.calculate()
    }
}

extension CalculatorViewController {
    private func configure() {
        view.backgroundColor = .systemOrange
        
        [firstNumberTextField,
         secondNumberTextField,
         stackView,
         resultLabel].forEach {
            view.addSubview($0)
        }
        
        [plusButton,
         minusButton,
         multiplicationButton,
         divisionButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        plusButton.addTarget(self,
                             action: #selector(plusButtonTapped),
                             for: .touchUpInside)
        minusButton.addTarget(self,
                              action: #selector(minusButtonTapped),
                              for: .touchUpInside)
        multiplicationButton.addTarget(self,
                                       action: #selector(multiplicationButtonTapped),
                                       for: .touchUpInside)
        divisionButton.addTarget(self,
                                 action: #selector(divisionButtonTapped),
                                 for: .touchUpInside)
    }
    
    private func setConstraints() {
        firstNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(12)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.height.equalTo(35)
        }
        
        secondNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(12)
            make.top.equalTo(firstNumberTextField.snp.bottom).offset(12)
            make.height.equalTo(35)
        }
        
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.top.equalTo(secondNumberTextField.snp.bottom).offset(12)
            make.height.equalTo(60)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.top.equalTo(stackView.snp.bottom).offset(12)
            make.height.equalTo(40)
        }
    }

}
