//
//  MissionaryListTableViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/7/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class MissionaryListTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.isHidden = true
        searchBar.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        searchBar.returnKeyType = .done
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MissionaryController.shared.fetchMissionaries()
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
            MissionaryController.shared.fetchMissionaries()
            tableView.reloadData()
        }
    }
    
    func filterContent(searchText: String) {
        MissionaryController.shared.fetchMissionariesWith(searchTerm: searchText)
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            MissionaryController.shared.fetchMissionaries()
            tableView.reloadData()
        }
        
        if MissionaryController.shared.missionaries.count == 0 {
            MissionaryController.shared.fetchMissionaries()
            searchBar.text = ""
            tableView.reloadData()
        }
        searchBar.isHidden = true
        searchBar.resignFirstResponder()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MissionaryController.shared.missionaries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionaryCell", for: indexPath)
        
        let missionary = MissionaryController.shared.missionaries[indexPath.row]
        if let first = missionary.name, let last = missionary.lastName {
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
            let selectedMissionary = MissionaryController.shared.missionaries[indexPath.row]
            MissionaryController.shared.delete(missionary: selectedMissionary)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
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
