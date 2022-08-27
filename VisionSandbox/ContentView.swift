//
//  ContentView.swift
//  VisionSandbox
//
//  Created by Abdulaziz Alobaili on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var visionService: VisionService

    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: UIImage(contentsOfFile: visionService.image1URL.path)!)
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        GeometryReader { geometry in
                            ZStack(alignment: .bottomTrailing) {
                                if let boundingBox = visionService.image1BoundingBox {
                                    Rectangle()
                                        .path(in: CGRect(
                                            x: boundingBox.minX * geometry.size.width,
                                            y: (boundingBox.minY * geometry.size.height),
                                            width: boundingBox.width * geometry.size.width,
                                            height: boundingBox.height * geometry.size.height
                                        ))
                                        .stroke(.red)
                                        .rotation3DEffect(.degrees(180), axis: (1, 0, 0))
                                }

                                Text(visionService.image1ContainsCar ? "Vehicle Clearly Visible" : "No Clearly Visible Vehicles")
                                    .padding(4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.regularMaterial)
                                    }
                                    .padding(4)
                            }
                        }
                    }
                    .onAppear {
                        visionService.detectImage1Face()
                        visionService.detectImage1Car()
                    }

                Image(uiImage: UIImage(contentsOfFile: visionService.image2URL.path)!)
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        GeometryReader { geometry in
                            ZStack(alignment: .bottomTrailing) {
                                if let boundingBox = visionService.image2BoundingBox {
                                    Rectangle()
                                        .path(in: CGRect(
                                            x: boundingBox.minX * geometry.size.width,
                                            y: (boundingBox.minY * geometry.size.height),
                                            width: boundingBox.width * geometry.size.width,
                                            height: boundingBox.height * geometry.size.height
                                        ))
                                        .stroke(.red)
                                        .rotation3DEffect(.degrees(180), axis: (1, 0, 0))
                                }

                                Text(visionService.image2ContainsCar ? "Vehicle Clearly Visible" : "No Clearly Visible Vehicles")
                                    .padding(4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.regularMaterial)
                                    }
                                    .padding(4)
                            }
                        }
                    }
                    .onAppear {
                        visionService.detectImage2Face()
                        visionService.detectImage2Car()
                    }

                Image(uiImage: UIImage(contentsOfFile: visionService.image3URL.path)!)
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        GeometryReader { geometry in
                            ZStack(alignment: .bottomTrailing) {
                                if let boundingBox = visionService.image3BoundingBox {
                                    Rectangle()
                                        .path(in: CGRect(
                                            x: boundingBox.minX * geometry.size.width,
                                            y: (boundingBox.minY * geometry.size.height),
                                            width: boundingBox.width * geometry.size.width,
                                            height: boundingBox.height * geometry.size.height
                                        ))
                                        .stroke(.red)
                                        .rotation3DEffect(.degrees(180), axis: (1, 0, 0))
                                }

                                Text(visionService.image3ContainsCar ? "Vehicle Clearly Visible" : "No Clearly Visible Vehicles")
                                    .padding(4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.regularMaterial)
                                    }
                                    .padding(4)
                            }
                        }
                    }
                    .onAppear {
                        visionService.detectImage3Face()
                        visionService.detectImage3Car()
                    }

                Image(uiImage: UIImage(contentsOfFile: visionService.image4URL.path)!)
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        GeometryReader { geometry in
                            ZStack(alignment: .bottomTrailing) {
                                if let boundingBox = visionService.image4BoundingBox {
                                    Rectangle()
                                        .path(in: CGRect(
                                            x: boundingBox.minX * geometry.size.width,
                                            y: (boundingBox.minY * geometry.size.height),
                                            width: boundingBox.width * geometry.size.width,
                                            height: boundingBox.height * geometry.size.height
                                        ))
                                        .stroke(.red)
                                        .rotation3DEffect(.degrees(180), axis: (1, 0, 0))
                                }

                                Text(visionService.image4ContainsCar ? "Vehicle Clearly Visible" : "No Clearly Visible Vehicles")
                                    .padding(4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.regularMaterial)
                                    }
                                    .padding(4)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        }
                    }
                    .onAppear {
                        visionService.detectImage4Car()
                    }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(visionService: .init())
            .previewLayout(.sizeThatFits)
    }
}
