//
//  CameraView.swift
//  PhotoAndAnimations
//
//  Created by Konstantin Loginov on 11/10/2021.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator(handlePickedImage: handlePickedImage)
    }
    
    var handlePickedImage: (UIImage?) -> Void
    
    static var isAvailable: Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var handlePickedImage: (UIImage?) -> Void
        
        init(handlePickedImage: @escaping (UIImage?) -> Void) {
            self.handlePickedImage = handlePickedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            handlePickedImage((info[.editedImage] ?? info[.originalImage]) as? UIImage)
        }
    }
     
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
