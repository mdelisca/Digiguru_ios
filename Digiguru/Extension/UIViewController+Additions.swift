//
//  UIViewController+Additions.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit
import PhotosUI
import JGProgressHUD
import NVActivityIndicatorView
class UIViewController_Additions: NSObject {

}
extension UIResponder{
    func showHUDView(hudIV: hudIndicatorView,text: hudText,completion: ((JGProgressHUD)->())? = nil){
        let hud = JGProgressHUD()
        
        hud.interactionType = .blockAllTouches
        hud.animation = JGProgressHUDFadeZoomAnimation.init()
        switch hudIV {
        case .indeterminate:
            hud.indicatorView = JGProgressHUDIndeterminateIndicatorView.init()
        case .success:
            hud.indicatorView = JGProgressHUDSuccessIndicatorView.init()
        case .pie:
            hud.indicatorView = JGProgressHUDPieIndicatorView.init()
        case .error:
            hud.indicatorView = JGProgressHUDErrorIndicatorView.init()
        case .image:
            hud.indicatorView = JGProgressHUDImageIndicatorView.init()
        case .ring:
            hud.indicatorView = JGProgressHUDRingIndicatorView.init()
        }
        
        switch text {
        case .load:
            hud.textLabel.text = text.rawValue
        case .process:
            hud.textLabel.text = text.rawValue
        case .complete:
            hud.textLabel.text = text.rawValue
        case .success:
            hud.textLabel.text = text.rawValue
        case .error:
            hud.textLabel.text = text.rawValue
        case .evaluating:
            hud.textLabel.text = text.rawValue
        case .LoadingTastybox:
            hud.textLabel.text = text.rawValue
        }
        
        completion?(hud)
        
        
    }
    func showIndicatorView(view: UIViewController,text: hudText,type:NVActivityIndicatorType,color:UIColor,completion: ((NVActivityIndicatorView)->())? = nil){
        let indicatorview = NVActivityIndicatorView(frame: view.view.frame, type: type, color: color)
        
        completion?(indicatorview)
    }
}
extension UIViewController {
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissVCAction() {
        self.dismiss(animated: true) {
            
        }
    }
    func takePhoto(btn:UIButton){
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    print("OKAY")
                } else {
                    print("NOTOKAY")
                }
            })
        }
        checkLibrary(btn: btn)
        checkPermission(btn: btn)
    }
}
extension UIViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate, UNUserNotificationCenterDelegate{
    func displayUploadImageDialog(btnSelected: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        let alertController = UIAlertController(title: "", message: "Upload profile photo?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel action"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true) {() -> Void in }
        })
        alertController.addAction(cancelAction)
        let cameraRollAction = UIAlertAction(title: NSLocalizedString("Open library", comment: "Open library action"), style: .default, handler: {(_ action: UIAlertAction) -> Void in
            if UI_USER_INTERFACE_IDIOM() == .pad {
                OperationQueue.main.addOperation({() -> Void in
                    picker.sourceType = .photoLibrary
                    self.present(picker, animated: true) {() -> Void in }
                })
            }
            else {
                picker.sourceType = .photoLibrary
                self.present(picker, animated: true) {() -> Void in }
            }
        })
        alertController.addAction(cameraRollAction)
        let cameraAction = UIAlertAction(title: NSLocalizedString("Camera", comment: "Camera"), style: .default) { (alertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                if UI_USER_INTERFACE_IDIOM() == .pad {
                    OperationQueue.main.addOperation({() -> Void in
                        picker.sourceType = .camera
                        self.present(picker, animated: true) {() -> Void in }
                    })
                }
                else {
                     
                    picker.sourceType = .camera
                    self.present(picker, animated: true) {() -> Void in }
                }
            }
            else{
                
            }

        }
        alertController.addAction(cameraAction)
        alertController.view.tintColor = .black
        if UIDevice.current.userInterfaceIdiom == .pad{
            alertController.modalPresentationStyle = .popover
            if let popoverPresentationController = alertController.popoverPresentationController {
             
                popoverPresentationController.permittedArrowDirections = .left
                popoverPresentationController.sourceView = btnSelected
                alertController.preferredContentSize = CGSize(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/9)
                popoverPresentationController.sourceRect = btnSelected.frame
            }
        }
        present(alertController, animated: true) {() -> Void in }
    }

    

    func checkPermission(btn: UIButton) {
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authStatus {
        case .authorized:
            self.displayUploadImageDialog(btnSelected: btn)
        case .denied:
            print("Error")
        default:
            break
        }
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }


    func checkLibrary(btn:UIButton) {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .authorized {
            switch photos {
            case .authorized:
                self.displayUploadImageDialog(btnSelected: btn)
            case .denied:
                print("Error")
            default:
                break
            }
        }
    }
}
enum hudText:String{
    case load = "Loading..."
    case process = "Processing..."
    case complete = "Completeing..."
    case success = "Success"
    case error = "Error"
    case evaluating = "Evaluating..."
    case LoadingTastybox = "Loading Tastybox..."
}
enum hudIndicatorView{
    case indeterminate,success,pie,error,image,ring
}
enum UserType:String,Codable{
    case user = "user"
    case vendor = "vendor"
}
extension UIViewController{
//    func showHUDView(hudIV: hudIndicatorView,text: hudText,completion: ((JGProgressHUD)->())? = nil){
//        let hud = JGProgressHUD()
//        
//        hud.interactionType = .blockAllTouches
//        hud.animation = JGProgressHUDFadeZoomAnimation.init()
//        switch hudIV {
//        case .indeterminate:
//            hud.indicatorView = JGProgressHUDIndeterminateIndicatorView.init()
//        case .success:
//            hud.indicatorView = JGProgressHUDSuccessIndicatorView.init()
//        case .pie:
//            hud.indicatorView = JGProgressHUDPieIndicatorView.init()
//        case .error:
//            hud.indicatorView = JGProgressHUDErrorIndicatorView.init()
//        case .image:
//            hud.indicatorView = JGProgressHUDImageIndicatorView.init()
//        case .ring:
//            hud.indicatorView = JGProgressHUDRingIndicatorView.init()
//        }
//        
//        switch text {
//        case .load:
//            hud.textLabel.text = text.rawValue
//        case .process:
//            hud.textLabel.text = text.rawValue
//        case .complete:
//            hud.textLabel.text = text.rawValue
//        case .success:
//            hud.textLabel.text = text.rawValue
//        case .error:
//            hud.textLabel.text = text.rawValue
//        case .evaluating:
//            hud.textLabel.text = text.rawValue
//        }
//        
//        completion?(hud)
//        
//        
//    }
    func imagetoString(image:UIImage) -> String{
        let data = image.pngData()
        let str = data!.base64EncodedString()
        return str
    }
    func rationalApproximationOf(x0 : Double, withPrecision eps : Double = 1.0E-6) -> Rational {
        var x = x0
        var a = floor(x)
        var (h1, k1, h, k) = (1, 0, Int(a), 1)
        
        while x - a > eps * Double(k) * Double(k) {
            x = 1.0/(x - a)
            a = floor(x)
            (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
        }
        return (h, k)
    }
    func fractionMutableAttributedString(for string: String,  color:UIColor, size: CGFloat, weight: UIFont.Weight) -> NSAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: color, .font: UIFont.systemFont(ofSize: size, weight: weight)]
        //let str = string.replacingOccurrences(of: " ", with: " ", options: .literal, range: string.range(of: " kg"))
        let attributedText = NSMutableAttributedString(string: string, attributes: attributes)
        
        let substring = string.split(separator: " ") // Do we have a fractional value?
        if substring[0].contains("/") {
            let range = (string as NSString).range(of: String(substring[0]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.fractionFont(ofSize: size,weight: weight), range: range)
        }
        else if substring[1].contains("/"){
            let range = (string as NSString).range(of: String(substring[1]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.fractionFont(ofSize: size,weight: weight), range: range)
        }
        
        
        return attributedText
        
    }
    func getDirectoryPath(isImage:Bool = false) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var documentsDirectory = paths[0] as String
        if isImage{
            
            documentsDirectory = (paths[0] as NSString).appendingPathComponent("Images") as String
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        }
        else{
            
            return documentsDirectory
        }
        
    }
    func getviewHeight() -> CGFloat{
        let frame = UIScreen.main.bounds
        if frame.height <= 667{
            return  frame.height/3.5
            
        }
        else if frame.height <= 736{
            return frame.height/3.7
        }
        else if frame.height <= 812{
            return frame.height/3.9
        }
        else {
            return frame.height/4.1
        }
    }
    func getSigninViewWidth() -> CGFloat{
        let frame = UIScreen.main.bounds
        if frame.width <= 375{
            return  0
            
        }
        else if frame.width <= 414{
            return -frame.width/5
        }
        else{
            return 0
        }
    }
    func getSigninViewHeight() -> CGFloat{
        let frame = UIScreen.main.bounds
        if frame.height <= 667{
            return  32
            
        }
        else if frame.height <= 736{
            return 40
        }
        else if frame.height <= 812{
            return 47
        }
        else {
            return 55
        }
    }
}
