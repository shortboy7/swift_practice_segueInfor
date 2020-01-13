//
//  ViewController.swift
//  jiWoong_segueDataCast
//
//  Created by linc on 2020/01/13.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit

struct History{
    let meetingName : String
    let cost : Int
}


class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyGeneralCell", for: indexPath)
        let rowData = self.history[indexPath.row]
        cell.textLabel?.text = rowData.meetingName
        cell.detailTextLabel?.text = "\(rowData.cost)"
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let history : [History] = [
        History(meetingName: "18모임", cost: 15000),
        History(meetingName: "고등학교 송년회", cost: 30000),
        History(meetingName: "중학교 모임", cost: 20000),
        History(meetingName: "초등학교 모임", cost: 70000),
       ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailViewSegue" {
            if let history = sender as? History{
                if let detailController = segue.destination as? DetailViewController{
                    detailController.historyDetail = history
                }
            }
        }
    }

}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "historyGeneralCell", sender: self.history[indexPath.row])
    }
}
