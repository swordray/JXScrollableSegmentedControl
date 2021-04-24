//
//  JXScrollableSegmentedControlButton.swift
//  JXScrollableSegmentedControl
//
//  Created by swordray on 12/20/2020.
//  Copyright (c) 2021 swordray. All rights reserved.
//

import UIKit

internal class JXScrollableSegmentedControlButton: UIButton {

    override var isEnabled: Bool { didSet { didSetEnabled() } }
    override var isSelected: Bool { didSet { didSetSelected() } }
    private var selectedBackgroundView: UIView!
    internal var separatorView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

        imageView?.tintColor = .label

        setTitleColor(.label, for: .normal)
        setTitleColor(.tertiaryLabel, for: .disabled)

        titleLabel?.font = .systemFont(ofSize: 13)
        titleLabel?.textAlignment = .center

        selectedBackgroundView = UIView()
        selectedBackgroundView.isHidden = true
        selectedBackgroundView.layer.cornerRadius = 7
        selectedBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(selectedBackgroundView)
        sendSubviewToBack(selectedBackgroundView)
        selectedBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        selectedBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        selectedBackgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        selectedBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        for (shadowOpacity, shadowRadius) in [(0.12, 8), (0.04, 1)] {
            let shadowView = UIView()
            shadowView.backgroundColor = UIColor { $0.userInterfaceStyle == .dark ? .systemGray2 : .systemBackground }
            shadowView.layer.cornerRadius = 7
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
            shadowView.layer.shadowOpacity = Float(shadowOpacity)
            shadowView.layer.shadowRadius = CGFloat(shadowRadius)
            shadowView.translatesAutoresizingMaskIntoConstraints = false
            selectedBackgroundView.addSubview(shadowView)
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }

        separatorView = UIView()
        separatorView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
        separatorView.layer.cornerRadius = 0.5
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)
        separatorView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -1.5).isActive = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func didSetEnabled() {
        imageView?.tintColor = isEnabled ? .label : .tertiaryLabel
    }

    private func didSetSelected() {
        titleLabel?.font = .systemFont(ofSize: 13, weight: isSelected ? .semibold : .regular)

        selectedBackgroundView.isHidden = !isSelected
    }
}
