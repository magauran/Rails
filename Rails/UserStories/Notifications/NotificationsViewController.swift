//
//  NotificationsViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit

fileprivate let cellid = "\(NotificationsableViewCell.self)"

final class NotificationsViewController: UIViewController {
    private var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.attributedText =
            NSAttributedString(string: "Notifications",
                               attributes: [NSAttributedString.Key.font : Font.semiBold(22),
                         NSAttributedString.Key.foregroundColor : Palette.Text.primary])
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tb = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        tb.backgroundColor = .clear
        tb.estimatedRowHeight = 80
        tb.rowHeight = UITableView.automaticDimension
        tb.delegate = self
        tb.dataSource = self
        tb.register(UINib(nibName: cellid, bundle: nil), forCellReuseIdentifier: cellid)
        return tb
    }()
    
    var data: [NotificationModel] = [
        NotificationModel(title: "Train arrives", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", canEdit: true),
        
        NotificationModel(title: "Train arrives", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", canEdit: false),
        NotificationModel(title: "Train arrives", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", canEdit: false),
        
        NotificationModel(title: "Train arrives", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", canEdit: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
    }
    
    private func setupSubviews() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.titleLabel)
        self.titleLabel.sizeToFit()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        self.view.backgroundColor = Palette.viewBGColor.color
        
        self.tableView.reloadData()
    }
}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! NotificationsableViewCell
        cell.data = self.data[indexPath.row]
        return cell
    }
}
