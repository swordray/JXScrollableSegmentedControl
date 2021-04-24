//
//  JXScrollableSegmentedControl.swift
//  JXScrollableSegmentedControl
//
//  Created by swordray on 12/20/2020.
//  Copyright (c) 2021 swordray. All rights reserved.
//

import UIKit

open class JXScrollableSegmentedControl: UISegmentedControl {

    private var selectedSegmentIndexValue = noSegment
    private var stackView: UIStackView!

    override public init(frame: CGRect) {
        super.init(frame: frame)

        loadScrollView()
    }

    override public init(items: [Any]?) {
        super.init(items: items)

        loadScrollView()

        for item in items ?? [] {
            let button = JXScrollableSegmentedControlButton()
            button.addTarget(self, action: #selector(didSelectSegment), for: .touchUpInside)
            button.setImage(item as? UIImage, for: .normal)
            button.setTitle(item as? String, for: .normal)
            stackView.addArrangedSubview(button)
        }
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func loadScrollView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemBackground
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = true
        scrollView.backgroundColor = .tertiarySystemFill
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        stackView = UIStackView()
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor).isActive = true
    }

    override open func setImage(_ image: UIImage?, forSegmentAt segment: Int) {
        super.setImage(image, forSegmentAt: segment)

        let button = stackView.arrangedSubviews[segment] as? UIButton
        button?.setImage(image, for: .normal)
        button?.setTitle(nil, for: .normal)
    }

    override open func setTitle(_ title: String?, forSegmentAt segment: Int) {
        super.setTitle(title, forSegmentAt: segment)

        let button = stackView.arrangedSubviews[segment] as? UIButton
        button?.setImage(nil, for: .normal)
        button?.setTitle(title, for: .normal)
    }

    override open func insertSegment(with image: UIImage?, at segment: Int, animated: Bool) {
        super.insertSegment(with: image, at: segment, animated: animated)

        let button = JXScrollableSegmentedControlButton()
        button.addTarget(self, action: #selector(didSelectSegment), for: .touchUpInside)
        button.separatorView.isHidden = [0, selectedSegmentIndex, selectedSegmentIndex + 1].contains(segment)
        button.setImage(image, for: .normal)
        stackView.insertArrangedSubview(button, at: segment)
    }

    override open func insertSegment(withTitle title: String?, at segment: Int, animated: Bool) {
        super.insertSegment(withTitle: title, at: segment, animated: animated)

        let button = JXScrollableSegmentedControlButton()
        button.addTarget(self, action: #selector(didSelectSegment), for: .touchUpInside)
        button.separatorView.isHidden = [0, selectedSegmentIndex, selectedSegmentIndex + 1].contains(segment)
        button.setTitle(title, for: .normal)
        stackView.insertArrangedSubview(button, at: segment)
    }

    override open func removeAllSegments() {
        super.removeAllSegments()

        for subview in stackView.arrangedSubviews {
            subview.removeFromSuperview()
        }

        selectedSegmentIndex = Self.noSegment
    }

    override open func removeSegment(at segment: Int, animated: Bool) {
        super.removeSegment(at: segment, animated: animated)

        stackView.arrangedSubviews[segment].removeFromSuperview()

        if segment == selectedSegmentIndex {
            selectedSegmentIndex = Self.noSegment
        }
    }

    override open var selectedSegmentIndex: Int {
        get {
            selectedSegmentIndexValue
        }
        set (value) {
            if selectedSegmentIndex == value { return }
            selectedSegmentIndexValue = value

            for (segment, button) in stackView.arrangedSubviews.compactMap({ $0 as? JXScrollableSegmentedControlButton }).enumerated() {
                button.isSelected = segment == selectedSegmentIndex
                button.separatorView.isHidden = [0, selectedSegmentIndex, selectedSegmentIndex + 1].contains(segment)
            }

            sendActions(for: .valueChanged)
        }
    }

    override open func setEnabled(_ enabled: Bool, forSegmentAt segment: Int) {
        super.setEnabled(enabled, forSegmentAt: segment)

        (stackView.arrangedSubviews[segment] as? UIButton)?.isEnabled = enabled
    }

    @objc
    private func didSelectSegment(_ button: UIButton) {
        selectedSegmentIndex = isMomentary ? Self.noSegment : stackView.arrangedSubviews.firstIndex(of: button) ?? Self.noSegment
    }
}
