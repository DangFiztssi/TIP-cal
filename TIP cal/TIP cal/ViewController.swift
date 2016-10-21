//
//  ViewController.swift
//  TIP cal
//
//  Created by Nguyen Dang on 10/20/16.
//  Copyright © 2016 Nguyen Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    //MARK: View
    @IBOutlet weak var textFieldCost: UITextField!
    @IBOutlet weak var labelPercentTip: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var sliderPercentTip: UISlider!
    
    var cost:Float = 0
    var tip:Float = 20
    
    //MARK: Action
    @IBAction func changeValuePercentTip(_ sender: UISlider) {
        let pc:Int  = Int(sender.value)
        labelPercentTip.text = "\(pc)%"
        tip = Float(pc)
        changeTotal()
        self.view.backgroundColor = UIColor (colorLiteralRed: 160/tip, green: 97/tip, blue: 5/tip, alpha: 0.6)
    }
    
    func changeTotal() {    
        let total:Float = cost*(1.0 + tip/100)
        labelTotal.text = "$" + String.init(format: "%.2f", total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textFieldCost.keyboardType = .decimalPad
        
        textFieldCost.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldCost.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let check = Float(textField.text!){
            cost = check
        }
        else {
         cost = 0
        }

        changeTotal()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

