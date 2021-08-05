//
//  ViewController1.swift
//  KwikMart-Project
//
//  Created by Ram on 16/03/21.
//

import UIKit

class ViewController1: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var mainTableView:UITableView!
    var btn:UIButton!
    var menuView:UIView!
    var isMenuViewShowing = false
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Do any additional setup after loading the view.
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
    
    func createTableView()
       {
        mainTableView = UITableView(frame: view.frame, style: UITableView.Style.grouped)
        mainTableView.register(UINib(nibName: "PageControlTableViewCell", bundle: nil), forCellReuseIdentifier: "PageControlTableViewCell")
        mainTableView.register(UINib(nibName: "CollectionTableViewCell2", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell2")
        mainTableView.register(UINib(nibName: "CollectionTableViewCell3", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell3")
           mainTableView.delegate = self
           mainTableView.dataSource = self
           //self.mainTableView.backgroundColor = UIColor.white
        mainTableView.separatorColor = UIColor.clear
        view.addSubview(self.mainTableView)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let off = self.mainTableView.contentOffset.y
        btn.frame = CGRect(x: 300, y: off + 800, width: btn.frame.width, height: btn.frame.height)
        menuView.frame = CGRect(x: 125, y: off + 375, width: menuView.frame.width, height: menuView.frame.height)
    }
    
    @IBAction func cartBtnAction(_ sender: UIBarButtonItem) {
    }
    
}
