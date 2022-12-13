//
//  WeatherViewController.swift
//  CloudWatch
//
//  Created by Максим Самусь on 8.12.2022.
//

import UIKit

class WeatherViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var citiesWeather: [WeatherResponse]?
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
//        searchBar.barTintColor = .black
//        searchBar.searchTextField.textColor = .white
//        searchBar.delegate = self
        dismissKeyboardOnTap()
        addCities()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) else { return }
        performSegue(withIdentifier: "showDetail", sender: selectedCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let weather = citiesWeather?[indexPath.row] else { return }
            detailVC.weather = weather
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        citiesWeather?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else { return UITableViewCell() }
        guard let city = citiesWeather?[indexPath.row].data.first else { return CityCell() }
        cell.configure(weather: city)
        return cell
    }
}

// MARK: - Search bar

//extension WeatherViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let cityName = searchBar.text else { return }
//        //        NetworkManager.shared.searchStarships(for: shipName, where: NetworkManager.Link.starships.rawValue) { starships in
//        //            self.items = starships.all
//        self.tableView.reloadData()
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.text = nil
//        searchBar.resignFirstResponder()
//        tableView.reloadData()
//    }
//}

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
