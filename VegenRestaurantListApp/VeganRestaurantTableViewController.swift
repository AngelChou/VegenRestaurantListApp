//
//  VeganRestaurantTableViewController.swift
//  VegenRestaurantListApp
//
//  Created by Shun-Ching, Chou on 2019/4/15.
//  Copyright © 2019 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class VeganRestaurantTableViewController: UITableViewController {
    
    var venues: [Venue] = []
    
    struct PropertyKeys {
        static let cellId = "restaurantCell"
        static let searchRequest = "https://api.foursquare.com/v2/venues/search"
        static let clientId = "PHN45IU5MG4MMAAISFR3AKFJWC2AYAHX2QPDPA3QTAQG2OBP"
        static let clientSecret = "4NW0VHVDTJZDW1ND3RQWX4YRDVWCQM3FBQOQABFKGBWIAPUO"
        static let near = "taipei,taiwan"
        static let v = "20190410"
        static let categoryId = "4bf58dd8d48988d1d3941735" //Vegan Restaurant
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "\(PropertyKeys.searchRequest)?near=\(PropertyKeys.near)&client_id=\(PropertyKeys.clientId)&client_secret=\(PropertyKeys.clientSecret)&v=\(PropertyKeys.v)&categoryId=\(PropertyKeys.categoryId)"
        if let url = URL(string: urlString) {

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                if let data = data, let result = try? decoder.decode(VeganRestaurant.self, from: data) {
                    self.venues = result.response.venues
                
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            task.resume()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return venues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.cellId, for: indexPath)

        // Configure the cell...
        let venue = venues[indexPath.row]
        cell.textLabel?.text = venue.name
        
        var address = ""
        for formattedAddress in venue.location.formattedAddress {
            address.append(formattedAddress)
            address.append(",")
        }
        address.removeLast()
        cell.detailTextLabel?.text = address
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let controller = segue.destination as? VeganRestaurantViewController, let row = tableView.indexPathForSelectedRow?.row {
            controller.venue = venues[row]
        }
    }
 

}
