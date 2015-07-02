//
//  ViewController.swift
//  TaskIt
//
//  Created by Hector Rios on 29/06/15.
//  Copyright (c) 2015 HectorRios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray : [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 = TaskModel(task: "Study French", subtask: "Verbs", date: "01/10/2014")
        
        let task2: TaskModel = TaskModel(task: "Eat dinner", subtask: "Burgers", date: "14/01/2015")
        
        let task3: TaskModel = TaskModel(task: "Gym", subtask: "Leg Day", date: "14/01/2015")
        
        self.taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showTaskDetail") {
            let detailVC: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow()
            
            let thisTask: TaskModel = self.taskArray[indexPath!.row]
            
            detailVC.detailTaskModel = thisTask
            
        }
    }
    
    // MARK: UITableViewDataSource protocol methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(indexPath.row)
        
        var cell : TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        let thisTask:TaskModel = self.taskArray[indexPath.row]
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = thisTask.date
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskArray.count
    }
    
    
    // MARK: UITableViewDelegate methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }


}

