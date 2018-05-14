//
//  EveryoneListTableViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/14/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class EveryoneListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.shared.persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = PersonController.shared.persons[indexPath.row]
        
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let selectedPerson = PersonController.shared.persons[indexPath.row]
            
            PersonController.shared.delete(person: selectedPerson)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonDetail" {
            guard let detailVC = segue.destination as? EveryoneDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            let person = PersonController.shared.persons[indexPath.row]
            detailVC.person = person
        }
    }
}
