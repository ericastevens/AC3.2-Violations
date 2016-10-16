//
//  ViolationsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Erica Y Stevens on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {
    
    var violations = [Violation]()

    override func viewDidLoad() {
        loadData()
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return violations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "violationCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = violations[indexPath.row].dba
        cell.detailTextLabel?.text = violations[indexPath.row].cuisineDescription
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? DetailViewController {
            if let cell = sender as? UITableViewCell {
                let indexPath = self.tableView.indexPath(for: cell)
                vc.dbaString = "\(violations[(indexPath?.row)!].dba)"
                vc.cuisineDescriptionString = "\(violations[(indexPath?.row)!].cuisineDescription)"
                vc.addressString = "\(violations[(indexPath?.row)!].buildingNumber) \(violations[(indexPath?.row)!].streetName)"
                vc.boroZipcodeString = "\(violations[(indexPath?.row)!].boro), NY \(violations[(indexPath?.row)!].zipcode)"
                vc.phoneNumberString = "\(violations[(indexPath?.row)!].phoneNumber)"
                vc.scoreString = "Score: \(violations[(indexPath?.row)!].score)"
                vc.criticalFlagString = "\(violations[(indexPath?.row)!].criticalFlag)"
                vc.inspectionTypeString = "\(violations[(indexPath?.row)!].inspectionType)"
                vc.inspectionDateString = "\(violations[(indexPath?.row)!].inspectionDate)"
                vc.actionString = "\(violations[(indexPath?.row)!].action)"
                vc.violationDescriptionString = "\(violations[(indexPath?.row)!].violationDescription)"
            }
        }
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }
        
        if let violations = violationsJSON as? [[String:Any]] {
            for violationDict in violations {
                if let ep = Violation(withDict: violationDict as! [String : String]) {
                    self.violations.append(ep)
                }
            }
        }
    }

}
