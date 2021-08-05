//
//  CollectionViewCell3.swift
//  KwikMart-Project
//
//  Created by Ram on 17/03/21.
//

import UIKit

class CollectionViewCell3: UICollectionViewCell {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var offerLbl: UILabel!
    var addBtn: UIButton!
    @IBOutlet weak var sellerLbl: UILabel!
    @IBOutlet weak var DescriptionLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        addBtn = UIButton()
        addBtn.frame = CGRect(x: 0, y: 0, width: 161, height: 25)
        buttonView.addSubview(addBtn)
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.topAnchor.constraint(equalTo: buttonView.topAnchor).isActive = true
        addBtn.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
        addBtn.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor).isActive = true
        addBtn.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor).isActive = true
        
        
    }

}
