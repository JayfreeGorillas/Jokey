//
//  ViewController.swift
//  Jokey
//
//  Created by Josfry Barillas on 6/29/22.
//

import UIKit

class ViewController: UIViewController {
    var joke = ""
    var chuckJokes = JokeManager()
    let uiColors: [UIColor] = [.red, .blue, .cyan, .green, .orange]
    let backgroundColors: [UIColor] = [.blue, .brown, .yellow, .purple, .magenta]
    @IBOutlet var jokeLabel: UILabel!
    @IBOutlet var newJoke: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       refreshUI()
    }
    
    
   
    @IBAction func refreshLabel(_ sender: UIButton) {
        
        refreshUI()
//        chuckJokes.performRequest { (jokeResults) in
//            switch jokeResults {
//            case let .success(chuckJoke):
//                self.joke = chuckJoke
//                DispatchQueue.main.async {
//                    self.jokeLabel.text = chuckJoke
//                }
//            case .failure(_):
//                print("error refreshing")
//            }
//        }
    }
    

    
    func refreshUI() {
        chuckJokes.performRequest { (jokeResults) in
            switch jokeResults {
            case let .success(chuckJoke):
                self.joke = chuckJoke
                DispatchQueue.main.async {
                    self.jokeLabel.text = chuckJoke
                }
            case .failure(_):
                print("error refreshing")
            }
        }
        
        jokeLabel.textColor = uiColors.randomElement()
        view.backgroundColor = backgroundColors.randomElement()
        
        if jokeLabel.textColor == view.backgroundColor {
            jokeLabel.textColor = .systemPink
            view.backgroundColor = .systemGray
        }
    }
}

