//
//  RGBViewController.swift
//  RgbHex
//
//  Created by Артем on 29/11/2018.
//  Copyright © 2018 Gukov.space. All rights reserved.
//

import UIKit

class RGBViewController: UIViewController {
    
    @IBOutlet var rgbaStackView: [UIView]!
    @IBOutlet var rgbaStackText: [UITextField]!
    @IBOutlet weak var buttonConvert: UIButton!

    var valueRGB = Value()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 5
        viewSettingsOne()
    }
    
    func viewSettingsOne() {
        rgbaStackView[0].layer.cornerRadius = rgbaStackView[0].bounds.height / 2
        rgbaStackView[1].layer.cornerRadius = rgbaStackView[1].bounds.height / 2
        rgbaStackView[2].layer.cornerRadius = rgbaStackView[2].bounds.height / 2
        rgbaStackView[3].layer.cornerRadius = rgbaStackView[3].bounds.height / 2
        
        buttonConvert.layer.cornerRadius = buttonConvert.bounds.height / 2
    }
    
    func alertWrongMessage(message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func textChange(_ sender: Any) {
        
        valueRGB.valueRedHex = Int(rgbaStackText[0].text!)
        valueRGB.valueGreenHex = Int(rgbaStackText[1].text!)
        valueRGB.valueBlueHex = Int(rgbaStackText[2].text!)
        valueRGB.valueAlphaHex = Double(rgbaStackText[3].text!)
        
        if valueRGB.valueRedHex != nil {
            if valueRGB.valueRedHex! > 255 {
                alertWrongMessage(message: "Red from 0 to 255 units")
                valueRGB.valueRedHex = 255
                rgbaStackText[0].text = String(valueRGB.valueRedHex!)
            }
            //print(valueRedHex!)
        }
        
        if valueRGB.valueGreenHex != nil {
            if valueRGB.valueGreenHex! > 255 {
                alertWrongMessage(message: "Green from 0 to 255 units")
                valueRGB.valueGreenHex = 255
                rgbaStackText[1].text = String(valueRGB.valueGreenHex!)
            }
            //print(valueGreenHex!)
        }
 
        if valueRGB.valueBlueHex != nil {
            if valueRGB.valueBlueHex! > 255 {
                alertWrongMessage(message: "Blue from 0 to 255 units")
                valueRGB.valueBlueHex = 255
                rgbaStackText[2].text = String(valueRGB.valueBlueHex!)
            }
            //print(valueBlueHex!)
        }
        
        if valueRGB.valueAlphaHex != nil {
            if (valueRGB.valueAlphaHex! < 0 || valueRGB.valueAlphaHex! > 1) {
                alertWrongMessage(message: "Alpha from 0 to 1.0 units")
                valueRGB.valueAlphaHex = 1
                rgbaStackText[3].text = String(valueRGB.valueAlphaHex!)
            }
        //print(valueAlphaHex!)
    }
}

/*
    func convertToHex() {
        
        let stringRedHex = String(format: "%02X", valueRedHex!)
        let stringGreenHex = String(format: "%02X", valueGreenHex!)
        let stringBlueHex = String(format: "%02X", valueBlueHex!)
        let stringAlphaHex = String(format: "%02X", valueAlphaHex!)

        let viewHex = UIColor(red: CGFloat(valueRedHex! / 255),
            green: CGFloat(valueGreenHex! / 255),
            blue: CGFloat(valueBlueHex! / 255),
            alpha: CGFloat(valueAlphaHex!))
        
        print("HEX # \(stringRedHex) \(stringGreenHex) \(stringBlueHex)")
        print(viewHex)
        //labelHEX.text = "HEX # \(stringRedHex)\(stringGreenHex)\(stringBlueHex)"
//        viewPreview.backgroundColor = UIColor(red: CGFloat(valueRedHex! / 255.0),
//                                            green: CGFloat(valueGreenHex! / 255.0),
//                                            blue: CGFloat(valueBlueHex! / 255.0),
//                                            alpha: CGFloat(valueAlphaHex!))
    }
 
    */
    @IBAction func actionButtonConvert(_ sender: UIButton) {
        if valueRGB.valueRedHex == nil || valueRGB.valueGreenHex == nil || valueRGB.valueBlueHex == nil || valueRGB.valueAlphaHex == nil { return }
        else {
        //print(valueRGB)
    }
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
}



