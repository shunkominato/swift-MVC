//
//  ViewController.swift
//  Swift-MVC
//
//  Created by macbook on 2021/02/22.
//

import UIKit

class ViewController: UIViewController,NowScoreDelegate {

    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxlavel: UILabel!
    
    var correctCount = 0
    var wroungCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    let imageList = ImageList()
    var pickedAnswer = false
    
    var withOutMP3 = WithOutMP3()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        correctCount = 0
        wroungCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imageList.list[0].imageText)
        
        if UserDefaults.standard.object(forKey:"beforeCount") != nil{
            maxScore = UserDefaults.standard.object(forKey:"beforeCount") as! Int
            
        }
        
        maxlavel.text = String(maxScore)
        
    }

    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1 {
            pickedAnswer
             = true
            withOutMP3.playSound(filename: "maruSound", extensionName: "mp3")
            
        } else if (sender as AnyObject).tag == 2 {
            pickedAnswer = false
            
        }
        
        check()
        nextQuestions()
    }
    
    func check() {
        let correctAnswer = imageList.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            print("seikai")
            correctCount = correctCount + 1
        } else {
            print("matigai")
            wroungCount = wroungCount + 1
        }
        
    }
    
    func nextQuestions() {
        if questionNumber <= 9 {
            questionNumber = questionNumber + 1
            imageView.image = UIImage(named: imageList.list[questionNumber].imageText)
        }else {
            print("終了")
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    func nowScore(score: Int) {
        maxScore = score
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextVC = segue.destination as! NextViewController
            nextVC.correctedCount = correctCount
            nextVC.wroungedCount = wroungCount
            nextVC.delegate = self
        }
    }
    
}

