//
//  FilmsViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Emily on 1/22/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit
class FilmsViewController: UITableViewController {
    var allInfo:[NSDictionary] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllFilms(completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"]{
//                        let resultsArray = results as! NSArray
                        self.allInfo = results as! [NSDictionary]
//                        for i in resultsArray{
//                            let filmsDict = i as! NSDictionary
//                            self.films.append(filmsDict["title"] as! String)
//                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("error!")
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FilmsViewController viewWillAppear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allInfo.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        cell.textLabel?.text = allInfo[indexPath.row].value(forKey: "title") as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "filmsDetailMission", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! NSIndexPath
        let characterInfo = allInfo[indexPath.row]
        
        let detailVC = segue.destination as! filmsDetailViewController
        
        detailVC.labelText1 = characterInfo["title"] as! String
        detailVC.labelText2 = characterInfo["release_date"] as! String
        detailVC.labelText3 = characterInfo["director"] as! String
        detailVC.labelText4 = characterInfo["opening_crawl"] as! String
    }
}

