//
//  ContainerViewController.swift
//  KwikMart-Project
//
//  Created by Ram on 18/03/21.
//

import UIKit

class ContainerViewController: UIViewController {

    var loginBtn:UIButton!
    var signUpBtn:UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createLoginViewUI()
    }
    
    func createLoginViewUI()
    {
        loginBtn = UIButton()
        loginBtn.frame = CGRect(x: 20, y: 50, width: 160, height: 45)
        loginView.addSubview(loginBtn)
        signUpBtn = UIButton()
        signUpBtn.frame = CGRect(x: 20, y: 150, width: 160, height: 45)
        loginView.addSubview(signUpBtn)
        
        
        
        loginBtn.backgroundColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.layer.cornerRadius = 20
        //loginBtn.layer.spinnerColor = .white
        signUpBtn.backgroundColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        signUpBtn.setTitle("SignUp", for: .normal)
        signUpBtn.layer.cornerRadius = 20
        //signUpBtn.spinnerColor = .white
        
        loginBtn.addTarget(self, action: #selector(onTapOfLoginBtn(Btn:)), for: UIControl.Event.touchUpInside)
        signUpBtn.addTarget(self, action: #selector(onTapOfSignUpBtn(Btn:)), for: UIControl.Event.touchUpInside)
        mainView.isHidden = true
    }

    @objc func onTapOfLoginBtn(Btn:UIButton){
        print("Login")
        
    }
    @objc func onTapOfSignUpBtn(Btn:UIButton){
        print("SignUp")
        
    }
}
