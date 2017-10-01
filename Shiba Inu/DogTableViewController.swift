//
//  DogsTableViewController.swift
//  Shiba Inu
//
//  Created by Olivia on 2017-09-30.
//  Copyright © 2017 Olivia. All rights reserved.
//

import UIKit
class DogCell: UITableViewCell {
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var dogImageView: UIImageView!
}

class DogTableViewController: UITableViewController {
  
  var dogs: [String: String]! = nil
  
  // height
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
  }
  
  // how many rows to display
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dogs.count
  }
  
  // what does each row look like
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DoggyCell") as! DogCell
    
    // set up cell name
    let dogName = Array(self.dogs.keys)[indexPath.row]
    cell.name.text = dogName
    
    // set up cell image
    DispatchQueue.global().async { // download image in background
      let imageUrlString = self.dogs[dogName]!
      let url = URL(string: imageUrlString)
      let data = try? Data(contentsOf: url!)
      
      DispatchQueue.main.async { // download in main thread will block UI
        cell.dogImageView.image = UIImage(data: data!)
      }
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let dogName = Array(self.dogs.keys)[indexPath.row]
//    let aletText = dogName + ": Sorry you are too late!"
    let alertText = "\(dogName): haha nice to you meet you" // formatted string
    let alert = UIAlertController(title: alertText , message: nil, preferredStyle: UIAlertControllerStyle.alert)
    let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
}







