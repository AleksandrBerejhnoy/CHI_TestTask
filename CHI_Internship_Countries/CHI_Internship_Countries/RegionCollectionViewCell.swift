//
//  RegionCollectionViewCell.swift
//  CHI_Internship_Countries
//
//  Created by Pro on 13.05.2021.
//

import UIKit

class RegionCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: RegionCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: RegionCollectionViewCell.self), bundle: nil)

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var ibTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 8
    }
    
    func update(name: String, image: UIImage) {
        ibTitle.text = name
        imageView.image = image
    }

}
