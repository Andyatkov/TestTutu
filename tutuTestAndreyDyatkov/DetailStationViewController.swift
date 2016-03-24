//
//  DetailStationViewController.swift
//  tutuTestAndreyDyatkov
//
//  Created by Andrey on 24.03.16.
//  Copyright © 2016 DyatkovAndrey. All rights reserved.
//

import UIKit
//Контроллер реализующий деьальную информацию о станции
class DetailStationViewController :  UITableViewController {
    @IBOutlet weak var labelNameStation:UILabel!
    @IBOutlet weak var labelCity:UILabel!
    @IBOutlet weak var labelCountry:UILabel!
    @IBOutlet weak var labelPoint:UILabel!
    var detailStation : Array<String> = Array<String>()
    let detailArray : Array<String> = ["Название станции","Город", "Страна","Координаты станции"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelNameStation.text = detailStation[0]
        self.labelCity.text = detailStation[1]
        self.labelCountry.text = detailStation[2]
        self.labelPoint.text = detailStation[3]
        
        //tableView.dataSource = self
    }
    
}
