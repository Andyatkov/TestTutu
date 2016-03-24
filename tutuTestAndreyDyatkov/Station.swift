//
//  Station.swift
//  tutuTestAndreyDyatkov
//
//  Created by Andrey on 23.03.16.
//  Copyright © 2016 DyatkovAndrey. All rights reserved.
//

import Foundation
//Модель станций
class Station:NSObject
{
    var countryTitle:String?
    var cityTitle:String?
    var stations:Array<StationDetail> = Array<StationDetail>()
    
    init(countryTitlea:String, cityTitlea:String,stationsa:Array<StationDetail>) {
        countryTitle = countryTitlea
        cityTitle = cityTitlea
        stations = stationsa
    }
}

class StationDetail:NSObject
{
    var station:String = ""
    var point:Array<Float> = Array<Float>()
    init(stationa:String,pointa:Array<Float>)
    {
        station = stationa
        point = pointa
    }
}
