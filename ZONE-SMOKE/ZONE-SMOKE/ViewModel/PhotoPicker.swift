//
//  PhotoPicker.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 21.08.2022.
//

import Foundation
import SwiftUI

struct PhotoPicker : UIViewControllerRepresentable{

    @ObservedObject var connectUser = NetworkModel.shared
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.overrideUserInterfaceStyle = .dark
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSCoder, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker : PhotoPicker
        
        init(photoPicker : PhotoPicker){
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.1), let compressedImage = UIImage(data: data) else {
                    return
                }
                photoPicker.connectUser.userAvatar = compressedImage
                photoPicker.connectUser.selectedAvatar = 1
                
                let encode = try! PropertyListEncoder().encode(data)
                UserDefaults.standard.set(encode, forKey: "userAvatar")
                
            } else {
                
            }
            picker.dismiss(animated: true)
        }
    }
}
