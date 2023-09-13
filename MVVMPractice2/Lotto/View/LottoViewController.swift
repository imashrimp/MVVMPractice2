//
//  LottoViewController.swift
//  MVVMPractice2
//
//  Created by 권현석 on 2023/09/13.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    
    let dateLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 30, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    let drwNoTitleLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.text = "회차"
        return view
    }()
    
    private lazy var lottoDrwNoPickerView = {
       let view = UIPickerView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    let drwNo1Label = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    let drwNo2Label = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    let drwNo3Label = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    let drwNo4Label = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    let drwNo5Label = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    let drwNo6Label = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    let drwBnusNoLabel = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    
    let viewModel = LottoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraints()
                
        bind()

    }
    
    func bind() {
        
        viewModel.drwNoDate.bind { date in
            self.dateLabel.text = "날짜: " + date
        }
        
        viewModel.drwtNo1.bind { number in
            self.drwNo1Label.text = "첫 번째 번호: " + number
        }
        
        viewModel.drwtNo2.bind { number in
            self.drwNo2Label.text = "두 번째 번호: " + number
        }
        
        viewModel.drwtNo3.bind { number in
            self.drwNo3Label.text = "세 번째 번호: " + number
        }
        
        viewModel.drwtNo4.bind { number in
            self.drwNo4Label.text = "네 번째 번호: " + number
        }
        
        viewModel.drwtNo5.bind { number in
            self.drwNo5Label.text = "다섯 번째 번호: " + number
        }
        
        viewModel.drwtNo6.bind { number in
            self.drwNo6Label.text = "여섯 번째 번호: " + number
        }
        
        viewModel.drwBnusNo.bind { number in
            self.drwBnusNoLabel.text = "보너스 번호: " + number
        }
    }
}

extension LottoViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.titleForRow(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.callReques(row)
    }
}

extension LottoViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.numberOfRowsInComponent()
    }
}

extension LottoViewController {
    func configure() {
        view.backgroundColor = .white
        
        [
        dateLabel,
        drwNoTitleLabel,
        lottoDrwNoPickerView,
        drwNo1Label,
        drwNo2Label,
        drwNo3Label,
        drwNo4Label,
        drwNo5Label,
        drwNo6Label,
        drwBnusNoLabel
        ].forEach {
            view.addSubview($0)
        }
    }
    
    func setConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
        }
        
        lottoDrwNoPickerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.height.equalTo(100)
            make.width.equalTo(250)
        }

        drwNoTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lottoDrwNoPickerView.snp.centerY)
            make.trailing.equalTo(lottoDrwNoPickerView.snp.leading).offset(-8)
        }

        drwNo1Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(8)
            make.top.equalTo(lottoDrwNoPickerView.snp.bottom).offset(12)
        }

        drwNo2Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(8)
            make.top.equalTo(drwNo1Label.snp.bottom).offset(4)
        }

        drwNo3Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(8)
            make.top.equalTo(drwNo2Label.snp.bottom).offset(4)
        }

        drwNo4Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(8)
            make.top.equalTo(drwNo3Label.snp.bottom).offset(4)
        }

        drwNo5Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(8)
            make.top.equalTo(drwNo4Label.snp.bottom).offset(4)
        }

        drwNo6Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(8)
            make.top.equalTo(drwNo5Label.snp.bottom).offset(4)
        }

        drwBnusNoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(8)
            make.top.equalTo(drwNo6Label.snp.bottom).offset(4)
        }
    }
}
