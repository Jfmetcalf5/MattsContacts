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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func sortMissionaries() -> [Missionary] {
        let missionaries = MissionaryController.shared.missionaries
        let sortedMissionaries = missionaries.sorted(by: {$0.lastName ?? "" < $1.lastName ?? ""})
        return sortedMissionaries
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortMissionaries().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionaryCell", for: indexPath)
        
        let missionary = sortMissionaries()[indexPath.row]
        if let first = missionary.name, let last = missionary.lastName {
            if first == last {
                cell.textLabel?.text = first
            } else {
                cell.textLabel?.text = "\(first) \(last)"
            }
        }
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedMissionary = sortMissionaries()[indexPath.row]
            MissionaryController.shared.delete(missionary: selectedMissionary)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMissionaryDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? MissionaryDetailViewController else { return }
            let missionary = sortMissionaries()[indexPath.row]
            detailVC.missionary = missionary
        }
    }
}
