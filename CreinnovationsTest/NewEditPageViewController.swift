//
//  NewEditPageViewController.swift
//  CreinnovationsTest
//
//  Created by sixpep on 18/04/23.
//

import UIKit

class NewEditPageViewController: UIViewController {
    
    var allSubCatImage1:[Subcategory] = []
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let image1:UIImageView={
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let image2:UIImageView={
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let slider: UISlider={
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .white
        image1.frame = CGRect(x: view.frame.width*0.2, y: view.frame.height*0.3, width: view.frame.width/1.5, height: view.frame.height/3)
//        image1.backgroundColor = .blue
        image2.frame = CGRect(x: view.frame.width*0.2, y: view.frame.height*0.3, width: view.frame.width/1.5, height: view.frame.height/3)
//        image2.backgroundColor = .green
        
        slider.frame = CGRect(x: 30, y: ((view.frame.height-image2.frame.maxY)/2)+image2.frame.maxY, width: view.frame.width-80, height: 20)
        
        collectionView.frame = CGRect(x: 0, y: slider.frame.maxY+10, width: view.frame.width, height: 100)
        view.addSubview(image1)
        view.addSubview(image2)
        view.addSubview(slider)
        view.addSubview(collectionView)
        
    }
    
    @objc func sliderValueChanged(_ sender:UISlider){
        image2.alpha = CGFloat(sender.value)/100
        print(image2.alpha)
    }

    func setImage(img1:String,img2:String){
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: img1) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.image1.image = UIImage(data: data)
              //  activityIndicator.stopAnimating()
            }
        }
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: img2) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.image2.image = UIImage(data: data)
              //  activityIndicator.stopAnimating()
            }
        }
    }
    
    func setEditSub(sub:[Subcategory]){
        allSubCatImage1 = sub
    }
    
}

extension NewEditPageViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSubCatImage1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let cellWidth: CGFloat = 100.0
            let cellHeight: CGFloat = 150.0
            return CGSize(width: cellWidth, height: cellHeight)
        }
}
