//
//  SearchViewController.swift
//  Rails
//
//  Created by Azizbek Asadov on 11/04/21.
//

import UIKit

fileprivate let cellid = "\(SearchCategoryCollectionViewCell.self)"
fileprivate let cellid_t = "\(SearchTableViewCell.self)"

class SearchViewController: UIViewController {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchText: String?
    
    var searchCategories: [SearchCategory] = [
        SearchCategory(title: "Grocery", image: "shopping-bag"),
        SearchCategory(title: "Food", image: "coffee"),
        SearchCategory(title: "Pharmacy", image: "icecream")
    ]
    
    var searchItems: [SearchItem] = [
        SearchItem(title: "The British Museum", desc: "Great Russell str,m 54, London"),
        SearchItem(title: "The British Museum", desc: "Great Russell str,m 54, London"),
        SearchItem(title: "The British Museum", desc: "Great Russell str,m 54, London"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupViews() {
        self.rightImageView.image = UIImage(named: "geo")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.rightImageView.tintColor = UIColor.white
        self.headerView.backgroundColor = Palette.beigeColor
        self.backButton.tintColor = UIColor.white
        
        self.textField.textColor = UIColor.white
        self.textField.font = Font.bold(14)
        self.textField.tintColor = Palette.TextField.lineColor
        
        self.textField.attributedPlaceholder = NSAttributedString(string: "Search here", attributes: [
            NSAttributedString.Key.foregroundColor: Palette.Text.placeholder,
            NSAttributedString.Key.font: Font.semiBold(17)
        ])
        
        self.collectionView.register(UINib(nibName: cellid, bundle: nil), forCellWithReuseIdentifier: cellid)
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.collectionView.backgroundColor = .clear
        self.tableView.backgroundColor = .clear
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.clipsToBounds = false
        
        self.backButton.addTarget(self, action: #selector(handleBackActionPressed), for: UIControl.Event.touchUpInside)
        
        self.textField.text = self.searchText
        
        self.heightConstraint.constant = self.view.safeAreaInsets.top + (self.navigationController?.navigationBar.frame.height ?? 0) + 70
        
        self.headerView.layer.cornerRadius = 16
        
        self.tableView.register(UINib(nibName: cellid_t, bundle: nil), forCellReuseIdentifier: cellid_t)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.layoutIfNeeded()
    }
    
    @objc private func handleBackActionPressed(_ sender: UIButton) {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(SearchCategoryCollectionViewCell.self, with: cellid, for: indexPath)
        cell.data = self.searchCategories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 50)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid_t, for: indexPath) as! SearchTableViewCell
        cell.data = self.searchItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "TODAY"
    }
}
