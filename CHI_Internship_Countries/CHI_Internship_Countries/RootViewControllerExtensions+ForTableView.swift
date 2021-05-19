//
//  TableView+Extensions.swift
//  CHI_Internship_Countries
//
//  Created by Pro on 18.05.2021.
//

import Foundation
import UIKit

//MARK: - UITableViewDataSource
extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: "countriesTableViewCell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.optionalCountryName = countries[indexPath.row].name
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
