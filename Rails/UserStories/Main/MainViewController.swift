//
//  MainViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit

final class MainViewController: UIViewController {
    init() {
        self.scrollView = AutoKeyboardScrollView()
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
        self.view.addSubview(self.scrollView)
        self.scrollView.edgesToSuperview(usingSafeArea: true)
        self.scrollView.handleTextFields(self.searchForm.textFields)
        self.scrollView.keyboardDismissMode = .onDrag

        let contentView = UIView()
        self.scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()

        contentView.addSubview(self.greetingView)
        self.greetingView.edgesToSuperview(
            excluding: .bottom,
            insets: .init(top: 0, left: 45, bottom: .nan, right: 45)
        )

        contentView.addSubview(self.searchForm)
        self.searchForm.topToBottom(of: self.greetingView, offset: 20)
        self.searchForm.horizontalToSuperview(insets: .horizontal(21))

        let ticketView = TicketView()

        ticketView.height(140)

        let ticketContainerView = UIView()
        ticketContainerView.backgroundColor = UIColor(rgb: 0xB5B7C2, alpha: 0.2)
        ticketContainerView.addSubview(ticketView)
        ticketView.edgesToSuperview(insets: .init(top: 28, left: 28, bottom: 28, right: 28))

        contentView.addSubview(ticketContainerView)
        ticketContainerView.edgesToSuperview(excluding: .top, usingSafeArea: true)
        ticketContainerView.topToBottom(of: self.searchForm, offset: 46)
    }

    // MARK: - Private
    private let greetingView: GreetingView
    private let searchForm: SearchForm
    private let scrollView: AutoKeyboardScrollView
    
}
