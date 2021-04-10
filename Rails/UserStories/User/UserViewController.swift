//
//  UserViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import TinyConstraints

final class UserViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        self.imageView.image = UIImage(named: "putin")
        self.view.addSubview(self.imageView)
        self.imageView.centerXToSuperview()
        self.imageView.height(100)
        self.imageView.contentMode = .scaleAspectFit

        self.bottomConstraint = self.imageView.bottom(to: self.view.safeAreaLayoutGuide, offset: 100)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.show { [weak self] in
                guard let self = self else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.hide()
                }
            }
        }
    }

    private let imageView = UIImageView()
    private var bottomConstraint: Constraint?

    private func show(completion: @escaping () -> Void) {
        self.bottomConstraint?.constant = 0
        let animator = UIViewPropertyAnimator(duration: 4, curve: .easeOut) {
            self.view.layoutIfNeeded()
        }
        animator.addCompletion { _ in
            completion()
        }
        animator.startAnimation()
    }

    private func hide() {
        self.bottomConstraint?.constant = 100
        UIViewPropertyAnimator(duration: 4, curve: .easeOut) {
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
}
