//
//  ViewController.swift
//  ImagesViewerApp
//
//  Created by Andrea Victoria López Palomeque on 24/10/2023.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]() //create an empty array of strings

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Storm Viewer" //set the title of the view controller
        navigationController?.navigationBar.prefersLargeTitles = true //set the navigation bar to use large titles
        
        let fm = FileManager.default // FileManager is a class that lets you work with the filesystem
        let path = Bundle.main.resourcePath! // Bundle is a directory containing compiled program and all assets (tell me where I can find all my assets)
        let items = try! fm.contentsOfDirectory(atPath: path) //returns an array of strings containing the names of all the files in the directory specified by a given path

        // go trough all the items in the array and print the ones that start with "nssl"
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item) //add the item to the array
            }
        }
        print(pictures)
    }
    
    //changes NUMBER of ROWS in the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //as many rows as pictures
        return pictures.count
    }

    //changes the CONTENT of the ROWS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //set the text label to the picture name
        cell.textLabel?.text = pictures[indexPath.row]
        //return the cell
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController { //instantiate a new view controller as a DetailViewController
            vc.selectedImage = pictures[indexPath.row] //set the selectedImage property to the picture name
            navigationController?.pushViewController(vc, animated: true) //push the new view controller onto the navigation controller
        }
    }
    
}

