//
//  NextViewController.swift
//  Swift-MVC
//
//  Created by macbook on 2021/02/22.
//

import UIKit

protocol NowScoreDelegate{
    func nowScore(score:Int)
}

class NextViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wroungLabel: UILabel!
    var correctedCount = Int()
    var wroungedCount = Int()
    var beforeCount = Int()
    
    var delegate:NowScoreDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctLabel.text = String(correctedCount)
        wroungLabel.text = String(wroungedCount)
        if UserDefaults.standard.object(forKey:"beforeCount") != nil{
            beforeCount = UserDefaults.standard.object(forKey:"beforeCount") as! Int
            
        }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func back(_ sender: Any) {
        
        if beforeCount < correctedCount {
            UserDefaults.standard.set(correctedCount, forKey:"beforCount")
            delegate?.nowScore(score:correctedCount)
        } else if beforeCount > correctedCount {
            UserDefaults.standard.set(beforeCount, forKey:"beforCount")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
