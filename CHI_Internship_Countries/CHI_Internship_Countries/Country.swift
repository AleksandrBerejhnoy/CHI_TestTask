//
//  Country.swift
//  CHI_Internship_Countries
//
//  Created by Pro on 07.05.2021.
//
import Foundation

class Country: Codable {
    let name: String
    let capital: String
    let region: String
    let subregion: String
    let population: Int
    let timezones: [String]
    
    init(name: String, capital: String, region: String, subregion: String, population: Int, timezones: [String]?) {
        self.name = name
        self.capital = capital
        self.region = region
        self.subregion = subregion
        self.population = population
        
        if let saveTimeZones = timezones {
            self.timezones = saveTimeZones
        } else {
            self.timezones = []
        }
    }
}
