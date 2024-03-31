//
//  UserChildSelectionView.swift
//  ParentalControl
//
//  Created by Punit Thakali on 31/03/2024.
//

import UIKit

class UserChildSelectionView: UIView {

    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let name = String(describing: type(of: self))
        bundle.loadNibNamed(name, owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    @IBOutlet weak var userDepententLabel: UILabel!
    @IBOutlet weak var userDependentImageView: UIImageView!
}
