//
//  VisionService.swift
//  VisionSandbox
//
//  Created by Abdulaziz Alobaili on 26/08/2022.
//

import Vision

class VisionService: ObservableObject {
    let image1URL = Bundle.main.url(forResource: "image1", withExtension: "png")!
    let image2URL = Bundle.main.url(forResource: "image2", withExtension: "png")!
    let image3URL = Bundle.main.url(forResource: "image3", withExtension: "png")!
    let image4URL = Bundle.main.url(forResource: "image4", withExtension: "png")!

    @Published var image1BoundingBox: CGRect?
    @Published var image2BoundingBox: CGRect?
    @Published var image3BoundingBox: CGRect?
    @Published var image4BoundingBox: CGRect?
    @Published var image1ContainsCar = false
    @Published var image2ContainsCar = false
    @Published var image3ContainsCar = false
    @Published var image4ContainsCar = false

    func detectImage1Face() {
        let detectFacesRequest = VNDetectFaceRectanglesRequest()
        #if targetEnvironment(simulator)
        detectFacesRequest.usesCPUOnly = true
        #endif
        let requestHandler = VNImageRequestHandler(url: image1URL)
        try! requestHandler.perform([detectFacesRequest])
        let faceObservation = detectFacesRequest.results!.first!
        image1BoundingBox = faceObservation.boundingBox
    }

    func detectImage2Face() {
        let detectFacesRequest = VNDetectFaceRectanglesRequest()
        #if targetEnvironment(simulator)
        detectFacesRequest.usesCPUOnly = true
        #endif
        let requestHandler = VNImageRequestHandler(url: image2URL)
        try! requestHandler.perform([detectFacesRequest])
        let faceObservation = detectFacesRequest.results!.first!
        image2BoundingBox = faceObservation.boundingBox
    }

    func detectImage3Face() {
        let detectFacesRequest = VNDetectFaceRectanglesRequest()
        #if targetEnvironment(simulator)
        detectFacesRequest.usesCPUOnly = true
        #endif
        let requestHandler = VNImageRequestHandler(url: image3URL)
        try! requestHandler.perform([detectFacesRequest])
        let faceObservation = detectFacesRequest.results!.first!
        image3BoundingBox = faceObservation.boundingBox
    }

    func detectImage1Car() {
        let request = VNClassifyImageRequest()
        let handler = VNImageRequestHandler(url: image1URL)
        try! handler.perform([request])
        let observations = request.results!
        let preciseObservations = observations.filter { $0.hasMinimumRecall(0, forPrecision: 0.5) }
        if let vehicleObservation = preciseObservations.first(where: { $0.identifier == "vehicle" }), vehicleObservation.confidence > 0.3 {
            image1ContainsCar = true
        }
    }

    func detectImage2Car() {
        let request = VNClassifyImageRequest()
        let handler = VNImageRequestHandler(url: image2URL)
        try! handler.perform([request])
        let observations = request.results!
        let preciseObservations = observations.filter { $0.hasMinimumRecall(0, forPrecision: 0.5) }
        if let vehicleObservation = preciseObservations.first(where: { $0.identifier == "vehicle" }), vehicleObservation.confidence > 0.3 {
            image2ContainsCar = true
        }
    }

    func detectImage3Car() {
        let request = VNClassifyImageRequest()
        let handler = VNImageRequestHandler(url: image3URL)
        try! handler.perform([request])
        let observations = request.results!
        let preciseObservations = observations.filter { $0.hasMinimumRecall(0, forPrecision: 0.5) }
        if let vehicleObservation = preciseObservations.first(where: { $0.identifier == "vehicle" }), vehicleObservation.confidence > 0.3 {
            image3ContainsCar = true
        }
    }

    func detectImage4Car() {
        let request = VNClassifyImageRequest()
        let handler = VNImageRequestHandler(url: image4URL)
        try! handler.perform([request])
        let observations = request.results!
        let preciseObservations = observations.filter { $0.hasMinimumRecall(0, forPrecision: 0.5) }
        if let vehicleObservation = preciseObservations.first(where: { $0.identifier == "vehicle" }), vehicleObservation.confidence > 0.3 {
            image4ContainsCar = true
        }
    }
}
