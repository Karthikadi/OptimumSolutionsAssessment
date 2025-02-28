//
//  Service Class.swift
//  OptimumSolutionsAssessment
//
//  Created by Karthika on 27/02/25.
//

import Foundation

class ServiceClass{
    
    // MARK: Property declaration
    
    var movie : String?
    
    // MARK: Get service Methods
    
    func invokeGetService(completionHandler: @escaping(MovieModel) -> () ){
        let baseURL = URL(string: BASE_URL)!
        let name = URLQueryItem(name: "s", value: movie)
        let apiKey = URLQueryItem(name: "apikey", value: API_TOKEN)
        let url = baseURL.appending(queryItems: [name,apiKey])
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error{
                print(error)
                return
            }
            
            guard let response = response as! HTTPURLResponse? else {
                return
            }
            
            if(response.statusCode == 200){
                if let data = data{
                    do{
                        let totalData = try JSONDecoder().decode(MovieModel.self, from: data)
                        completionHandler(totalData)
                    }
                    catch{
                        print(error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
