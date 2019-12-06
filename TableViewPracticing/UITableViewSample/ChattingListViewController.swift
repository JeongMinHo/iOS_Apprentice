//
//  ChattingListViewController.swift
//  UITableViewSample
//
//  Created by Minseob Yoon on 05/12/2019.
//  Copyright © 2019 Minseob Yoon. All rights reserved.
//

import UIKit

class ChattingListViewController: UIViewController {
    
    // MARK: -IBOutlet
    @IBOutlet weak var chattingListTableView: UITableView!
    @IBOutlet weak var topAdView: AdView!
    
    // Property observer
    var listModel: ChattingList? {
        didSet {
            setAd()
            chattingListTableView.reloadData()
            // reloadData() 할때마다 setAd() 보여준다.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        request()
    }
    
    func setDataSource() {
        chattingListTableView.dataSource = self
    }
    
    func request() {
        // JSON 타입의 "chat" 파일을 불러오는 과정
        guard let path = Bundle.main.path(forResource: "chat", ofType: "json") else {
            return
        }
        guard let data = try? NSData(contentsOfFile: path) as Data else {
            return
        }
        parse(data: data)
    }
    
    func parse(data: Data) {
        
        // JSONDcoder를 사용하여 decoding 해준다.
        let jsonDecoder = JSONDecoder()
        guard let response = try? jsonDecoder.decode(APIResponse<ChattingList>.self, from: data) else {
            return
        }
        self.listModel = response.result
    }
    
    func setAd() {
        topAdView.ad = listModel?.ad
    }
}

extension ChattingListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel?.rooms.count ?? 0
        
        // listModel의 갯수만큼 출력을 해주며 nil일 경우에는 0이다.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCell(withIdentifier: "ChattingCell", for: indexPath)
        guard let cell = dequeued as? ChattingCell else {
            return dequeued
        }
        cell.chattingRoom = listModel?.rooms[indexPath.row]
        return cell
    }
}
