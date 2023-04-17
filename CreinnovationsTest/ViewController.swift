//
//  ViewController.swift
//  CreinnovationsTest
//
//  Created by sixpep on 17/04/23.
//

import UIKit

class ViewController: UIViewController {

    var AllCategories:[Category] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }

    func getData(){
        guard let url = URL(string: "https://jsonfilesall.s3.ap-south-1.amazonaws.com/Android/CreApps/CaricatureMakerPhotoEditor/demo.json") else{
                return
            }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil && data != nil{
                DispatchQueue.main.async {
                    do{
                        let categoryResponse = try JSONDecoder().decode(ApiResponse.self, from: data!)
                        print(categoryResponse)
                        self.AllCategories = categoryResponse.categories!
                        self.tableView.reloadData()
                    }catch{
                        print("Parsing Error")
                    }
                }
            }
            
            
        }.resume()
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AllCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.setData(CatName: AllCategories[indexPath.row].CategoryName!, CatLab: AllCategories[indexPath.row].categoryTitle!, CatImg: AllCategories[indexPath.row].categoryImage!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thumbnailVC = ThumbnailView()
        thumbnailVC.allSubCatImage = AllCategories[indexPath.row].subcategories!
            navigationController?.pushViewController(thumbnailVC, animated: true)
        
    }
    
    
}

