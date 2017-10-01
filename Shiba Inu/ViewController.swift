//
//  ViewController.swift
//  Shiba Inu
//
//  Created by Olivia on 2017-09-28.
//  Copyright © 2017 Olivia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var dogTitle: String?
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    let data = (sender.titleLabel?.text == "Boys") ? DataSource().boys : DataSource().girls
    self.dogTitle = sender.titleLabel?.text
    performSegue(withIdentifier: "showDogs", sender: data)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDogs" {
      let dogsTVC = segue.destination as? DogTableViewController
      dogsTVC?.navigationItem.title = self.dogTitle
      dogsTVC?.dogs = sender as! [String:String]
    }
  }
}



