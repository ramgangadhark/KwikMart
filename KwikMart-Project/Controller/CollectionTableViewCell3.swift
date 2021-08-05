//
//  CollectionTableViewCell3.swift
//  KwikMart-Project
//
//  Created by Ram on 17/03/21.
//

import UIKit

class CollectionTableViewCell3: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    

    @IBOutlet weak var collectionView: UICollectionView!
    var addCartVC:UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "CollectionViewCell3", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell3")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell3", for: indexPath) as! CollectionViewCell3
        
        
        //cell.layer.borderColor = UIColor.orange.cgColor
        //cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 6.0
        //cell.layer.borderWidth = 2.0
        //cell.layer.borderColor = #colorLiteral(red: 0.2379680276, green: 0.639169991, blue: 0.9538950324, alpha: 1)
        cell.layer.masksToBounds = true

//        layer.shadowColor = UIColor.lightGray.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        layer.shadowRadius = 6.0
//        layer.shadowOpacity = 1.0
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
//        layer.backgroundColor = UIColor.clear.cgColor
        cell.imgView.image = UIImage(named: DataManager.shared.itemsList[indexPath.row].itemImage)
        cell.priceLbl.text = "₹\(DataManager.shared.itemsList[indexPath.row].itemPrice)"
        cell.DescriptionLbl.text = DataManager.shared.itemsList[indexPath.row].itemName
        cell.sellerLbl.text = DataManager.shared.itemsList[indexPath.row].itemDescription
        cell.offerLbl.text = DataManager.shared.itemsList[indexPath.row].itemDetails.Offer
        cell.addBtn.layer.cornerRadius = 7.0
        cell.addBtn.layer.borderWidth = 1.0
        
        cell.addBtn.setTitle("ADD", for: UIControl.State.normal)
        cell.addBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
        cell.addBtn.backgroundColor = #colorLiteral(red: 0.2379680276, green: 0.639169991, blue: 0.9538950324, alpha: 1)
        cell.addBtn.tag = indexPath.row
        cell.addBtn.addTarget(self, action: #selector(onClickOfAddBtn), for: UIControl.Event.touchUpInside)
        return cell
    }
    
    @objc func onClickOfAddBtn(sender:UIButton)
    {
        print(sender.tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt-\(indexPath.row)")
        
        let addCartVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "AddCartViewController") as! AddCartViewController
        //self.ViewController?.navigationController?.pushViewController(addCartVC, animated: true)
//        addCartVC.imgView.image = UIImage(named: DataManager.shared.itemsList[indexPath.row].itemImage)
//        addCartVC.offerLbl.text = DataManager.shared.itemsList[indexPath.row].itemDetails.Offer
//        addCartVC.itemDescriptionLbl.text = DataManager.shared.itemsList[indexPath.row].itemDescription
        //addCartVC.itemImage = DataManager.shared.itemsList[indexPath.row].itemImage
        //UINavigationController.pushViewController(addCartVC)
        //addCartVC.modalPresentationStyle = .fullScreen
                           
    
        //UINavigationController.pushViewController(addCartVC)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 225)
    }
}
extension UINavigationController {
    
    func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func popViewController(animated: Bool = true, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
    
    func popToRootViewController(animated: Bool = true, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToRootViewController(animated: animated)
        CATransaction.commit()
    }
}
