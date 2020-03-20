//
//  NetworkLayer.swift
//  Canada
//
//  Created by Isac Joseph on 20/03/20.
//  Copyright © 2020 Isac Joseph. All rights reserved.
//

import Foundation
import Alamofire

class NetworkLayer: NSObject
{
    static let shared = NetworkLayer()
    var configuration = URLSessionConfiguration.default
    var alamofireManager = Alamofire.SessionManager()
    
    private override init()
    {
        super.init()
        self.intializeNetworkConfiguration()
    }
    
    /*
     * Configuring Network calls
     */
    func intializeNetworkConfiguration()
    {
        self.configuration.timeoutIntervalForRequest = 20
        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    /*
     * A common function too handle all kind of requests and return a
     */
    func getFacts(url:URL, method : HTTPMethod,completion: @escaping (_ result: FactsResponse?, _ error: String?) -> Void)
    {
        let request = alamofireManager.request(url, method:method, parameters:nil, encoding: URLEncoding.default, headers: nil).responseJSON
            { response in
                guard let data = response.data,response.error == nil else
                {
                    completion(nil, response.result.error?.localizedDescription)
                    return
                }
                do
                {
                    let factResponse = try JSONDecoder().decode(FactsResponse.self, from: data)
                    completion(factResponse,nil)
                }
                catch
                {
                    completion(nil, error.localizedDescription)
                }
        }
        debugPrint(request)
    }
}
