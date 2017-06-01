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

final class EventsTableViewController: BasicViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Variables
    
    var selectedEvent: Event?
    
    var selectedIndexPath: Int?
    
    var eventInfoViewController: EventInfoViewController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func refreshDidTouch(_ sender: UIBarButtonItem) {
        showActivityIndicator()
        DataLoader.shared.getEvents()
        self.tableView.reloadData()
        hideActivityIndicator()
    }
    
    @IBAction func backDidTouch(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extensions

// MARK: - UITableViewDelegate, UITableViewDataSource
extension EventsTableViewController {
    
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
        selectedIndexPath = indexPath.row
        performSegue(withIdentifier: Segue.toEventInfo, sender: self)
    }
}

// MARK: - Transitions
extension EventsTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toEventInfo {
            let vc = segue.destination as! EventInfoViewController
            self.eventInfoViewController = vc
            vc.event = selectedEvent
            vc.index = selectedIndexPath
        }
    }
}
