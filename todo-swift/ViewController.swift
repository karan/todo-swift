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
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup table view
        
        self.tableView = UITableView(frame: CGRectMake(0, 100, self.view.bounds.size.width,
            self.view.bounds.size.height-100), style:UITableViewStyle.Plain)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "mycell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        
        // setup the text field
        
        self.textField = UITextField(frame: CGRectMake(0, 0, self.view.bounds.size.width, 100))
        self.textField.backgroundColor = UIColor.redColor()
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
        let myNewCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath) as UITableViewCell
        
        myNewCell.text = self.tableViewData[indexPath.row]
        
        return myNewCell
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
