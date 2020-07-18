import SwiftUI

struct CelectialObjectSelector: View {
    
    @Binding var gravity: CelectialBody
    
    @State(initialValue: false) private var showGravityList: Bool
    
    var body: some View {
        
        
        Button(action: {
            self.showGravityList.toggle()
        },
               label: {
                Text(gravity.name)
        })
            .sheet(isPresented: $showGravityList) {
                NavigationView {
                    List(CelectialBody.allCases) { g in
                        Button(
                            action: {
                                self.gravity = g
                                self.showGravityList = false
                        },
                            label: {
                                Text(g.name)
                        }).navigationBarTitle("Celectial Object")
                    }
                    .navigationBarItems(trailing: Button(
                        action: { self.showGravityList = false },
                        label: { Text("Cancel") })
                    )
                }
        }
        
    }
}

struct GravitySelector_Previews: PreviewProvider {
    static var previews: some View {
        CelectialObjectSelector(gravity: .constant(.earth))
    }
}
