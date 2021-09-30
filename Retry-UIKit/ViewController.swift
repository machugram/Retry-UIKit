//
//  ViewController.swift
//  Retry-UIKit
//
//  Created by Rexford Machu on 9/30/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView :UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
        cell.configure(with: testList[indexPath.row])

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Apollo.shared.client.fetch(query: GetTestListQuery()){result in
            switch result {
            case .success(let graphQLResult):
                print(graphQLResult.data!.testList!)
                if let testList = graphQLResult.data?.testList{
                    DispatchQueue.main.async {
                        self.testList = testList as! [GetTestListQuery.Data.TestList]
                    }
                }
                self.tableView.reloadData()

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }

        tableView.register(DataTableViewCell.nib(), forCellReuseIdentifier: DataTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    var testList : [GetTestListQuery.Data.TestList] = []
    

}

