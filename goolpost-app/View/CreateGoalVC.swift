//
//  CreateGoalVC.swift
//  goolpost-app
//
//  Created by mac on 4/6/20.
//  Copyright © 2020 ASD. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController , UITextViewDelegate {

    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType : GoalType = .shorTerm
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        goalTextView.delegate = self
        nextBtn.bindToKeybord()
        shortTermButton.setSelectedColor()
        longTermButton.setDeslectedColor()
        
        
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any)
    {
            goalType = .shorTerm
            shortTermButton.setSelectedColor()
            longTermButton.setDeslectedColor()
        
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any)
    {
        goalType = .longTerm
        shortTermButton.setDeslectedColor()
        longTermButton.setSelectedColor()
      

   }
    @IBAction func nextBtnWasPressed(_ sender: Any)
    {
        if goalTextView.text != "" && goalTextView.text != "What is your goal ?"
        {
            guard let finishGoalVC = storyboard?.instantiateViewController(identifier: "FinishGoalVC") as? FinishGoalVC else {return}
            
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presintSecondaruDetail(finishGoalVC)
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any)
    {
        dismissDetail()
    
    }
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
   
}
