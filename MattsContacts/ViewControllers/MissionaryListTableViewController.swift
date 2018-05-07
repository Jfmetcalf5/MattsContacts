//
//  MissionaryListTableViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/7/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class MissionaryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MissionaryController.shared.missionaries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionaryCell", for: indexPath)
        
        let missionary = MissionaryController.shared.missionaries[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let birthDate = dateFormatter.string(from: missionary.birthday ?? Date())
        
        cell.textLabel?.text = missionary.name
        cell.detailTextLabel?.text = birthDate
        
        return cell
    }

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

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMissionaryDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
            let detailVC = segue.destination as? MissionaryDetailViewController else { return }
            let missionary = MissionaryController.shared.missionaries[indexPath.row]
            detailVC.missionary = missionary
        }
    }

}
