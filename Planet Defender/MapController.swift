
import Foundation
import UIKit
import SpriteKit
import MapboxMaps

class MapController: SKScene {
     
    
    internal var mapView: MapView!
    override func didMove(to view: SKView) {
             
        
        let myCamerOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 38.89, longitude: -75.53), zoom: 6, pitch: 45)
        let myMapInitOptions = MapInitOptions(cameraOptions: myCamerOptions, styleURI: StyleURI(rawValue:"mapbox://styles/mezhik/clkb3yyy800ub01peertt1tn9"))
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
     
        self.view!.addSubview(mapView)
        
       
        var pointAnnotation = PointAnnotation(coordinate:CLLocationCoordinate2D( latitude: 38.89, longitude: -77.03))
        pointAnnotation.image = .init(image: UIImage(named: "red_marker")!, name: "red_marker")
        pointAnnotation.iconAnchor = .bottom
        pointAnnotation.iconSize = 0.1
        pointAnnotation.isDraggable = true
        pointAnnotation.tapHandler = {[id = pointAnnotation.id] _ in
            print("Tapped annotation: \(id)")
            
            let sceneToMoveTo = GameScene(size: self.size)
            sceneToMoveTo.scaleMode = self.scaleMode
            let myTransition = SKTransition.fade(withDuration: 0.5)
            view.presentScene(sceneToMoveTo, transition: myTransition)
            
            return true

        }
        
        var pointAnnotation2 = PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 40.71, longitude: -74.01))
        pointAnnotation2.image = .init(image: UIImage(named: "point2")!, name: "point2")
        pointAnnotation2.iconAnchor = .bottom
        pointAnnotation2.textField = "New York City"
        pointAnnotation2.iconSize = 0.1
        
        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
        pointAnnotationManager.annotations = [pointAnnotation, pointAnnotation2]
       
         }
    
    
            
            
        
    
    let geoJSON: String =
    """
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [
            67.05152415260346,
            24.974499957919136
          ],
          [
            32.98790019356292,
            39.97341052386673
          ],
          [
            9.298124274952215,
            33.76396594233526
          ],
          [
            40.95383272030401,
            11.61689038966017
          ],
          [
            67.16133778250475,
            24.828915532172743
          ]
        ],
        "type": "LineString"
      }
    }
  ]
}
"""
     }

