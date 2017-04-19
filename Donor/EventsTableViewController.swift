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

    // MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Variables
    
    var selectedEvent: Event?
    
    var eventInfoViewController: EventInfoViewController!
    
    // MARK: - Actions
    
    @IBAction func refreshDidTouch(_ sender: UIBarButtonItem) {
        DataLoader.shared.getEvents()
        performUIUpdatesOnMain {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func backDidTouch(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extensions

// MARK: - UITableViewDelegate, UITableViewDataSource
extension EventsTableViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Profile.shared.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = Profile.shared.events[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.event, for: indexPath) as? EventViewCell {
            cell.configureCell(event: event)
            return cell
        } else {
            return EventViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedEvent = Profile.shared.events[(indexPath as NSIndexPath).row]
        performSegue(withIdentifier: "toEventInfo", sender: self)
    }
}

// MARK: - Transitions
extension EventsTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEventInfo" {
            let vc = segue.destination as! EventInfoViewController
            self.eventInfoViewController = vc
            vc.event = selectedEvent
        }
    }
}
