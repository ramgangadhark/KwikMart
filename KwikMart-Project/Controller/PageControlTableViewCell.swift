//
//  PageControlTableViewCell.swift
//  KwikMart-Project
//
//  Created by Ram on 16/03/21.
//

import UIKit

class PageControlTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControlCollectionView: UICollectionView!
    var timer:Timer?
    var currentIndex:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        pageControlCollectionView.register(UINib(nibName: "PageControlCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PageControlCollectionViewCell")
        pageControlCollectionView.delegate = self
        pageControlCollectionView.dataSource = self
        pageControl.numberOfPages = DataManager.shared.itemsList.count
        startTimer()
        handleGestureRecogniser()
        // Initialization code
    }
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    func handleGestureRecogniser(){
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
//            swipeRight.direction = .right
//            self.pageControlCollectionView.addGestureRecognizer(swipeRight)
//
//            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
//        swipeLeft.direction = .left
//            self.pageControlCollectionView.addGestureRecognizer(swipeLeft)
        
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))

        pageControlCollectionView.addGestureRecognizer(tapGesture)

        pageControlCollectionView.isUserInteractionEnabled = true
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
        print("User Tapped")
          timer?.invalidate()
          timer = nil
        startTimer()
        
    }
//    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
//
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//
//            switch swipeGesture.direction {
//            case .right:
//                print("Swiped right")
//
//            case .down:
//                print("Swiped down")
//            case .left:
//                print("Swiped left")
//            case .up:
//                print("Swiped up")
//            default:
//                break
//            }
//        }
//    }
    
    
    
    
    
    @objc func moveToNextIndex()
    {
        if(currentIndex < DataManager.shared.itemsList.count-1)
        {
            currentIndex += 1
        }else
        {
            currentIndex = 0
        }
        
        pageControlCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        pageControl.currentPage = currentIndex
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.itemsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pageControlCollectionView.dequeueReusableCell(withReuseIdentifier: "PageControlCollectionViewCell", for: indexPath) as! PageControlCollectionViewCell
        cell.pageControlImageView.image = UIImage(named: "\(DataManager.shared.itemsList[indexPath.row].itemImage)")
        cell.nameLbl.text = DataManager.shared.itemsList[indexPath.row].itemName
        cell.offerLbl.text = DataManager.shared.itemsList[indexPath.row].itemDetails.Offer
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageControlCollectionView.frame.width, height: pageControlCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


