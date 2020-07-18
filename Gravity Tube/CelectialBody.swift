import Foundation

enum CelectialObject: Double, Hashable, CaseIterable {
    
    case mercury = 0.378
    case venus = 0.907
    case earth = 1.000
    case mars = 0.377
    case jupiter = 2.360
    case saturn = 0.916
    case uranus = 0.889
    case neptune = 1.12
    case pluto = 0.071
    case moon = 0.166
}

extension CelectialObject: Identifiable {
    
    var id: CelectialObject {
        return self
    }
}

extension CelectialObject {
    
    var name: String {
        return "\(self)".capitalized
    }
    
    var gravitationalAcceleration: Double {
        let accelerationOnEarth = 9.81
        return accelerationOnEarth * self.rawValue
    }
}
