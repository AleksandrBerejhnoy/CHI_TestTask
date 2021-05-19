//
//  DetailViewController.swift
//  CHI_Internship_Countries
//
//  Created by Pro on 18.05.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var optionalCountryName: String?
    private var textView = UITextView()
    private var urlString = "https://restcountries-v1.p.rapidapi.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = optionalCountryName
        setupTextViewSettings()
        
        checkCountryName()
        
    }
    
    //MARK: - Private methods
    private func setupTextViewSettings() {
        textView.frame = self.view.frame
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.allowsEditingTextAttributes = false
        textView.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(textView)
    }
    
    private func checkCountryName() {
        guard let nonOptionalCountry = optionalCountryName else { return }
        let countryURL = nonOptionalCountry.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        guard let nonOptionalCountryURL = countryURL else { return }
        loadCountry(countryName: nonOptionalCountryURL)
    }
    
    private func loadCountry(countryName: String) {
        
        var country: Country?
        
        let urlString = "https://restcountries-v1.p.rapidapi.com/name/" + countryName
        
        DataManager.generateRequest(urlString, responce: {
            (data, response, error) in
            guard let nonOptionalData = data else { return }
            if (error != nil) {
                print("\(String(describing: error?.localizedDescription))")
            } else {
                do {
                    let json = try JSONDecoder().decode([Country].self, from: nonOptionalData)
                    country = json[0]
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
                DispatchQueue.main.async {
                    self.printCountryProperties(country: country)
                }
            }
        })
    }
    
    private func printCountryProperties(country: Country?) {
        guard let nonOptionalCountry = country else { return }
        textView.text = """
                            Country name: \(nonOptionalCountry.name)
                            Populations: \(nonOptionalCountry.population)
                            Capital: \(nonOptionalCountry.capital)
                            Region: \(nonOptionalCountry.region)
                            Subregion: \(nonOptionalCountry.subregion)
                            Timezone: \(nonOptionalCountry.timezones)
                            """
    }
    
}
