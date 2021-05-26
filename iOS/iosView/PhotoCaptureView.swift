//
//  PhotoCaptureView.swift
//  EquipmentList (iOS)
//
//  Created by ak77m on 09.05.2021.
//

import SwiftUI

struct PhotoCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    @Binding var myUiImage: UIImage?
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image, myUiImage: $myUiImage, sourceType: .camera)
    }
}

#if DEBUG
struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")), myUiImage: .constant(UIImage()))
    }
}
#endif
