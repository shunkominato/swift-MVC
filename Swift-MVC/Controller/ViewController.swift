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
    
    var soundFile = SoundFile()
    var changeColor = ChangeColor()
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.layer.cornerRadius = 20.0
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
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
            soundFile.playSound(filename: "maruSound", extensionName: "mp3")
            
        } else if (sender as AnyObject).tag == 2 {
            pickedAnswer = false
            soundFile.playSound(filename: "batsuSound", extensionName: "mp3")
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
        soundFile.playSound(filename: "sound", extensionName: "mp3")
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

