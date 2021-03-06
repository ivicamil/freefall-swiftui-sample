import SwiftUI

struct CelestialObjectSelector: View {
    
    @Binding var object: CelestialObject
    
    @State(initialValue: false) private var showObjectPicker: Bool
    
    var body: some View {
        
        Button(action: {
            self.showObjectPicker.toggle()
        },
               label: {
                Text(object.name)
        })
            .sheet(isPresented: $showObjectPicker) {
                NavigationView {
                    ObjectPicker(
                        object: self.$object,
                        showObjectPicker: self.$showObjectPicker
                    )
                        .navigationBarTitle("Celestial Object")
                        .navigationBarItems(trailing: Button(
                            action: { self.showObjectPicker = false },
                            label: { Text("Cancel") }))
                }
                
        }
    }
}


private struct ObjectPicker: View {
    
    @Binding var object: CelestialObject
    
    @Binding var showObjectPicker: Bool
    
    var body: some View {
        List(CelestialObject.allCases) { g in
            Button(
                action: {
                    self.object = g
                    self.showObjectPicker = false
            },
                label: {
                    Text(g.name)
            })
        }
    }
}

struct CelestialObjectSelector_Previews: PreviewProvider {
    static var previews: some View {
        CelestialObjectSelector(object: .constant(.earth))
    }
}
