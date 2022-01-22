//
//  CalculatorViewController.swift
//  Conversion Calculator
//
//  Created by Jack Riebel on 12/6/21.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var converterButton: UIButton!
    @IBOutlet weak var posNegButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var conversionView: UITextField!
    @IBOutlet weak var convertedView: UITextField!
    @IBOutlet weak var conversionType: UITextField!
    @IBOutlet weak var convertedType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var recievedIndex = 0
    
    @IBAction func convert(_ sender: UIButton?) {
        
        switch sender {
            case zeroButton:
                conversionView.text? += "0"
            break
            case oneButton:
                conversionView.text? += "1"
            break
            case twoButton:
                conversionView.text? += "2"
            break
            case threeButton:
                conversionView.text? += "3"
            break
            case fourButton:
                conversionView.text? += "4"
            break
            case fiveButton:
                conversionView.text? += "5"
            break
            case sixButton:
                conversionView.text? += "6"
            break
            case sevenButton:
                conversionView.text? += "7"
            break
            case eightButton:
                conversionView.text? += "8"
            break
            case nineButton:
                conversionView.text? += "9"
            break
            case decimalButton:
                conversionView.text? += "."
            break
            case posNegButton:
                let text = conversionView.text!
                let double = Double(text)
                if double == nil {
                    return
                }
                var number = double!
                
                if (number > 0) {
                    number = (0 - number);
                }
                else if (number < 0) {
                    number = (0 - number);
            }
                conversionView.text = String(number)
            break
            case clearButton:
                conversionView.text = ""
                convertedView.text = ""
            break
            default:
                conversionView.text? += ""
    }
        
        let index = recievedIndex
        
        if index == 0 {
        
        let text = conversionView.text!
        let double = Double(text)
        if double == nil {
            return
        }
        var number = double!
            
        number = (number - 32) * 5/9
            
        convertedView.text = String(number)
        }
        else if index == 1 {
            
            let text = conversionView.text!
            let double = Double(text)
            if double == nil {
                return
            }
            var number = double!
                
            number = (number * 9/5) + 32
                
            convertedView.text = String(number)

        }
        else if index == 2 {
            
            let text = conversionView.text!
            let double = Double(text)
            if double == nil {
                return
            }
            var number = double!
                
            number = number * 1.609
                
            convertedView.text = String(number)

        }
        else if index == 3 {
            
            let text = conversionView.text!
            let double = Double(text)
            if double == nil {
                return
            }
            var number = double!
                
            number = number / 1.609
                
            convertedView.text = String(number)

        }
    }
    
    @IBAction func displayActionSheet(_ sender: Any) {
        
        let arraySelect = ["Fahrenheit to Celsius", "Celsius to Fahrenheit", "Miles to Kilometers", "Kilometers to Miles"]

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)

        let closure = { [self] (action: UIAlertAction!) -> Void in
            let index = alert.actions.firstIndex(of: action)
            
            if index == nil {
                recievedIndex = 0
            }
            else{
                recievedIndex = index!
            }
            
            if recievedIndex == 0 {
                self.conversionType.text = "F°"
                self.convertedType.text = "C°"
                convert(nil)
            }
            if recievedIndex == 1 {
                self.conversionType.text = "C°"
                self.convertedType.text = "F°"
                convert(nil)
            }
            if recievedIndex == 2 {
                self.conversionType.text = "mi"
                self.convertedType.text = "km"
                convert(nil)
            }
            if recievedIndex == 3 {
                self.conversionType.text = "km"
                self.convertedType.text = "mi"
                convert(nil)
            }

            if index != nil {
                NSLog("Index: \(index!)")
            }
            if recievedIndex != index {
                recievedIndex = index!
            }
            
        }
        
      

        for field in arraySelect {
            alert.addAction(UIAlertAction(title: field, style: .default, handler: closure))
        }

        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: {(_) in }))

        self.present(alert, animated: false, completion: nil)

        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


