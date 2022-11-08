//
//  PopularView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.06.2022.
//

import SwiftUI

struct PopularView: View {
    var popular : Popular
    
    
    var body: some View {
        ZStack{
            
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            //            VStack{
            //                Image(systemName: "chevron.compact.down")
            //                    .foregroundColor(.white)
            //                    .padding()
            //
            //
            //                Spacer()
            //            }
            
            ZoomableScrollView {
                AsyncImage(url: URL(string: popular.image.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!, placeholder: { ProgressView() }, image: { image in
                    Image(uiImage: image)
                        .resizable()
                    
                    
                })
                .scaledToFit().edgesIgnoringSafeArea(.all)
                
            }.edgesIgnoringSafeArea(.all)
            
            
            
            
            
            
            //            Image(popular.image)
            //                .resizable()
            //                .scaledToFill()
            //                .edgesIgnoringSafeArea(.all)
            
        }
        
        
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView(popular: Popular(id: 0, text: "Меню", image: "https://sun9-55.userapi.com/impg/CTmR4e0ZfKDfsBuENQLDY6hX0XhBQ41t6FI1Vw/qjlcfTvwLIc.jpg?size=904x1280&quality=95&sign=ec6a6e40e53509d616003bded4a64a16&type=album"))
    }
}

struct ZoomableScrollView<Content: View>: UIViewRepresentable {
    private var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        // set up the UIScrollView
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator  // for viewForZooming(in:)
        scrollView.maximumZoomScale = 20
        scrollView.minimumZoomScale = 1
        scrollView.bouncesZoom = true
        
        // create a UIHostingController to hold our SwiftUI content
        let hostedView = context.coordinator.hostingController.view!
        hostedView.translatesAutoresizingMaskIntoConstraints = true
        hostedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostedView.frame = scrollView.bounds
        hostedView.backgroundColor = .black
        scrollView.addSubview(hostedView)
        
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(hostingController: UIHostingController(rootView: self.content))
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        // update the hosting controller's SwiftUI content
        context.coordinator.hostingController.rootView = self.content
        assert(context.coordinator.hostingController.view.superview == uiView)
    }
    
    // MARK: - Coordinator
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var hostingController: UIHostingController<Content>
        
        init(hostingController: UIHostingController<Content>) {
            self.hostingController = hostingController
        }
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return hostingController.view
        }
    }
}


