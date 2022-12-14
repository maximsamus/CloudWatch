//
//  WeatherViewController.swift
//  CloudWatch
//
//  Created by Максим Самусь on 8.12.2022.
//

import UIKit

final class WeatherViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let searchController = UISearchController(searchResultsController: nil)
    var citiesWeather: [WeatherResponse]?
    var filterCitiesWeather = [WeatherResponse]()
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var isFiltering: Bool {
        searchController.isActive && !searchBarIsEmpty
    }
    private let cities = [
        "Warsaw",
        "Bucharest",
        "Martuni",
        "Budapest",
        "Munich",
        "Palermo",
        "Bremen",
        "Florence",
        "Buenos-Aires",
        "Valencia"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "CityCell")
        view.backgroundColor = .black
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.searchTextField.textColor = .white
        dismissKeyboardOnTap()
        addCities()
    }
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) else { return }
        performSegue(withIdentifier: "showDetail", sender: selectedCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        if isFiltering {
            let filterWeather = filterCitiesWeather[indexPath.row]
            detailVC.weather = filterWeather
        } else {
            guard let weather = citiesWeather?[indexPath.row] else { return }
            detailVC.weather = weather
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filterCitiesWeather.count
        }
        return citiesWeather?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else { return UITableViewCell() }
        if isFiltering {
            guard let city = filterCitiesWeather[indexPath.row].data.first else { return CityCell() }
            cell.configure(weather: city)
        } else {
            guard let city = citiesWeather?[indexPath.row].data.first else { return CityCell() }
            cell.configure(weather: city)
        }
        return cell
    }
}

// MARK: - Search bar

extension WeatherViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterText(searchController.searchBar.text ?? "")
    }
    
    private func filterText(_ searchText: String) {
        guard let weatherData = citiesWeather else { return }
        filterCitiesWeather = weatherData.filter { dataWeahter -> Bool in
            (dataWeahter.data.first?.cityName.contains(searchText))!
        }
        tableView.reloadData()
    }
}

// MARK: - Private Methods

extension WeatherViewController {
    
    private func addCities() {
        NetworkManager.shared.getCitiesWeather(cities: cities) { weather in
            self.citiesWeather = weather
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
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
