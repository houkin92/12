//
//  NewViewController.swift
//  基本视图
//
//  Created by VersonXu on 2019/01/24.
//  Copyright © 2019 VersonXu. All rights reserved.
//

import UIKit


//1 AlertView (警告视图)
//1-1  警告视图的风格分为 alert和actionsheet（注意！actionsheet不能用于ipad）
//1-2  alert 风格的警告视图中，action为1个或者两个的情况下横向排列，3个以上纵向排列
class NewViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    
    var inputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self


    }
    @IBAction func toNextPage(_ sender: UIButton) {
        performSegue(withIdentifier: "webToSegue", sender: nil)
    }
    

  

}
extension NewViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //对输入的文字进行安全的拆包
        if let num = Int(string) {
            //判断数字是否大于5
            if num > 5 {
                inputText = string

                
                //如果数字大于5的话，就弹出警告视图
                //实例化 (preferredStyle: .actionsheet  是在页面最下面弹出（ipad不识别不能用），， 。alert 是在屏幕中间弹出)
                let alertController = UIAlertController(title: "Warning", message: "小伙子你膨胀了，要得寸进尺吗", preferredStyle: .alert)
                
                //警告事件
                let okAction = UIAlertAction(title: "要", style: .default, handler: {(action) in
                    //闭包
                   let text = textField.text! + self.inputText
                    textField.text = text
  
                })//handler 按键点击方法
                let cancelAction = UIAlertAction(title: "不要", style:.default, handler: nil)
//                let thirdAction = UIAlertAction(title: "变竖行了", style: .default, handler: nil)
                
                //把以上这两个按键添加到警告视图上
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
//                alertController.addAction(thirdAction)
                
                //到底为止 警告视图不会自动弹出，要设置
                //画面跳转方式， present 和dismiss 一起用
                self.present(alertController, animated: true, completion: nil)

                return false
            }
            
        }
        return true
        
    }
    
    
    
}
