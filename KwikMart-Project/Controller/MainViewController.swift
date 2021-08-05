//
//  ViewController.swift
//  KwikMart-Project
//
//  Created by Ram on 15/03/21.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mainView1LeadingAnchor: NSLayoutConstraint!
    @IBOutlet weak var mainView1TrailingAnchor: NSLayoutConstraint!
    @IBOutlet weak var mainView1: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sideViewLeadingAnchor: NSLayoutConstraint!
    @IBOutlet weak var sideViewWidthAnchor: NSLayoutConstraint!
    var mainTableView:UITableView!
    var isSideViewShowing = false
    var btn:UIButton!
    var menuView:UIView!
    var isMenuViewShowing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        handleGestureRecogniser()
        createTableView()
        btn = UIButton()
        btn.frame = CGRect(x: 300, y: 800, width: 100, height: 35)
        btn.setTitle("Menu", for: UIControl.State.normal)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        mainTableView.addSubview(btn)
        btn.addTarget(self, action:  #selector(onClickOfBtn), for: UIControl.Event.touchUpInside)
        creatingMenuView()
        menuView.isHidden = true
        isMenuViewShowing = true

        
    }
    @objc func onClickOfBtn()
    {
        if (isMenuViewShowing == true) {
            menuView.isHidden = false
            btn.setTitle("Colse", for: UIControl.State.normal)
        }else{
            btn.setTitle("Menu", for: UIControl.State.normal)
            menuView.isHidden = true
        }
        isMenuViewShowing = !isMenuViewShowing
    }
    func creatingMenuView()
    {
        menuView = UIView()
        menuView.frame = CGRect(x: 125, y: 375, width: 300, height: 400)
        menuView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        menuView.clipsToBounds = true
        menuView.layer.cornerRadius = 12
        mainTableView.addSubview(menuView)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let off = self.mainTableView.contentOffset.y
        btn.frame = CGRect(x: 300, y: off + 800, width: btn.frame.width, height: btn.frame.height)
        menuView.frame = CGRect(x: 125, y: off + 375, width: menuView.frame.width, height: menuView.frame.height)
    }
    override func viewDidAppear(_ animated: Bool) {
        if(sideViewWidthAnchor.constant == 270)
        {
            sideViewLeadingAnchor.constant = -270
            mainView1TrailingAnchor.constant = 0
            mainView1LeadingAnchor.constant = 0
            print("SideView Leading")
            print(sideViewLeadingAnchor.constant)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        }else if(sideViewWidthAnchor.constant == 350)
        {
            sideViewLeadingAnchor.constant = -350
            mainView1TrailingAnchor.constant = 0
            print(sideViewLeadingAnchor.constant)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        }else{
            sideViewLeadingAnchor.constant = -450
            mainView1TrailingAnchor.constant = 0
            print(sideViewLeadingAnchor.constant)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func handleGestureRecogniser(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)

            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//
//        mainView1.addGestureRecognizer(tapGesture)
//
//        mainView1.isUserInteractionEnabled = true
    }
    
//    @objc func handleTap(_ sender: UITapGestureRecognizer) {
//        print("User Tapped")
//        if(sideViewWidthAnchor.constant == 270)
//        {
//            sideViewLeadingAnchor.constant = -270
//            mainView1TrailingAnchor.constant = 0
//            print(sideViewLeadingAnchor.constant)
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }else if(sideViewWidthAnchor.constant == 350)
//        {
//            sideViewLeadingAnchor.constant = -350
//            mainView1TrailingAnchor.constant = 0
//            print(sideViewLeadingAnchor.constant)
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }else{
//            sideViewLeadingAnchor.constant = -450
//            mainView1TrailingAnchor.constant = 0
//            print(sideViewLeadingAnchor.constant)
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }
//    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                sideViewLeadingAnchor.constant = 0
                mainView1TrailingAnchor.constant = -270
                mainView1LeadingAnchor.constant = 5
                UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
            case .down:
                print("Swiped down")
            case .left:
                print("Swiped left")
                if(sideViewWidthAnchor.constant == 270)
                {
                    sideViewLeadingAnchor.constant = -270
                    mainView1TrailingAnchor.constant = 0
                    mainView1LeadingAnchor.constant = 0
                    print(sideViewLeadingAnchor.constant)
                    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                        self.view.layoutIfNeeded()
                    })
                }else if(sideViewWidthAnchor.constant == 350)
                {
                    sideViewLeadingAnchor.constant = -350
                    mainView1TrailingAnchor.constant = 0
                    print(sideViewLeadingAnchor.constant)
                    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                        self.view.layoutIfNeeded()
                    })
                }else{
                    sideViewLeadingAnchor.constant = -450
                    mainView1TrailingAnchor.constant = 0
                    print(sideViewLeadingAnchor.constant)
                    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                        self.view.layoutIfNeeded()
                    })
                }
            case .up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    @IBAction func onTapOfBarBtnItem(_ sender: UIBarButtonItem)
    {
        if(isSideViewShowing)
        {
            if(sideViewWidthAnchor.constant == 270)
            {
                sideViewLeadingAnchor.constant = -270
                mainView1TrailingAnchor.constant = 0
                print(sideViewLeadingAnchor.constant)
                UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
            }else if(sideViewWidthAnchor.constant == 350)
            {
                sideViewLeadingAnchor.constant = -350
                mainView1TrailingAnchor.constant = 0
                print(sideViewLeadingAnchor.constant)
                UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
            }else{
                sideViewLeadingAnchor.constant = -450
                mainView1TrailingAnchor.constant = 0
                print(sideViewLeadingAnchor.constant)
                UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
        else
        {
            sideViewLeadingAnchor.constant = 0
            mainView1TrailingAnchor.constant = -270
            mainView1LeadingAnchor.constant = 5
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            })
        }
        isSideViewShowing = !isSideViewShowing
    }
//    func createTableView()
//       {
//        //var someVar:Int?
//           self.mainTableView = UITableView(frame: mainView1.frame, style: UITableView.Style.grouped)
//           let cell = UINib(nibName: "PageControlTableViewCell", bundle: nil)
//        mainTableView.register(cell, forCellReuseIdentifier: "PageControlTableViewCell")
//           self.mainTableView.delegate = self
//           self.mainTableView.dataSource = self
//           self.mainTableView.backgroundColor = UIColor.white
//        //self.mainTableView.separatorColor = UIColor.clear
//        mainView1.addSubview(self.mainTableView)
//        mainTableView.translatesAutoresizingMaskIntoConstraints = false
//        mainTableView.topAnchor.constraint(equalTo: mainView1.topAnchor).isActive = true
//        mainTableView.leftAnchor.constraint(equalTo: mainView1.leftAnchor).isActive = true
//        mainTableView.rightAnchor.constraint(equalTo: mainView1.rightAnchor).isActive = true
//        mainTableView.bottomAnchor.constraint(equalTo: mainView1.bottomAnchor).isActive = true
//       }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = mainTableView.dequeueReusableCell(withIdentifier: "PageControlTableViewCell", for: indexPath) as! PageControlTableViewCell
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
    
    
    
    
    
    func createTableView()
       {
        mainTableView = UITableView(frame: mainView1.frame, style: UITableView.Style.grouped)
        mainTableView.register(UINib(nibName: "PageControlTableViewCell", bundle: nil), forCellReuseIdentifier: "PageControlTableViewCell")
        mainTableView.register(UINib(nibName: "CollectionTableViewCell2", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell2")
        mainTableView.register(UINib(nibName: "CollectionTableViewCell3", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell3")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        //self.mainTableView.backgroundColor = UIColor.white
        mainTableView.separatorColor = UIColor.clear
        mainView1.addSubview(self.mainTableView)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: mainView1.topAnchor).isActive = true
        mainTableView.leftAnchor.constraint(equalTo: mainView1.leftAnchor).isActive = true
        mainTableView.rightAnchor.constraint(equalTo: mainView1.rightAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: mainView1.bottomAnchor).isActive = true
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
            return "Vegitables"
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0)
        {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "PageControlTableViewCell", for: indexPath) as! PageControlTableViewCell
            return cell
        }
//        else if(indexPath.row == 1){
//            let cell = mainTableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell2", for: indexPath) as! CollectionTableViewCell2
//            return cell
//        }
        else{
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell3", for: indexPath) as! CollectionTableViewCell3
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
   
}


