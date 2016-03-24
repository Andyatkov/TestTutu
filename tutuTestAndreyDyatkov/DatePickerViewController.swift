//
//  DatePickerViewController.swift
//  tutuTestAndreyDyatkov
//
//  Created by Andrey on 24.03.16.
//  Copyright © 2016 DyatkovAndrey. All rights reserved.
//

import UIKit
//Контроллер реализующий выбор даты
class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    var strDate:String = ""
    var vw:SearchViewController?
    @IBOutlet weak var selectedDate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.selectedDate.setTitle("Выбрать " + strDate, forState: .Normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func datePickerAction(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        dispatch_async(dispatch_get_main_queue(), {() -> Void in
            self.selectedDate.setTitle("Выбрать " + strDate, forState: .Normal)
        })
        //self.selectedDate.text = strDate
        
    }
    
    @IBAction func chooseDate(sender: AnyObject) {
        var viewController = self.navigationController?.popViewControllerAnimated(true)
        vw!.strDate = strDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
