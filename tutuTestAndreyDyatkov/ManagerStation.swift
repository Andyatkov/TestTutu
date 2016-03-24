//
//  ManagerStation.swift
//  tutuTestAndreyDyatkov
//
//  Created by Andrey on 23.03.16.
//  Copyright © 2016 DyatkovAndrey. All rights reserved.
//

import UIKit
//Менеджер. Здесь парсим полученый json
class ManagerStation : NSObject
{
    class func getСitiesTo(success:((allStation: Array<Array<Station>>) -> Void))
    {
        var resultRequest: Array<Array<Station>> = Array<Array<Station>>()
        var citiesFromArray: Array<Station> = Array<Station>()
        ACAPI_WRAPPER.getStation({ (jsonResponce) -> Void in
        var items:Array<JSON> = jsonResponce["citiesFrom"].arrayValue
            for item:JSON in items
            {
                
                let countryTitle = item["countryTitle"].stringValue
                let cityTitle = item["cityTitle"].stringValue
                
                let stations:Array<JSON> = item["stations"].arrayValue
                var stationArray: Array<StationDetail> = Array<StationDetail>()
                
                for station:JSON in stations
                {
                    var point:[Float] = [0,0]
                    point[0] = station["point"]["longitude"].floatValue
                    point[1] = station["point"]["latitude"].floatValue
                    stationArray.append(StationDetail.init(stationa: station["stationTitle"].stringValue, pointa: point))
                }
                citiesFromArray.append(Station.init(countryTitlea: countryTitle, cityTitlea: cityTitle, stationsa: stationArray))
                
            }
            resultRequest.append(citiesFromArray)
            
            var citiesToArray: Array<Station> = Array<Station>()
            var itemsTo = jsonResponce["citiesTo"].arrayValue
            for item:JSON in itemsTo
            {
                
                let countryTitle = item["countryTitle"].stringValue
                let cityTitle = item["cityTitle"].stringValue
                
                let stations:Array<JSON> = item["stations"].arrayValue
                var stationArray: Array<StationDetail> = Array<StationDetail>()
                
                for station:JSON in stations
                {
                    var point:[Float] = [0,0]
                    point[0] = station["point"]["longitude"].floatValue
                    point[1] = station["point"]["latitude"].floatValue
                    stationArray.append(StationDetail.init(stationa: station["stationTitle"].stringValue, pointa: point))
                }
                citiesToArray.append(Station.init(countryTitlea: countryTitle, cityTitlea: cityTitle, stationsa: stationArray))
                
            }
            resultRequest.append(citiesToArray)
            
            success(allStation: resultRequest)
            }) { () -> Void in
                
        }
    }

}
