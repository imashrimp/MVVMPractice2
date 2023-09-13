//
//  LottoModel.swift
//  MVVMPractice2
//
//  Created by 권현석 on 2023/09/13.
//

import Foundation

class LottoViewModel {
    
    var drwNoDate = Observable("")
    var drwNo = Observable(0)
    var drwtNo1 = Observable("")
    var drwtNo2 = Observable("")
    var drwtNo3 = Observable("")
    var drwtNo4 = Observable("")
    var drwtNo5 = Observable("")
    var drwtNo6 = Observable("")
    var drwBnusNo = Observable("")
    
    var drwNoList: [Int] = Array(1...1084).reversed()
    
    func numberOfRowsInComponent() -> Int {
        return drwNoList.count
    }
    
    func titleForRow(_ row: Int) -> String {
        return "\(drwNoList[row])"
    }
    
    func dateFormat(dateString: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let date = dateFormat.date(from: dateString)
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy년 MM월 dd일"
        myDateFormatter.locale = Locale(identifier: "ko_KR")
        let dateString = myDateFormatter.string(from: date!)
        
        return dateString
    }
    
    func callReques(_ row: Int) {
        
        let drwNo = drwNoList[row]
        
        APIManager.shared.callRequest(drwNo: drwNo) { lottoInfo in
            self.drwNoDate.value = self.dateFormat(dateString: lottoInfo.drwNoDate)
            self.drwtNo1.value = "\(lottoInfo.drwtNo1)"
            self.drwtNo2.value = "\(lottoInfo.drwtNo2)"
            self.drwtNo3.value = "\(lottoInfo.drwtNo3)"
            self.drwtNo4.value = "\(lottoInfo.drwtNo4)"
            self.drwtNo5.value = "\(lottoInfo.drwtNo5)"
            self.drwtNo6.value = "\(lottoInfo.drwtNo6)"
            self.drwBnusNo.value = "\(lottoInfo.bnusNo)"
        }
    }

}
