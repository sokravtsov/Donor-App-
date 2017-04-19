//
//  EventsTableViewController.swift
//  Donor
//
//  Created by Sergey Kravtsov on 18.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class EventsTableViewController: BasicViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    // MARK: - Actions
    
    @IBAction func refreshDidTouch(_ sender: UIBarButtonItem) {
        DataLoader.shared.getEvents()
        tableView.reloadData()
    }
    
    @IBAction func backDidTouch(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension EventsTableViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Profile.shared.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = Profile.shared.events[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EventViewCell {
            cell.configureCell(event: event)
            return cell
        } else {
            return EventViewCell()
        }
    }
}
