//
//  PhotoInfoViewController.swift
//  Project3
//
//  Created by Kyleigh Hill  on 11/20/24.
//

import UIKit

class PhotoInfoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
            
            // Ensure the view is loaded before attempting to update UI elements
            if isViewLoaded {
                descriptionLabel.text = photo.description
            }
        }
    }
    var store: PhotoStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial values for the label and other UI elements
        descriptionLabel.text = photo.description
        store.fetchImage(for: photo) { (result) -> Void in
                switch result {
                case let .success(image):
                    self.imageView.image = image
                case let .failure(error):
                    print("Error fetching image for photo: \(error)")
                }
            }
    }
}
