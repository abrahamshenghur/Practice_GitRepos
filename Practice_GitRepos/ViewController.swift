//
//  ViewController.swift
//  Practice_GitRepos
//
//  Created by John on 7/5/21.
//  Copyright © 2021 Abraham Shenghur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var movies: [Movie] = []

    struct Cells {
        static let movieCell = "movieCel"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie List"
        
        let movie1 = Movie(title: "TopGun")
        let movie2 = Movie(title: "iMac")
        let movie3 = Movie(title: "Macbook")
        movies.append(movie1)
        movies.append(movie2)
        movies.append(movie3)

        configureTableView()

    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieCell.self, forCellReuseIdentifier: Cells.movieCell)
        tableView.pin(to: view)
    }
    
    func myFunctiion() {
        print("Macbook code")
    }

}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.movieCell, for: indexPath) as! MovieCell
        let movie: Movie
        
        movie = movies[indexPath.row]

        cell.titleLabel.text = movie.title
        cell.backgroundColor = .red
        
        return cell
    }
}




