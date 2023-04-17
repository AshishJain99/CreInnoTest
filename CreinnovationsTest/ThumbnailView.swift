//
//  ThumbnailView.swift
//  CreinnovationsTest
//
//  Created by sixpep on 17/04/23.
//

import UIKit


class ThumbnailView:UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    var allSubCatImage:[Subcategory] = []
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.register(ThumbnailCollectionViewCell.self, forCellWithReuseIdentifier: ThumbnailCollectionViewCell.identifier)
      //  collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(allSubCatImage.count)
        return allSubCatImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCollectionViewCell.identifier, for: indexPath) as! ThumbnailCollectionViewCell
        cell.setSubCatImage(SubCatLink: allSubCatImage[indexPath.row].thumbnail!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let cellWidth: CGFloat = 100.0
            let cellHeight: CGFloat = 150.0
            return CGSize(width: cellWidth, height: cellHeight)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let editVC = NewEditPageViewController()
        editVC.setImage(img1: allSubCatImage[indexPath.row].backlayer!, img2: allSubCatImage[indexPath.row].frontlayer!)
        editVC.allSubCatImage1 = allSubCatImage
        navigationController?.pushViewController(editVC, animated: true)
    }
    
}
