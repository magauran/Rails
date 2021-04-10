//
//  MainViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit

final class MainViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        // For test
        let ticketView = TicketView()
        self.view.addSubview(ticketView)

        ticketView.height(140)
        ticketView.width(320)
        ticketView.center(in: self.view)
    }
}
