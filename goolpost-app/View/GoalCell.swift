//
//  GoalCell.swift
//  goolpost-app
//
//  Created by mac on 4/4/20.
//  Copyright © 2020 ASD. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescription: UILabel!
    
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func  configureCell(goal : Goal)
    {
        self.goalDescription.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(goal.goalProgress)
        
        
        // Completion View
        
        if goal.goalProgress == goal.goalCompletionValue
        {
            self.completionView.isHidden = false
        }
        else
        {
            self.completionView.isHidden = true
        }
        
    }

        
   
}
