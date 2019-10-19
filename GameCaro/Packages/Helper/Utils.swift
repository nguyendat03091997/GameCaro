//
//  Utils.swift
//  GameCaro
//
//  Created by Mojave on 10/4/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    class func drawRimView(view: UIView,radius: CGFloat){
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    
    class func createImage(name: String) ->UIImage{
        return UIImage.init(named: name)?.withRenderingMode(.alwaysOriginal) ?? UIImage()
    }
    
    class func formatData(_ data: String) ->String{
        let temp = data.replacingOccurrences(of: "T", with: " ")
        return String(temp.prefix(19))
    }
    
    class func checkHorizontal(_ matrix: Array<Array<Int>>,_ x: Int,_ y: Int) -> Bool {
        var countLeft = 0
        var countRight = 0
        
        // check left
        if(y != 0){
            for i in (1...y).reversed() {
                if(matrix[x][i-1] == 0 || matrix[x][i-1] == 2){
                    break
                }else{
                    countLeft += 1
                }
            }
        }
        
        // check right
        if(y != 9){
            for i in y...8 {
                if(y == 9){
                    break
                }
                if(matrix[x][i+1] == 0 || matrix[x][i+1] == 2){
                    break
                }else{
                    countRight += 1
                }
            }
        }
        
        if((countLeft + countRight + 1) >= 5){
            return true
        }
        
        return false
    }
    
    class func checkVertical(_ matrix: Array<Array<Int>>,_ x: Int,_ y: Int) -> Bool {
        var countUp = 0
        var countDown = 0
        
        // check up
        if(x != 0){
            for i in (1...x).reversed() {
                if(matrix[i-1][y] == 0 || matrix[i-1][y] == 2){
                    break
                }else{
                    countDown += 1
                }
            }
        }
        
        // check down
        if(x != 9){
            for i in x...8 {
                if(matrix[i+1][y] == 0 || matrix[i+1][y] == 2){
                    break
                }else{
                    countUp += 1
                }
            }
        }
        
        if((countUp + countDown + 1) >= 5){
            return true
        }
        
        return false
    }
    
    class func checkMainDiagonal(_ matrix: Array<Array<Int>>,_ x: Int,_ y: Int) -> Bool {
        var countUp = 0
        var countDown = 0
        var xTemp = x
        var yTemp = y
        
        //check up
        if(x != 0 && y != 9){
            for _ in y...8 {
                xTemp -= 1
                yTemp += 1
                if(xTemp < 0){
                    break
                }
                if(matrix[xTemp][yTemp] == 0 || matrix[xTemp][yTemp] == 2){
                    break
                }else{
                    countUp += 1
                }
            }
        }
        
        //check down
        xTemp = x
        yTemp = y
        if(x != 9 && y != 0){
            for _ in x...8 {
                xTemp += 1
                yTemp -= 1
                if(yTemp < 0){
                    break
                }
                if(matrix[xTemp][yTemp] == 0 || matrix[xTemp][yTemp] == 2){
                    break
                }else{
                    countDown += 1
                }
            }
        }
        
        if((countUp + countDown + 1) >= 5){
            return true
        }
        
        return false
    }
    
    class func checkDiagonal(_ matrix: Array<Array<Int>>,_ x: Int,_ y: Int) -> Bool {
        var countUp = 0
        var countDown = 0
        var xTemp = x
        var yTemp = y
        
        //check up
        if(x != 0 && y != 0){
            for _ in (1...x).reversed() {
                xTemp -= 1
                yTemp -= 1
                if(yTemp < 0){
                    break
                }
                if(matrix[xTemp][yTemp] == 0 || matrix[xTemp][yTemp] == 2){
                    break
                }else{
                    countUp += 1
                }
            }
        }
        
        //check down
        xTemp = x
        yTemp = y
        if(x != 9 && y != 9){
            for _ in y...8 {
                xTemp += 1
                yTemp += 1
                if(xTemp > 9){
                    break
                }
                if(matrix[xTemp][yTemp] == 0 || matrix[xTemp][yTemp] == 2){
                    break
                }else{
                    countDown += 1
                }
            }
        }
        
        if((countUp + countDown + 1) >= 5){
            return true
        }
        
        return false
    }
    
    class func checkResult(_ matrix: Array<Array<Int>>,_ x: Int,_ y: Int) ->Bool{
        if(checkHorizontal(matrix, x, y) || checkVertical(matrix, x, y) || checkMainDiagonal(matrix, x, y) || checkDiagonal(matrix, x, y)){
            return true
        }
        return false
    }
    
}
