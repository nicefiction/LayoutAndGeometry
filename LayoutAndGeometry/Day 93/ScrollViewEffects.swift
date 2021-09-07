// ScrollViewEffects.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/scrollview-effects-using-geometryreader
/// When we use the `frame(in:)` method of a `GeometryReader`,
/// SwiftUI will calculate the view’s current position in the coordinate space we ask for .
/// However , as the view moves those values will change ,
/// and SwiftUI will automatically make sure `GeometryReader` stays updated .
/// Previously we used `DragGesture` to store a width and height as an `@State` property ,
/// because it allowed us to adjust other properties based on the drag amount to create neat effects .
/// However , with `GeometryReader` we can grab values from a view’s environment dynamically ,
/// feeding in its absolute or relative position into various modifiers . Even better ,
/// you can nest geometry readers
/// so that one can read the geometry for a higher-up view
/// and the other can read the geometry for something further down the tree :

// MARK: - LIBRARIES -

import SwiftUI



struct ScrollViewEffects: View {
   
   // MARK: - PROPERTIES
   
   let colors: Array<Color> = [
      .yellow , .orange , .red , .pink , .blue , .purple , .green
   ]
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      GeometryReader { outerGeometryProxy in
         ScrollView(.vertical) {
            ForEach(0..<50) { index in
               GeometryReader { innerGeometryProxy in
                  Text("Row \(index)")
                     .font(.title)
                     .frame(width: outerGeometryProxy.size.width)
                     .background(colors[index % 7])
//                     .rotation3DEffect(.degrees(Double(innerGeometryProxy.frame(in: .global).minY) / 5),
//                                       axis: (x: 0, y: 1, z: 0))
                     .rotation3DEffect(.degrees(Double(innerGeometryProxy.frame(in: .global).minY - outerGeometryProxy.size.height / 2) / 5),
                                      axis: (x: 0, y: 1, z: 0))
               }
               .frame(height: 40)
            }
         }
      }
   }
}





// MARK: - PREVIEWS -

struct ScrollViewEffects_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ScrollViewEffects()
         .preferredColorScheme(.dark)
   }
}
