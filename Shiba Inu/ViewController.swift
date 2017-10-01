//
//  ViewController.swift
//  Shiba Inu
//
//  Created by Olivia on 2017-09-28.
//  Copyright © 2017 Olivia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBAction func buttonPressed(_ sender: UIButton) {
    let data = (sender.titleLabel?.text == "Boys") ? DataSource().boys : DataSource().girls
    performSegue(withIdentifier: "showDogs", sender: data)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDogs" {
      let dogsTVC = segue.destination as? DogTableViewController
      dogsTVC?.dogs = sender as! [String:String]
    }
  }
}



