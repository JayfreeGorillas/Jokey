//
//  ChuckJokeAPI.swift
//  JokeyUITests
//
//  Created by Josfry Barillas on 6/29/22.
//

import Foundation

enum EndPoint: String {
    case randomChuckNorrisJokes = "/random"
}
struct JokeAPI: Codable {
    let value: String
}

struct ChuckJokeAPI {
   private static let chuckJokeURL = "https://api.chucknorris.io/jokes/random"
    
    private static func chuckURL(endPoint: EndPoint) -> URL {
        var components = URLComponents(string: chuckJokeURL)!
        return components.url!
    }
    
    static var jokeURL: URL {
        return chuckURL(endPoint: .randomChuckNorrisJokes )
    }
    
    static func allJokes(fromJSON data: Data) -> Result<String, Error> {
        let decoder = JSONDecoder()
        
        do {
            let jokeResponse = try decoder.decode(JokeAPI.self, from: data)
            
            let joke = Joke(joke: jokeResponse.value)
            
            print(String(utf8String: joke.joke))
            return .success(jokeResponse.value)
        } catch {
            return .failure(error)
        }
    }
}
