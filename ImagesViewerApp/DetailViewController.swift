//
//  DetailViewController.swift
//  ImagesViewerApp
//
//  Created by Andrea Victoria López Palomeque on 26/10/2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedImage //set the title of the view controller to the selected image
        navigationItem.largeTitleDisplayMode = .never //set the navigation bar to use small titles

        if let imageToLoad = selectedImage { //if there is a selected image
            imageView.image = UIImage(named: imageToLoad) //load the image
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true //hide the navigation bar when the user taps the image
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false //show the navigation bar when the user taps the image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
