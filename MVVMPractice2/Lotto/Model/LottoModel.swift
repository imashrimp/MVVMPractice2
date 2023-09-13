//
//  LottoModel.swift
//  MVVMPractice2
//
//  Created by 권현석 on 2023/09/13.
//

import Foundation

struct LottoModel: Codable {
    let drwNoDate: String
    let firstWinamnt: Int //1등 당첨 금액
    let firstAccumamnt: Int //1등 당첨금 총액
    let firstPrzwnerCo: Int //1등 당첨 총원
    let drwNo: Int
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo : Int
}
