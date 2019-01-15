//
//  RGBViewController.swift
//  RgbHex
//
//  Created by Артем on 29/11/2018.
//  Copyright © 2018 Gukov.space. All rights reserved.
//

import UIKit

class RGBViewController: UIViewController {
    
    @IBOutlet weak var viewPreview: UIView!
    
    @IBOutlet weak var viewRedRGB: UIView!
    @IBOutlet weak var viewGreenRGB: UIView!
    @IBOutlet weak var viewBlueRGB: UIView!
    @IBOutlet weak var viewAlphaRGB: UIView!

    @IBOutlet weak var labelHEX: UILabel!
    
    @IBOutlet weak var textValueRed: UITextField!
    @IBOutlet weak var textValueGreen: UITextField!
    @IBOutlet weak var textValueBlue: UITextField!
    @IBOutlet weak var textValueAlpha: UITextField!
    
    @IBOutlet weak var buttonConvert: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.cornerRadius = 5
        viewPreview.layer.cornerRadius = 15
        
        labelHEX.text = ""
        
        viewRedRGB.layer.cornerRadius = 15
        viewGreenRGB.layer.cornerRadius = 15
        viewBlueRGB.layer.cornerRadius = 15
        viewAlphaRGB.layer.cornerRadius = 15
        
        buttonConvert.layer.cornerRadius = 15
    }
    
    func convertToHex() {
        var valueRedHex = Double(textValueRed.text!)
        var valueGreenHex = Double(textValueGreen.text!)
        var valueBlueHex = Double(textValueBlue.text!)
        var valueAlphaHex = Double(textValueAlpha.text!)

        if valueRedHex != nil {
            if valueRedHex! > 255 {
                valueRedHex = 255
                textValueRed.text = String(Int(valueRedHex!))
            }
        } else { return }
        
        if valueGreenHex != nil {
            if valueGreenHex! > 255 {
                valueGreenHex = 255
                textValueGreen.text = String(Int(valueGreenHex!))
            }
        } else { return }
        
        if valueBlueHex != nil {
            if valueBlueHex! > 255 {
                valueBlueHex = 255
                textValueBlue.text = String(Int(valueBlueHex!))
            }
        } else { return }

        if valueAlphaHex == nil || (valueAlphaHex! < 0.0 && valueAlphaHex! > 1.0) {
            valueAlphaHex = 1.0
            textValueAlpha.text = String(valueAlphaHex!)
            }
        
        let stringRedHex = String(format: "%02X", Int(valueRedHex!))
        let stringGreenHex = String(format: "%02X", Int(valueGreenHex!))
        let stringBlueHex = String(format: "%02X", Int(valueBlueHex!))
        let stringAlphaHex = String(format: "%02X", valueAlphaHex!)
        
        labelHEX.text = "HEX # \(stringRedHex)\(stringGreenHex)\(stringBlueHex)"
        viewPreview.backgroundColor = UIColor(red: CGFloat(valueRedHex! / 255.0),
                                            green: CGFloat(valueGreenHex! / 255.0),
                                            blue: CGFloat(valueBlueHex! / 255.0),
                                            alpha: CGFloat(valueAlphaHex!))
    }
    
    @IBAction func actionButtonConvert(_ sender: UIButton) {
    convertToHex()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
}





