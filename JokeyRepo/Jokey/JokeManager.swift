//
//  JokeManager.swift
//  JokeyUITests
//
//  Created by Josfry Barillas on 6/29/22.
//

import Foundation

class JokeManager {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: .default)
    }()



    
    func performRequest(completion: @escaping (Result<String, Error>) -> Void) {
        let url = ChuckJokeAPI.jokeURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            let result = self.processJokeRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processJokeRequest(data: Data?, error: Error?) -> Result<String, Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return ChuckJokeAPI.allJokes(fromJSON: jsonData)
        
    }
}
    

