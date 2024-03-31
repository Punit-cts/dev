//
//  UserSelectionViewController.swift
//  ParentalControl
//
//  Created by Punit Thakali on 31/03/2024.
//

import UIKit

class UserSelectionViewController: UIViewController, UserParentSelectionViewDelegate {

    @IBOutlet weak var parentSelectionView: UserParentSelectionView!
    @IBOutlet weak var childSelectionView: UserChildSelectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "User Views"
        
        // Set the delegate
        parentSelectionView.delegate = self
    }
        
        // MARK: - UserParentSelectionViewDelegate
        
    func userParentSelectionViewDidTap(_ view: UserParentSelectionView) {
        guard let navigationController = self.navigationController else {
            fatalError("UserSelectionViewController is not embedded in a UINavigationController")
        }
        
        // Instantiate LoggedInViewController from its own storyboard
        let storyboard = UIStoryboard(name: "LoggedInViewController", bundle: nil)
        let loggedInVC = storyboard.instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInViewController
        navigationController.pushViewController(loggedInVC, animated: true)
    }
}
