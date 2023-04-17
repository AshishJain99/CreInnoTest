//
//  EditCollectionViewCell.swift
//  CreinnovationsTest
//
//  Created by sixpep on 18/04/23.
//

import UIKit

class EditCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "EditCollectionViewCell"
    
    private let imageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func setSubCatImage(SubCatLink:String){
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: SubCatLink) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
              //  activityIndicator.stopAnimating()
            }
        }
    }
    
    
    
    
}
