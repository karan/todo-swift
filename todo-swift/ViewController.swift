//
//  ViewController.swift
//  todo-swift
//
//  Created by Karan Goel on 6/4/14.
//  Copyright (c) 2014 Karan Goel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var textField: UITextField!
    var tableViewData = String[]()
    
    // some colors
    
    let lightOrange:UIColor = UIColor(red: 0.996, green: 0.467, blue: 0.224, alpha: 1)
    let medOrange:UIColor = UIColor(red: 0.973, green: 0.338, blue: 0.173, alpha: 1)
    let darkOrange:UIColor = UIColor(red: 0.7, green: 0.2, blue: 0.1, alpha: 1)
    let green:UIColor = UIColor(red: 0.251, green: 0.831, blue: 0.494, alpha: 1)
    let white:UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup table view
        
        self.tableView = UITableView(frame: CGRectMake(0, 100, self.view.bounds.size.width,
            self.view.bounds.size.height-100), style:UITableViewStyle.Plain)
        self.tableView.registerClass(MyTableViewCell.self, forCellReuseIdentifier: "mycell")
        self.tableView.backgroundColor = darkOrange
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        
        // setup the text field
        
        self.textField = UITextField(frame: CGRectMake(0, 0, self.view.bounds.size.width, 100))
        self.textField.backgroundColor = lightOrange
        self.textField.delegate = self
        
        self.view.addSubview(self.textField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var myNewCell: MyTableViewCell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath) as MyTableViewCell
        myNewCell.selectionStyle = UITableViewCellSelectionStyle.None
        myNewCell.text = self.tableViewData[indexPath.row]
        
        return myNewCell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        let mySelectedCell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)
        mySelectedCell.detailTextLabel.text = "Done with this!"
        mySelectedCell.backgroundColor = green
        mySelectedCell.textColor = UIColor.whiteColor()
        mySelectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
        mySelectedCell.tintColor = UIColor.whiteColor()
        
    }
    
    // text field delegate
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        tableViewData.append(textField.text)
        textField.text = ""
        self.tableView.reloadData()
        textField.resignFirstResponder()
        
        return true
        
    }
    
}
