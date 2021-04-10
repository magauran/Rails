//
//  MainViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit

final class SearchForm: UIView {

}

final class MainViewController: UIViewController {
    init() {
        self.greetingView = GreetingView()
        self.searchForm = SearchForm()

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white


        self.view.addSubview(self.greetingView)
        self.greetingView.edgesToSuperview(
            excluding: .bottom,
            insets: .init(top: 0, left: 45, bottom: .nan, right: 45)
        )

        // For test
        let ticketView = TicketView()
        self.view.addSubview(ticketView)

        ticketView.height(140)
        ticketView.width(320)
        ticketView.center(in: self.view)
    }

    // MARK: - Private
    private let greetingView: GreetingView
    private let searchForm: SearchForm
}
