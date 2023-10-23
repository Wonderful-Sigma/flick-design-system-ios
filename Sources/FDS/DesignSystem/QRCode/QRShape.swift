import SwiftUI
import QRCode

@available(macOS 12, iOS 15, *)
public struct QRShape: View {
    
    let data: String
    
    public init(_ data: String) {
        self.data = data
    }
    
    var document: QRCode.Document {
        let doc = QRCode.Document(utf8String: data)
        
        doc.design.shape.eye = QRCode.EyeShape.Squircle()
        doc.design.shape.pupil = QRCode.PupilShape.Circle()
        doc.design.shape.onPixels = QRCode.PixelShape.RoundedPath()
        doc.design.style.onPixels = QRCode.FillStyle.Solid(Color.subTitle.cgColor!)
        let image = UIImage(named: "QRImage",
                            in: .module,
                            compatibleWith: nil)?.cgImage
        
        doc.logoTemplate = QRCode.LogoTemplate.SquareCenter(image: image!, inset: 0)
        
        return doc
    }
    
    public var body: some View {
        QRCodeDocumentUIView(document: document)
            .frame(width: 255, height: 255)
    }
}
