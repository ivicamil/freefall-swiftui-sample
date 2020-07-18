
import SwiftUI

struct FreeFallTube: View {
    
    let dropped: Bool
    
    let location: CelestialObject
    
    let height: Double = 20.0
    
    private var animationTime: Double {
        return sqrt(2 * height / location.gravitationalAcceleration)
    }
    
    var body: some View {
        
        ZStack {
            Rectangle()
            VStack {
                                
                if dropped {
                    Spacer()
                }
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 40, height: 40)
                    .animation(.easeIn(duration: dropped ? animationTime : 0.0))
                
                if !dropped {
                    Spacer()
                }
            }
        }
    }
}

struct FreeFallTube_Previews: PreviewProvider {
    static var previews: some View {
        FreeFallTube(dropped: false, location: .earth)
    }
}
