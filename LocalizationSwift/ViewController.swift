//
//  ViewController.swift
//  LocalizationSwift
//
//  Created by Sneha Gargade on 02/02/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var lblFname: UILabel!
    @IBOutlet weak var lblLname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let savedText = UserDefaults.standard.string(forKey: "language"),
                   let selectedIndex = UserDefaults.standard.value(forKey: "selectedSegmentIndex") as? Int {
                    // Set the selected segment control index
                    seg.selectedSegmentIndex = selectedIndex
                    // Update the UI based on the selected language
                    languageChange(strLng: savedText)
                }
    }

    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        UserDefaults.standard.set(seg.selectedSegmentIndex, forKey: "selectedSegmentIndex")
        if seg.selectedSegmentIndex == 0{
            UserDefaults.standard.set("en", forKey: "language")
           
        }else{
            UserDefaults.standard.set("hi", forKey: "language")
        }
        // Call languageChange to update the UI
              if let savedText = UserDefaults.standard.string(forKey: "language") {
                  languageChange(strLng: savedText)
              }
    }
    
    func languageChange(strLng: String){
        lblFname.text = "FirstNameKey".localizableString(loc: strLng)
        lblLname.text = "LastNameKey".localizableString(loc: strLng)
    }
    
    
}
extension String {
    func localizableString(loc: String) -> String{
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,bundle: bundle!, comment: "")
    }
}

