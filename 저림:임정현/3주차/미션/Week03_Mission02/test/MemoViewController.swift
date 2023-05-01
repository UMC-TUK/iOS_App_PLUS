//
//  MemoViewController.swift
//  test
//
//  Created by 우주대스타 on 2023-05-01.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

class MemoViewController: UIViewController {

    @IBOutlet weak var memoText: UITextView!
    @IBOutlet weak var memoTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let memoC = memoText.text,
              memoC.count > 0 else{
            alert(message: "메모를 입력하세요")
            return
        }
        guard let memoT = memoTitle.text else{
            return
        }
        
        let newMemo = MemoList(title: memoT, content: memoC)
        MemoList.dummyMemoList.append(newMemo)
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
