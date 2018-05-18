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
    
    func sortPeople() -> [Person] {
        let persons = PersonController.shared.persons
        let sortedPersons = persons.sorted(by: {$0.lastName ?? "" < $1.lastName ?? ""})
        return sortedPersons
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortPeople().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = sortPeople()[indexPath.row]
        
        if let first = person.name, let last = person.lastName {
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
            
            let selectedPerson = sortPeople()[indexPath.row]
            
            PersonController.shared.delete(person: selectedPerson)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonDetail" {
            guard let detailVC = segue.destination as? EveryoneDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            let person = sortPeople()[indexPath.row]
            detailVC.person = person
        }
    }
}
