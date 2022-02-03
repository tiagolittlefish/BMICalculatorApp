//
//  ViewController.swift
//  BMICalculator
//
//  Created by Tiago Peixinho on 02/02/22.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heighNumberLabel: UILabel!
    @IBOutlet weak var weightNumberLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heighNumberLabel.text! = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //        String(format: "%.0f", sender.value) ou:
        let weight = Int(sender.value)
        weightNumberLabel.text! = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        performSegue(withIdentifier: "goToResult", sender: self )
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
}

