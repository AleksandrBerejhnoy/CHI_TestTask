//
//  CollectionView+Extensions.swift
//  CHI_Internship_Countries
//
//  Created by Pro on 18.05.2021.
//

import Foundation
import UIKit

//MARK: - UICollectionViewDataSource
extension RootViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        regions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = regionsCollectionView.dequeueReusableCell(withReuseIdentifier: RegionCollectionViewCell.reuseID, for: indexPath) as? RegionCollectionViewCell else {
            fatalError("Cell does not exist")
        }
        
        guard let image = UIImage(named: regions[indexPath.row]) else { fatalError("Image not found") }
        
        cell.update(name: regions[indexPath.row], image: image)
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension RootViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.backgroundColor = .lightGray
        
        regionLabel.text = regions[indexPath.row].uppercased()
        updateURLString(tail: regions[indexPath.row])
        generateCountries()
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.backgroundColor = .white
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension RootViewController: UICollectionViewDelegateFlowLayout {
    
    var minimumItemSpacing: CGFloat { return 4 }
    var sectionInset: UIEdgeInsets { return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10) }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSectionSpace = sectionInset.top + sectionInset.bottom
        let widthPerItem = collectionView.bounds.height - paddingSectionSpace
        
        return CGSize(width: widthPerItem, height: widthPerItem * 1)
    }
}
