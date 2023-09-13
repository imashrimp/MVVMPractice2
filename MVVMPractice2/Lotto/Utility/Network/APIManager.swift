//
//  APIManager.swift
//  MVVMPractice2
//
//  Created by 권현석 on 2023/09/13.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    
    private init() { }
    
    func callRequest(drwNo: Int, completionHandler: @escaping (LottoModel) -> ()) {
        
        var components = URLComponents()
        components.scheme = URLSingleton.shared.scheme
        components.host = URLSingleton.shared.host
        components.path = URLSingleton.shared.path
        components.queryItems = [
            URLQueryItem(name: URLSingleton.shared.httpMethodQueryName,
                         value: URLSingleton.shared.httpMethodQueryValue),
            URLQueryItem(name: URLSingleton.shared.drwNoQueryName, value: "\(drwNo)")
        ]
        
        guard let url = components.url else { return }
        
        AF.request(url, method: .get).validate()
            .responseDecodable(of: LottoModel.self) { response in
                let result = response.result
                
                switch result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error, "통신 에러 발생 여기서 얼럿 띄워서 화면에 보여줘도 될 듯?")
                }
            }
        
    }
    
    
}
