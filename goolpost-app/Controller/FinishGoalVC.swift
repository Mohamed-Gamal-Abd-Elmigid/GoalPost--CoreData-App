//
//  FinishGoalVC.swift
//  goolpost-app
//
//  Created by mac on 4/7/20.
//  Copyright © 2020 ASD. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController , UITextFieldDelegate
{

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription : String!
    var goalType : GoalType!
    
    func initData(description : String , type : GoalType)
    {
        self.goalDescription = description
        self.goalType = type
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createGoalBtn.bindToKeybord()
        pointsTextField.delegate = self
    }
    

    @IBAction func createGoalBtnWasPressed(_ sender: Any)
    {
        // Pass Data To Core Data Goal Model
        if pointsTextField.text != ""
        {
        self.save { (complete) in
            if complete
            {
                //dismiss(animated: true, completion: nil)
                if let mainVc = storyboard?.instantiateViewController(identifier: "GoalVC"){
                    presentDetail(mainVc)
                } else {
                    print("Error in Moving to Goal VC")
                }
                
            }
            }
        }
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any)
    {
        dismissDetail()
    }
    
    func save(complition : (_ finished : Bool) -> ())
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        do
        {
            try managedContext.save()
            print("Success Save")
            complition(true)
        }
        catch
        {
            debugPrint("Could Not Save: \(error.localizedDescription)")
            complition(false)
        }
    }
    
    
}
