
import SwiftUI

struct GravityComparator: View {
    
    @State(initialValue: false) private var dropped: Bool
    
    @State(initialValue: .earth) private var object1: CelestialObject
    
    @State(initialValue: .mars) private var object2: CelestialObject
        
    @State(initialValue: true) private var canChangeObject: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    CelestialObjectSelector(object: $object1).disabled(!canChangeObject)
                    FreeFallTube(dropped: dropped, location: object1)
                }
                VStack {
                    CelestialObjectSelector(object: $object2).disabled(!canChangeObject)
                    FreeFallTube(dropped: dropped, location: object2)
                }
            }
            
            Button (action: {
                self.dropped.toggle()
                self.canChangeObject.toggle()
            }, label: {
                dropped ? Text("Reset") : Text("Drop")
            })
        }
    }
}

struct GravityComparator_Previews: PreviewProvider {
    static var previews: some View {
        GravityComparator()
    }
}
