//
//  EveryoneListTableViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/14/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class EveryoneListTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.isHidden = true
        searchBar.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        searchBar.delegate = self
        searchBar.returnKeyType = .done
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PersonController.shared.fetchPersons()
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar.text = ""
        searchBar.isHidden = true
        searchBar.resignFirstResponder()
    }
    
    @IBAction func searchButtonTapped(_ sender: UIBarButtonItem) {
        searchBar.isHidden = false
        navigationController?.navigationBar.addSubview(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != "" {
            filterContent(searchText: searchBar.text ?? "")
        } else {
            PersonController.shared.fetchPersons()
            tableView.reloadData()
        }
    }
    
    func filterContent(searchText: String) {
        PersonController.shared.fetchPersonsWith(searchTerm: searchText)
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            PersonController.shared.fetchPersons()
            tableView.reloadData()
        }
        
        if PersonController.shared.persons.count == 0 {
            PersonController.shared.fetchPersons()
            searchBar.text = ""
            tableView.reloadData()
        }
        searchBar.isHidden = true
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.shared.persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = PersonController.shared.persons[indexPath.row]
        if let first = person.name, let last = person.lastName {
            if first == last {
                cell.textLabel?.text = first
            } else {
                cell.textLabel?.text = "\(last) \(first)"
            }
        }
        
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
