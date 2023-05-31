//
//  MovieChartViewController.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit
import Tabman
import Pageboy

class MovieChartViewController: TabmanViewController {
  
  // MARK: - Properties
  @IBOutlet weak var tabView: UIView!
  private var viewControllers: [UIViewController] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabMan()
    isScrollEnabled = false

  }
    
  func setTabMan() {
//    guard let firstVC = storyboard?.instantiateViewController(withIdentifier: "dayChartVC")
//            as? DailyChartViewController else { return }
    guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "weekChartVC")
            as? WeeklyChartViewController else { return }
//    viewControllers.append(firstVC)
    viewControllers.append(secondVC)
    
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    
    bar.backgroundView.style = .blur(style: .light)
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    bar.buttons.customize { button in
      button.tintColor = .systemGray4
      button.selectedTintColor = .black
      button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    bar.indicator.weight = .custom(value: 2)
    bar.indicator.tintColor = .black
    addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
  }

}


// MARK: - PageboyViewControllerDataSource, TMBarDataSource
extension MovieChartViewController: PageboyViewControllerDataSource, TMBarDataSource {
  func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
    return viewControllers.count
  }
  
  func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
    return nil
  }
  
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    switch index {
    case 0:
      return TMBarItem(title: "# 박스오피스")
    case 1:
      return TMBarItem(title: "# 상영예정")
    case 2:
        return TMBarItem(title: "# 돌바시네마")
    case 3:
        return TMBarItem(title: "# 단독")
    case 4:
        return TMBarItem(title: "# 클소")
    case 5:
        return TMBarItem(title: "# 필소")
    default:
      return TMBarItem(title: "page \(index)")
    }
  }
}
