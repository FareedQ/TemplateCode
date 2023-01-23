//
//  ViewController.swift
//  playingWithTMDB
//
//  Created by Fareed Quraishi on 2023-01-19.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.title.text = movies[indexPath.row]["title"] as? String
        return cell
    }
    
    
    @IBOutlet weak var table:UITableView!
    var movies: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData() { data, response, error in
            if let data = data {
                do {
                // Parse the JSON response
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movies = json["results"] as! [[String: Any]]
             } catch {
                print("Error parsing JSON: \(error)")
             }
                DispatchQueue.main.async {
                self.table.reloadData()
            }
                    } else if let _ = error {
                        // handle the error
                    }
                }
    }
    
    let apiKey = "90d747687f29612e531012819c1207c7"
    let baseURL = "https://api.themoviedb.org/3"
    func getData(completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: completion)
            task.resume()
        }

}

