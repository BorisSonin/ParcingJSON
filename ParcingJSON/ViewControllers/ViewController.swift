//
//  ViewController.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped() {
        parcingPictures()
    }
    
    func parcingPictures() {
        
        let urlString = "https://go-apod.herokuapp.com/apod"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let astronomy = try JSONDecoder().decode(AstronomyPicture.self, from: data)
                print(astronomy)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


