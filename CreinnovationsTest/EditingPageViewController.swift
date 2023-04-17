//
//  EditingPageViewController.swift
//  CreinnovationsTest
//
//  Created by sixpep on 17/04/23.
//

import UIKit

class EditingPageViewController: UIViewController {

    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    let image11:UIImageView={
        let image = UIImageView()
        image.backgroundColor = .white
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is loading.....")
        // Do any additional setup after loading the view.
       // image1.image = UIImage(systemName: "person")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        image11.frame = CGRect(x: 0, y: 0, width: view.frame.width*0.2, height: view.frame.height*0.2)
        view.addSubview(image11)
    }
    
    func setImage(img1:String,img2:String){
//        DispatchQueue.global().async { [weak self] in
//            guard let url = URL(string: img1) else { return }
//            guard let data = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                self?.image1.image = UIImage(data: data)
//              //  activityIndicator.stopAnimating()
//            }
//        }
//        DispatchQueue.global().async { [weak self] in
//            guard let url = URL(string: img2) else { return }
//            guard let data = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                self?.image2.image = UIImage(data: data)
//              //  activityIndicator.stopAnimating()
//            }
//        }
    }

}
