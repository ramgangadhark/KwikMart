//
//  AddCartViewController.swift
//  KwikMart-Project
//
//  Created by Ram on 18/03/21.
//

import UIKit

class AddCartViewController: UIViewController {

    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemDescriptionLbl: UILabel!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var itemName:String?
    var itemImage:String?
    var itemOffer:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        //imgView.image = UIImage(named: itemImage!)
        print(itemImage ?? "No Image")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
