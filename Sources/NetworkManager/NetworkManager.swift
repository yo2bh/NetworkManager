//
//  File.swift
//  
//
//  Created by Yogesh Bharate on 1/3/20.
//

import Foundation
import UIKit

public enum RequestType: String {
  case Post = "POST"
  case Get = "GET"
  case Put = "PUT"
}

public class NetworkManager {
  public static let shared = NetworkManager()
  
  private init() {
    print("Initalized the network manager instance")
  }
  
  public func sendRequest(urlString: String, type: RequestType = .Post, parameters: [String :Any]?, completionHandler: @escaping(Data?, Error?) -> Void) {
    // 1. Make URL from UrlString
    let url = URL(string: urlString)
    // 2. Create the URLRequest object
    var urlRequest = URLRequest(url: url!)
    // 3. Set httpMethod like POST, GET etc
    urlRequest.httpMethod = type.rawValue
    // 4. Add if any parameter
//    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    urlRequest.addValue("1", forHTTPHeaderField: "value")
    // 5. Create http body if have
//    do {
//      urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//    } catch let error {
//      completionHandler(nil, error)
//    }
    // 6. Send request - dataTask
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      DispatchQueue.main.async {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
      }
      completionHandler(data, error)
    }.resume()
  }
}
