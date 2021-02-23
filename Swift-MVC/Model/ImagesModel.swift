//
//  ImagesModel.swift
//  Swift-MVC
//
//  Created by macbook on 2021/02/22.
//

import Foundation

class ImagesModel {
    let imageText:String
    let answer:Bool
    
    init(imageName:String, correctOrNot:Bool){
        imageText = imageName
        answer = correctOrNot
    }
}
