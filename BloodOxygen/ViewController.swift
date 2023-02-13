//
//  ViewController.swift
//  BloodOxygen
//
//  Created by Putu Denisa Florence Satriani on 09/05/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    
    @IBOutlet weak var kela: UILabel!
    @IBOutlet weak var detak: UILabel!
    @IBOutlet weak var umur: UILabel!
    
    @IBOutlet weak var txtA: UITextField!
    @IBOutlet weak var txtH: UITextField!
    @IBOutlet weak var lblResult: UILabel!
  
    @IBOutlet weak var gender: UIButton!
    
    var dataGender = [String](arrayLiteral: "Female", "Male")
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        umur.layer.cornerRadius = 10
//        kela.clipsToBounds = true
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func hideKB(_ sender: Any) {
        txtA.resignFirstResponder()
        txtH.resignFirstResponder()
    }
    
    let lebar = UIScreen.main.bounds.width-10
        let tinggi = UIScreen.main.bounds.height / 2
        var selectedRow = 0
    @IBAction func popUpPicker(_ sender: Any) {
        //kela.layer.cornerRadius = 20
        let vc = UIViewController()
               vc.preferredContentSize = CGSize(width : lebar, height : tinggi)
               let pickerGender = UIPickerView(frame: CGRect(x:0, y:0, width: lebar, height: tinggi))
               pickerGender.dataSource = self
               pickerGender.delegate = self
               
               pickerGender.selectRow(selectedRow, inComponent: 0, animated : false)
               
               vc.view.addSubview(pickerGender)
               pickerGender.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
               pickerGender.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
               
               let popUp = UIAlertController(title: "Select Gender", message: "", preferredStyle: .actionSheet)
               popUp.popoverPresentationController?.sourceView = gender
               popUp.popoverPresentationController?.sourceRect = gender.bounds
               
               popUp.setValue(vc, forKey: "contentViewController")
               popUp.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(UIAlertAction) in }))
               popUp.addAction(UIAlertAction(title: "Select", style: .default, handler: {(UIAlertAction) in
                   self.selectedRow = pickerGender.selectedRow(inComponent: 0)
                   let selected = Array(self.dataGender)[self.selectedRow]
                   self.gender.setTitle(selected, for: .normal)
               }))
               
               self.present(popUp, animated: true, completion: nil)
           }

    
    var a:Float = 1
    var h:Float = 75
    var blood:Float = 0

    @IBAction func VO2MaxCalc(_ sender: Any) {
        var strW:NSString = txtA.text as! NSString
        a = strW.floatValue
        var strH:NSString = txtH.text as! NSString
        h = strH.floatValue
                
        let blood = 15*((220-a)/h)
        var str = ""

     
        switch (blood,a,self.gender.titleLabel?.text){
            // PRIA 13-19 TAHUN
        case (0...34.9, 13...19,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (35...38.3, 13...19,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (38.4...45.1, 13...19,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (45.2...50.9, 13...19,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (51...55.9, 13...19,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (56..., 13...19,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
              // USIA 20-29
        case (0...32.9, 20...29,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (33...36.4, 20...29,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (36.5...42.4, 20...29,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (42.5...46.4, 20...29,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (46.5...52.4, 20...29,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (52.4..., 20...29,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
                //USIA 30-39
        case (0...31.49, 30...39,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (31.5...35.4, 30...39,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (35.5...40.9, 30...39,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (41...44.9, 30...39,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (45...49.4, 30...39,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (49.5..., 30...39,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
              //USIA 40-49
        case (0...30.1, 40...49,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (30.2...33.5, 40...49,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (33.6...38.9, 40...49,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (39...43.7, 40...49,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (43.8...48, 40...49,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (48.1..., 40...49,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
            // Usia 50 - 59
        case (0...26, 50...59,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (26.1...30.9, 50...59,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (31...35.7, 50...59,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (35.8...40.9, 50...59,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (41...45.3, 50...59,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (45.4..., 50...59,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
            // Usia 60++
        case (0...20.4, 60...,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (20.5...26, 60...,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (26.1...32.2, 60...,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (32.3...36.4, 60...,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (36.5...44.1, 60...,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (44.2..., 60...,"Male" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
            
            
            // WANITA USIA 13-19
        case (0...24.9, 13...19,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (25...30.9, 13...19,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (31...34.9, 13...19,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (35...38.9, 13...19,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (39...41.9, 13...19,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (42..., 13...19,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
              // USIA 20-29
        case (0...23.5, 20...29,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (23.6...28.9, 20...29,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (29...32.9, 20...29,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (33...36.9, 20...29,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (37...41, 20...29,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (41.1..., 20...29,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
                //USIA 30-39
        case (0...22.7, 30...39,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (22.8...26.9, 30...39,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (27...31.4, 30...39,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (31.5...35.6, 30...39,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (35.7...40, 30...39,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (40.1..., 30...39,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
              //USIA 40-49
        case (0...20.9, 40...49,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (21...24.4, 40...49,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (24.5...28.9, 40...49,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (29...32.8, 40...49,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (32.9...36.9, 40...49,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (37..., 40...49,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
            // Usia 50 - 59
        case (0...20.1, 50...59,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (20.2...22.7, 50...59,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (22.8...26.9, 50...59,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (27...31.4, 50...59,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (31.5...35.7, 50...59,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (35.8..., 50...59,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
            // Usia 60++
        case (0...17.4, 60...,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Very Bad ", blood) as String
            break
        case (17.5...20.1, 60...,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f -->  Bad ", blood) as String
            break
        case (20.2...24.4, 60...,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Normal ", blood) as String
            break
        case (24.5...30.3, 60...,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Good ", blood) as String
            break
        case (30.4...31.4, 60...,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Amazing ", blood) as String
            break
        case (31.5..., 60...,"Female" ):
            str = NSString(format: "Your VO2Max is %.2f --> Perfect! ", blood) as String
            break
            
            
            
        default:
            str = "Unknown!"
            break
        }
        
    
//    switch(blood)
//           {
//    case 0...34.9 ,
//        14...19 where dataGender==[String](arrayLiteral:"Male"):
//               str = NSString(format: "Your VO2Max is %.2f --> Under ", blood) as String
//               lblResult.backgroundColor = UIColor.orange
//           case 18.5...24.9:
//               str = NSString(format: "Your VO2Max is %.2f --> Normal  keep up the good work", blood) as String
//               lblResult.backgroundColor = UIColor.green
//           case 25...29.9:
//               str = NSString(format: "Your VO2Max is %.2f --> Over", blood) as String
//               lblResult.backgroundColor = UIColor.red
//           default:
//               str = NSString(format: "Your VO2Max is %.2f --> Obese", blood) as String
//               lblResult.backgroundColor = UIColor.red
//           }

    lblResult.text = str
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataGender.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component:Int, reusing view: UIView?) -> UIView{
        let label = UILabel(frame: CGRect(x:0,y:0, width:lebar, height: 30))
        label.text = dataGender[row]
        label.sizeToFit()
        return label
    }
}


