//
//  HomeTableViewCell.swift
//  CreinnovationsTest
//
//  Created by sixpep on 17/04/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryNameLabel:UILabel!
    @IBOutlet weak var categoryImage:UIImageView!
    @IBOutlet weak var categoryTitleLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(CatName:String,CatLab:String,CatImg:String){
        //categoryNameLabel.text = "CatName"
        categoryNameLabel.text = CatName
        categoryTitleLabel.text = CatLab
        
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: CatImg) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.categoryImage.image = UIImage(data: data)
              //  activityIndicator.stopAnimating()
            }
        }
   }

}
