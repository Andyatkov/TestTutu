//
//  searchViewController.swift
//  tutuTestAndreyDyatkov
//
//  Created by Andrey on 23.03.16.
//  Copyright © 2016 DyatkovAndrey. All rights reserved.
//

import UIKit
//Контроллер реализующий поиск по станциям
class SearchViewController :  UIViewController, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarFrom: UISearchBar!
    @IBOutlet weak var searchBarTo: UISearchBar!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    
    var data: Array<Array<Station>> = Array<Array<Station>>()
    var filteredData: Array<Array<Station>> = Array<Array<Station>>()
    var searchBarIndex:Int = 0
    var strDate:String = "Выбрать дату"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBarFrom.delegate = self
        searchBarTo.delegate = self
        
        ManagerStation.getСitiesTo{ (allStation) -> Void in
            self.data.appendContentsOf(allStation)
            self.filteredData.appendContentsOf(allStation)
        }
        
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        segmentedControl.setTitle(strDate, forSegmentAtIndex: 2)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell")! as UITableViewCell
        cell.textLabel?.text = filteredData[searchBarIndex][indexPath.section].stations[indexPath.row].station
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData[searchBarIndex][section].stations.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (filteredData[searchBarIndex].count)
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filteredData[searchBarIndex][section].cityTitle! + "," + filteredData[searchBarIndex][section].countryTitle!
    }
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        if(searchBar == self.searchBarFrom)
        {
            searchBarIndex = 0
        }
        else
        {
            searchBarIndex = 1
        }
        
        if searchText.isEmpty {
                filteredData = data

        } else {
            // The user has entered text into the search box
            // Use the filter method to iterate over all items in the data array
            // For each item, return true if the item should be included and false if the
            // item should NOT be included
            filteredData[searchBarIndex] = []
            var resultDetailStation:Array<StationDetail> = Array<StationDetail>()
            for(var i = 0; i < data[searchBarIndex].count; i++)
            {
                for(var j = 0; j < data[searchBarIndex][i].stations.count; j++)
                {
                    if data[searchBarIndex][i].stations[j].station.rangeOfString(searchText) != nil
                    {
                        let resultStationsSearch = data[searchBarIndex][i].stations[j].station
                        let resultPointSearch = data[searchBarIndex][i].stations[j].point
                        resultDetailStation.append(StationDetail.init(stationa: resultStationsSearch, pointa: resultPointSearch))
                    }

                
                }
                if(resultDetailStation.count != 0)
                {
                    filteredData[searchBarIndex].append(Station.init(countryTitlea: data[searchBarIndex][i].countryTitle!, cityTitlea: data[searchBarIndex][i].cityTitle!, stationsa: resultDetailStation))
                }
            }
           
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        filteredData = data
        tableView.reloadData()
        self.view.endEditing(true)
    }
    
    @IBAction func indexChanged(sender:UISegmentedControl)
    {
        switch segmentedControl.selectedSegmentIndex
        {
            case 0:
                break
            case 1:
                break
            case 2:
                self.performSegueWithIdentifier("showDate", sender: nil)
            default:
            break;
        }
    }

    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showDetail")
        {
            let indexPath = self.tableView.indexPathForSelectedRow!
            var viewController = segue.destinationViewController as! DetailStationViewController
            var detailStation : Array<String> = Array<String>()
            detailStation.append(data[searchBarIndex][indexPath.section].stations[indexPath.row].station)
            detailStation.append(data[searchBarIndex][indexPath.section].cityTitle!)
            detailStation.append(data[searchBarIndex][indexPath.section].countryTitle!)
            detailStation.append((String)(data[searchBarIndex][indexPath.section].stations[indexPath.row].point[0])+","+(String)(data[searchBarIndex][indexPath.section].stations[indexPath.row].point[1]))
            viewController.detailStation = detailStation
            //viewController.owner_id = self.owner_id * (-1)
            
        }
        if(segue.identifier == "showDate")
        {
            var viewControll = segue.destinationViewController as! DatePickerViewController
            viewControll.vw = self
        }
    }
}
