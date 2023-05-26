//
//  BottomSheetViewController.swift
//  UMC_8thweekpractice
//
//  Created by 신예진 on 2023/05/25.
//

import Foundation
import UIKit

class BottomSheetViewController:UIViewController{
    
    var defaultHeight: CGFloat = 300
    var bottomSheetPanMinTopConstant: CGFloat = 30.0
    
    enum BottomSheetViewState {
            case expanded
            case normal
    }
    
    private lazy var bottomSheetPanStartingTopConstant: CGFloat = bottomSheetPanMinTopConstant
    
    private let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        return view
        
    }()
    
    private let bottomSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let dragIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let contentViewController: UIViewController
    
    init(contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private var bottomSheetViewTopConstraint: NSLayoutConstraint!
    
    private func dimAlphaWithBottomSheetTopConstraint(value: CGFloat) -> CGFloat {
        let fullDimAlpha: CGFloat = 0.7
        
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        
        let fullDimPosition = (safeAreaHeight + bottomPadding - defaultHeight) / 2

        let noDimPosition = safeAreaHeight + bottomPadding

        if value < fullDimPosition {
            return fullDimAlpha
        }
        
        if value > noDimPosition {
            return 0.0
        }
        return fullDimAlpha * (1 - ((value - fullDimPosition) / (noDimPosition - fullDimPosition)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomSheet()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewPan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        setupUI()
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        dimmedView.addGestureRecognizer(dimmedTap)
        dimmedView.isUserInteractionEnabled = true
        
        viewPan.delaysTouchesBegan = false
        viewPan.delaysTouchesEnded = false
        view.addGestureRecognizer(viewPan)
        
    }
    
    @objc private func viewPanned(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let translation = panGestureRecognizer.translation(in: view)
        
        let velocity = panGestureRecognizer.velocity(in: view)
        
        switch panGestureRecognizer.state {
        case .began:
            bottomSheetPanStartingTopConstant = bottomSheetViewTopConstraint.constant
        case .changed:
            if bottomSheetPanStartingTopConstant + translation.y > bottomSheetPanMinTopConstant {
                bottomSheetViewTopConstraint.constant = bottomSheetPanStartingTopConstant + translation.y
            }
            dimmedView.alpha = dimAlphaWithBottomSheetTopConstraint(value: bottomSheetViewTopConstraint.constant)
        case .ended:
            if velocity.y > 1500 {
                hideBottomSheetAndGoBack()
                return
            }
            
            let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
            let bottomPadding = view.safeAreaInsets.bottom
            let defaultPadding = safeAreaHeight+bottomPadding - defaultHeight
            
            let nearestValue = nearest(to: bottomSheetViewTopConstraint.constant, inValues: [bottomSheetPanMinTopConstant, defaultPadding, safeAreaHeight + bottomPadding])
            
            if nearestValue == bottomSheetPanMinTopConstant {
                showBottomSheet(atState: .expanded)
            } else if nearestValue == defaultPadding {
                // Bottom Sheet을 .normal 상태로 보여주기
                showBottomSheet(atState: .normal)
            } else {
                // Bottom Sheet을 숨기고 현재 View Controller를 dismiss시키기
                hideBottomSheetAndGoBack()
            }
        default:
            break
        }
    }
    
    func nearest(to number: CGFloat, inValues values: [CGFloat]) -> CGFloat {
        guard let nearestVal = values.min(by: { abs(number - $0) < abs(number - $1) })
        else { return number }
        return nearestVal
    }
    
    
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheetAndGoBack()
    }
    
    private func hideBottomSheetAndGoBack() {
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        bottomSheetViewTopConstraint.constant = safeAreaHeight + bottomPadding
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    private func setupUI(){
        view.addSubview(dimmedView)
        view.addSubview(bottomSheetView)
        view.addSubview(dragIndicatorView)
        addChild(contentViewController)
        bottomSheetView.addSubview(contentViewController.view)
        contentViewController.didMove(toParent: self)
        bottomSheetView.clipsToBounds = true
        
        dimmedView.alpha = 0.0
        setupLayout()
    }
    
    private func setupLayout(){
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        let topConstant = view.safeAreaInsets.bottom + view.safeAreaLayoutGuide.layoutFrame.height
        
        bottomSheetViewTopConstraint = bottomSheetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant)
        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetViewTopConstraint,
        ])
        
        NSLayoutConstraint.activate([
                dragIndicatorView.widthAnchor.constraint(equalToConstant: 60),
                dragIndicatorView.heightAnchor.constraint(equalToConstant: dragIndicatorView.layer.cornerRadius * 2),
                dragIndicatorView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                dragIndicatorView.bottomAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: -10)
            ])
        
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentViewController.view.topAnchor.constraint(equalTo:bottomSheetView.topAnchor),
            contentViewController.view.leadingAnchor.constraint(equalTo:bottomSheetView.leadingAnchor),
            contentViewController.view.trailingAnchor.constraint(equalTo:bottomSheetView.trailingAnchor),
            contentViewController.view.bottomAnchor.constraint(equalTo:bottomSheetView.bottomAnchor)
            ])
        
        
    }
    
    private func showBottomSheet(atState: BottomSheetViewState = .normal) {
        if atState == .normal {
            let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.height
            let bottomPadding: CGFloat = view.safeAreaInsets.bottom
            bottomSheetViewTopConstraint.constant = (safeAreaHeight + bottomPadding) - defaultHeight
        } else {
            bottomSheetViewTopConstraint.constant = bottomSheetPanMinTopConstant
        }
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedView.alpha = self.dimAlphaWithBottomSheetTopConstraint(value: self.bottomSheetViewTopConstraint.constant)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
