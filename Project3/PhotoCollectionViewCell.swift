//
//  PhotoCollectionViewCell.swift
//  Project3
//
//  Created by Kyleigh Hill  on 11/19/24.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    func update(displaying image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }

}

