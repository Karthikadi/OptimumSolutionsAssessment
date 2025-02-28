//
//  ViewController.swift
//  OptimumSolutionsAssessment
//
//  Created by Karthika on 27/02/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var moviesTableView: UITableView!
    @IBOutlet var movieSearchTextField: UITextField!
    
    // MARK: Property declaration
    
    var serviceClass = ServiceClass()
    var dataModel : MovieModel?
    
    // MARK: ViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: TableView delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataModel?.search?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MoviesTableViewCell
        if let title = self.dataModel?.search?[indexPath.row].title{
            cell.movieNameLable.text = title
        }
        if let year = self.dataModel?.search?[indexPath.row].year{
            cell.movieReleaseYearLable.text = year
        }
        if let poster = self.dataModel?.search?[indexPath.row].poster{
            cell.moviePosterImageView.setImageFromStringrURL(stringUrl: poster)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    // MARK: Button action Methods
    
    @IBAction func searchButtonAction(_ sender: Any) {
        serviceClass.invokeGetService { (ModelData) in
            self.dataModel = ModelData
            DispatchQueue.main.async{
                self.serviceClass.movie = self.movieSearchTextField.text
                self.moviesTableView.reloadData()
            }
        }
    }
}
// MARK: UIImageView extension

extension UIImageView{
    func setImageFromStringrURL(stringUrl: String) {
      if let url = URL(string: stringUrl) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          
          guard let imageData = data else { return }

          DispatchQueue.main.async {
            self.image = UIImage(data: imageData)
          }
        }.resume()
      }
    }
}

