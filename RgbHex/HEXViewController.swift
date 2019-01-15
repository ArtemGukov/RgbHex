//
//  HEXViewController.swift
//  RgbHex
//
//  Created by Артем on 29/11/2018.
//  Copyright © 2018 Gukov.space. All rights reserved.
//

import UIKit

class HEXViewController: UIViewController {
    
    @IBOutlet weak var viewPreview: UIView!

    @IBOutlet weak var textValueHEX: UITextField!

    @IBOutlet weak var viewRedHEX: UIView!
    @IBOutlet weak var viewGreenHEX: UIView!
    @IBOutlet weak var viewBlueHEX: UIView!
    @IBOutlet weak var viewAlphaHEX: UIView!
    
    @IBOutlet weak var labelRedValue: UILabel!
    @IBOutlet weak var labelGreenValue: UILabel!
    @IBOutlet weak var labelBlueValue: UILabel!
    @IBOutlet weak var labelAlphaValue: UILabel!
    
    @IBOutlet weak var buttonConvert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.layer.cornerRadius = 5
        viewPreview.layer.cornerRadius = 15
        
        viewRedHEX.layer.cornerRadius = 15
        viewGreenHEX.layer.cornerRadius = 15
        viewBlueHEX.layer.cornerRadius = 15
        viewAlphaHEX.layer.cornerRadius = 15
        
        buttonConvert.layer.cornerRadius = 15
    }

    func alertWrongMessage() {
        let alert = UIAlertController(title: "Invalid number of HEX characters",
                                      message: "Enter 6 characters",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func convertToRgb() {
    
        var hexString = String(textValueHEX.text!)
        guard hexString.isEmpty == false else { return }
        
        if hexString.hasPrefix("#") {
                hexString.remove(at: hexString.startIndex)
            }
        
        if hexString.characters.count < 6 {
            alertWrongMessage()
            return
        }
        
        let scanner = Scanner(string: hexString as String)
        //print(hexString)
            
        let mask = 0x000000FF
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
            
        let valueRed = Int(color >> 16) & mask
        let valueGreen = Int(color >> 8) & mask
        let valueBlue = Int(color) & mask
            
        //print("\(valueRed),\(valueGreen),\(valueBlue)")
            
        labelRedValue.text = String(valueRed)
        labelGreenValue.text = String(valueGreen)
        labelBlueValue.text = String(valueBlue)
        labelAlphaValue.text = String(1.0)
        
        labelRedValue.isHidden = false
        labelGreenValue.isHidden = false
        labelBlueValue.isHidden = false
        labelAlphaValue.isHidden = false
        
        viewPreview.backgroundColor = UIColor(red: CGFloat(Double(valueRed) / 255.0),
                                              green: CGFloat(Double(valueGreen) / 255.0),
                                              blue: CGFloat(Double(valueBlue) / 255.0),
                                              alpha: CGFloat(1.0))
    }
    
    @IBAction func buttonActionConvert(_ sender: UIButton) {
        convertToRgb()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
}
