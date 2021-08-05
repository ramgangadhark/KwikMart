//
//  CollectionTableViewCell.swift
//  KwikMart-Project
//
//  Created by Ram on 16/03/21.
//

import UIKit

class CollectionTableViewCell2: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "CollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell2")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as! CollectionViewCell2
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.borderWidth = 2
        cell.itemImageView.image = UIImage(named: DataManager.shared.itemsList[indexPath.row].itemImage)
        cell.offerTxtLbl.text = "21% OFF"
        cell.itemDescriptionTxtLbl.text = DataManager.shared.itemsList[indexPath.row].itemDescription
        cell.priceTxtLbl.text = "₹ 45"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 225)
    }
    
}
