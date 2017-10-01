//
//  ViewController.swift
//  Shiba Inu
//
//  Created by Olivia on 2017-09-28.
//  Copyright © 2017 Olivia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let dogsTVC = segue.destination as? DogTableViewController
    if segue.identifier == "dogs.boys" {
      dogsTVC?.dogs = DataSource().boys
    }
    else if segue.identifier == "dogs.girls" {
      dogsTVC?.dogs = DataSource().girls
    }
  }
}



