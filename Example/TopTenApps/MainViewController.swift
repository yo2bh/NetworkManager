//
//  ViewController.swift
//  TopTenApps
//
//  Created by Yogesh Bharate on 1/2/20.
//  Copyright © 2020 Bharate, Yogesh. All rights reserved.
//

import UIKit
import NetworkManager

class MainViewController: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Variables
  var topAppsModel = [Artists]()
  var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .large, color: UIColor.black, placeInTheCenterOf: view)
    tableView.tableFooterView = UIView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    activityIndicator.startAnimating()
    tableView.isHidden = true
    getTopTenApps()
  }
  
  func getTopTenApps() {
    NetworkManager.shared.sendRequest(urlString: Constants.url, type: .Get, parameters: nil) { (data, error) in
      guard let data = data else {
        print((error?.localizedDescription)!)
        return
      }
      
      guard let response = try? JSONDecoder().decode(TopTenAppsModel.self, from: data) else {
        print(Constants.decodeError)
        return
      }
      var artists = [Artists]()
      for artist in response.feed.results {
        artists.append(artist)
      }
      print(artists)
      self.topAppsModel = artists
      DispatchQueue.main.async {
        self.activityIndicator.stopAnimating()
        self.tableView.reloadData()
        self.tableView.isHidden = false
      }
    }
  }
}

// MARK: - Table view delegate methods
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier)
    cell?.textLabel?.text = topAppsModel[indexPath.row].artistName
    let appIconURL = URL(string: topAppsModel[indexPath.row].artistUrl)
    do {
     cell?.imageView?.image = UIImage(data: try Data(contentsOf: appIconURL!))
    } catch let error {
      print("Error - \(error.localizedDescription)")
    }
    
    return cell!
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return topAppsModel.count
  }
}
