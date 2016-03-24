import Foundation


//Класс в ктором мы получаем json
class ACAPI_WRAPPER: NSObject
{
    class func getStation(success:((jsonResponce: JSON) -> Void), failure :()->Void)
    {
        if let path = NSBundle.mainBundle().pathForResource("allStations", ofType: "json")
        {
            if let data = NSData(contentsOfFile: path)
            {
                genericCompletetionHandler(data,success: success, failure: { () -> Void in })
            }
        }
        //var data = NSData(contentsOfFile: ".json")
        
        
     }
    
    
    class func genericCompletetionHandler ( data : NSData? ,success : ( jsonResponce : JSON ) -> Void , failure : ()-> Void  )
    {

        if ( data != nil )
        {
            let jsonResponce = JSON ( data: data!, options: NSJSONReadingOptions(), error: nil )
            
            /* конверсия NSData в JSON для дальнейшего парсинга */
            //print("internet answer : \(jsonResponce)")
            /* возвращаем результат в success block */
            success ( jsonResponce: jsonResponce )
        }
        else
        {
            failure()
        }
    }
    
}
