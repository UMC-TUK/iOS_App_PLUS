//
//  CircularTimerView.swift
//  UMC_sixthweekmission
//
//  Created by 신예진 on 2023/05/13.
//

//import Foundation
//import UIKit
//
//protocol CircularTimerViewDelegate: AnyObject {
//    func didFinishTimer()
//}
//
//struct ProgressColors {
//    var trackLayerStrokeColor: CGColor = UIColor.lightGray.cgColor
//    var barLayerStrokeColor: CGColor = UIColor.green.cgColor
//}
//
//class CircularTimerView: UIView {
//    
//    private let progressColors: ProgressColors
//    private let startDate: Date
//    private var leftSeconds: TimeInterval
//    private lazy var timer = Timer()
//    private lazy var endSeconds = startDate.addingTimeInterval(leftSeconds)
//    weak var delegate: CircularTimerViewDelegate?
//    
//    private lazy var circularPath: UIBezierPath = {
//        return UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
//                            radius: 100, // 반지름
//                            startAngle: -90.degreesToRadians, // 12시 방향 (0도가 3시방향)
//                            endAngle: CGFloat.pi * 2, // 2시 방향
//                            clockwise: true)
//    }()
//    
//    private lazy var trackLayer: CAShapeLayer = {
//        let layer = CAShapeLayer()
//        layer.path = circularPath.cgPath
//        layer.fillColor = UIColor.clear.cgColor
//        layer.strokeColor = progressColors.trackLayerStrokeColor
//        layer.lineWidth = 15
//        return layer
//    }()
//
//    private lazy var barLayer: CAShapeLayer = {
//        let layer = CAShapeLayer()
//        layer.path = circularPath.cgPath
//        layer.fillColor = UIColor.clear.cgColor
//        layer.strokeColor = progressColors.barLayerStrokeColor
//        layer.lineWidth = 15
//        return layer
//    }()
//    
//    private lazy var timeLabel: UILabel = {
//        let label = UILabel(frame: CGRect(x: frame.midX - 50,
//                                          y: frame.midY - 25,
//                                          width: 100,
//                                          height: 50))
//        label.textAlignment = .center
//        label.textColor = .label
//        return label
//    }()
//    
//    init(progressColors: ProgressColors, duration: TimeInterval, startDate: Date) {
//        self.progressColors = progressColors
//        self.leftSeconds = duration
//        self.startDate = startDate
//        super.init(frame: .zero)
//        
//        addSubviews()
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    private func addSubviews() {
//        layer.addSublayer(trackLayer)
//        layer.addSublayer(barLayer)
//        addSubview(timeLabel)
//    }
//    
//    private func setupViews() {
//        animateToBarLayer()
//    }
//    
//    private func animateToBarLayer() {
//        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        strokeAnimation.fromValue = 0
//        strokeAnimation.toValue = 1
//        strokeAnimation.duration = leftSeconds
//        
//        barLayer.add(strokeAnimation, forKey: nil)
//        timer = Timer.scheduledTimer(timeInterval: 0.1,
//                                     target: self,
//                                     selector: #selector(updateTime),
//                                     userInfo: nil,
//                                     repeats: true)
//    }
//    
//    @objc private func updateTime() {
//        if leftSeconds > 0 {
//            leftSeconds = endSeconds.timeIntervalSinceNow
//            timeLabel.text = leftSeconds.time
//        } else {
//            timer.invalidate()
//            timeLabel.text = "00:00"
//            delegate?.didFinishTimer()
//        }
//    }
//    
//}
