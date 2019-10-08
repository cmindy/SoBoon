//
//  PostViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 08/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var tempIdentifier = ["ProductInfoCell", "ActionCell", "DescriptionCell" ]

}

extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return tempIdentifier.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = tempIdentifier[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        return cell
    }
    
    
}

//extension PostViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//}
