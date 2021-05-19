//
//  ViewController.swift
//  CHI_Internship_Countries
//
//  Created by Pro on 07.05.2021.
//

import UIKit

class RootViewController: UIViewController {
    
    let regions = ["all", "africa", "americas", "asia", "europe", "oceania"]
    var countries: [Country] = []
    var urlString = "https://restcountries-v1.p.rapidapi.com/"
    
    @IBOutlet weak var regionsCollectionView: UICollectionView!
    @IBOutlet weak var countriesTableView: UITableView!
    @IBOutlet weak var regionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupTableView()
        title = "REGIONS"
        urlString += "all" // Initial value
        generateCountries()
    }
    
    //MARK: - DataSource
    func generateCountries() {
        DataManager.generateRequest(urlString, responce: {
            (data, response, error) in
            guard let nonOptionalData = data else { return }
            if (error != nil) {
                print("\(String(describing: error?.localizedDescription))")
            } else {
                do {
                    let json = try JSONDecoder().decode([Country].self, from: nonOptionalData)
                    self.countries = json
                } catch {
                    self.showError()
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
                DispatchQueue.main.async {
                    self.countriesTableView.reloadData()
                }
            }
        })
    }
    
    func updateURLString(tail: String) {
        let rootURLString = "https://restcountries-v1.p.rapidapi.com/"
        if tail == "all" {
            urlString = rootURLString + tail
        } else {
            urlString = rootURLString + "region/" + tail
        }
    }
    
    //MARK: - Private Methods
    private func setupTableView() {
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "countriesTableViewCell")
    }
    
    private func setupCollectionView() {
        regionsCollectionView.delegate = self
        regionsCollectionView.dataSource = self
        regionsCollectionView.register(RegionCollectionViewCell.nib, forCellWithReuseIdentifier: RegionCollectionViewCell.reuseID)
        regionsCollectionView.cellForItem(at: IndexPath.init(row: 0, section: 0))?.backgroundColor = .lightGray
        
    
    }
    
    private func showError() {
        let alertController = UIAlertController(title: "Sorry!", message: "This country was not found :(", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }
}

