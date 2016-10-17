//
//  DetailViewController.swift
//  AC3.2-Violations
//
//  Created by Erica Y Stevens on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //Things left to do: Annotate with comments, try and add some auto-layout and scroling for portrait orientation
    
    @IBOutlet weak var dba: UILabel!
    @IBOutlet weak var cuisineDescription: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var boroZipcode: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var inspectionDate: UILabel!
    @IBOutlet weak var inspectionType: UILabel!
    @IBOutlet weak var criticalFlag: UILabel!
    @IBOutlet weak var action: UILabel!
    @IBOutlet weak var violationDescription: UILabel!
    @IBOutlet weak var violationCode: UILabel!
    
    var dbaString = ""
    var cuisineDescriptionString = ""
    var addressString = ""
    var boroZipcodeString = ""
    var phoneNumberString = ""
    var scoreString = ""
    var inspectionDateString = ""
    var inspectionTypeString = ""
    var criticalFlagString = ""
    var actionString = ""
    var violationDescriptionString = ""

    override func viewDidLoad() {
        dba.text = dbaString
        cuisineDescription.text = cuisineDescriptionString
        address.text = addressString
        boroZipcode.text = boroZipcodeString
        phoneNumber.text = phoneNumberString
        score.text = scoreString
        inspectionDate.text = inspectionDateString
        inspectionType.text = inspectionTypeString
        criticalFlag.text = criticalFlagString
                        switch criticalFlagString {
                        case "Not Critical":
                            criticalFlag.textColor = UIColor.white
                        case "Critical":
                            criticalFlag.backgroundColor = UIColor.red
                            criticalFlag.textColor = UIColor.white
                        default:
                            break
                        }

        action.text = actionString
        violationDescription.text = violationDescriptionString
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
