//
//  ViewControllerBackButton.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/17.
//

import UIKit

class ViewControllerBackButton: UIViewController {

    @IBAction func pop_back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moveSecond(_ sender: Any) {
        
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
               return
           }
           
           //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
           svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
           
           //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
           self.present(svc, animated: true)
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
