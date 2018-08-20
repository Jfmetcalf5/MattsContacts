//
//  EveryoneListTableViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/14/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class EveryoneListTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var sorterSegment: UISegmentedControl!
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
        sortBasedOnIndex(sorterSegment)
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
    
    
    @IBAction func sortBySomething(_ sender: UISegmentedControl) {
        sortBasedOnIndex(sender)
    }
    
    func sortBasedOnIndex(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            PersonController.shared.persons = PersonController.shared.persons.sorted(by: {$0.lastName ?? "" < $1.lastName ?? ""})
            tableView.reloadData()
        }
        if sender.selectedSegmentIndex == 1 {
            PersonController.shared.persons = PersonController.shared.persons.sorted(by: {$0.lastVisit ?? Date() > $1.lastVisit ?? Date()})
            tableView.reloadData()
        }
        if sender.selectedSegmentIndex == 2 {
            PersonController.shared.persons = PersonController.shared.persons.sorted(by: {$0.birthday ?? Date() > $1.birthday ?? Date()})
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.shared.persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yy"
        dateFormatter.dateStyle = .short
        
        let person = PersonController.shared.persons[indexPath.row]
        
        guard let first = person.name else { return cell }
        
        if let last = person.lastName {
            cell.textLabel?.text = "\(last) \(first)"
            cell.detailTextLabel?.text = ""
        } else {
            cell.textLabel?.text = "\(first)"
            cell.detailTextLabel?.text = ""
        }
        if sorterSegment.selectedSegmentIndex == 1 {
            if let personDate = person.lastVisit {
                cell.detailTextLabel?.text = dateFormatter.string(from: personDate)
            } else {
                cell.detailTextLabel?.text = ""
            }
        }
        if sorterSegment.selectedSegmentIndex == 2 {
            if let personBirthday = person.birthday {
                cell.detailTextLabel?.text = dateFormatter.string(from: personBirthday)
            } else {
                cell.detailTextLabel?.text = ""
            }
        }
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedPerson = PersonController.shared.persons[indexPath.row]
            PersonController.shared.delete(person: selectedPerson)
            try? CoreDataStack.context.save()
            tabBarController?.selectedIndex = 0
            tabBarController?.selectedIndex = 1
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
