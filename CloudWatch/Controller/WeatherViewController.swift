//
//  WeatherViewController.swift
//  CloudWatch
//
//  Created by Максим Самусь on 8.12.2022.
//

import UIKit

class WeatherViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let cities = [
        "Warsaw",
        "Bucharest",
        "Martuni",
        "Budapest",
        "Munich",
        "Palermo",
        "Bremen",
        "Florence",
        "Buenos Aires",
        "Valencia"
    ]
    //    var citiesArray = [Current]()
    //    let emptyCity = Current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "CityCell")
        view.backgroundColor = .black
        searchBar.barTintColor = .black
        searchBar.searchTextField.textColor = .white
        searchBar.delegate = self
        dismissKeyboardOnTap()
        
//        NetworkManager.shared.fetchWeather(cityName: "Buenos Aires") { weather in
//            print(weather)
//        }
        //                if citiesArray.isEmpty {
        //                    citiesArray = Array(repeating: emptyCity, count: cities.count)
        //                }
        //
        //                addCities()
        //
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else { return UITableViewCell() }
        cell.cityLabel.text = cities[indexPath.row]
        //        cell.configure(with: city)
        //        cell.updateImage(with: city)
        return cell
    }
}

// MARK: - Search bar

extension WeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let cityName = searchBar.text else { return }
        //        NetworkManager.shared.searchStarships(for: shipName, where: NetworkManager.Link.starships.rawValue) { starships in
        //            self.items = starships.all
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}

// MARK: - Private Methods

extension WeatherViewController {
    
    //    func addCities() {
    //
    //        NetworkManager.shared.getCitiesWeather(cities: cities) { index, weather in
    //            self.citiesArray[index] = weather.current
    //            //            self.citiesArray[index].name = self.cities[index]
    //            print(self.citiesArray)
    //            print(weather.current)
    //        }
    //
    //    }
    
    private func dismissKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
