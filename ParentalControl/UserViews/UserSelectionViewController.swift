//
//  UserSelectionViewController.swift
//  ParentalControl
//
//  Created by Punit Thakali on 31/03/2024.
//

import UIKit

class UserSelectionViewController: UIViewController {

    @IBOutlet weak var parentSelectionView: UserParentSelectionView!
    @IBOutlet weak var childSelectionView: UserChildSelectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "User Views"
    }

}
