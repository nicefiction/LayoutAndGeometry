// CoverFlowScrolling.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/scrollview-effects-using-geometryreader

// MARK: - LIBRARIES -

import SwiftUI



struct CoverFlowScrolling: View {
   
   // MARK: - NESTED TYPES
      
      private struct Dimension {
         
         static let cardHeight: CGFloat = 150
      }
      
      
   
   // MARK: - PROPERTIES
   
   let colors: Array<Color> = [
      .yellow, .orange, .red, .pink , .purple, .blue, .green
   ]
   
   
   
   // MARK: - COMPUTED PROPERTIES
   var body: some View {
      
      GeometryReader { outerGeometryProxy in
         ScrollView(.horizontal) {
            HStack {
               ForEach(0..<50) { index in
                  GeometryReader { innerGeometryProxy in
                     
                     let cardHalfWidth: CGFloat = innerGeometryProxy.frame(in: .global).midX
                     let mainViewHalfWidth: CGFloat = outerGeometryProxy.size.width / 2
                     let cardRotation: Double = -Double((cardHalfWidth - mainViewHalfWidth) / 10)
                     
                     Rectangle()
                        .fill(colors[index % 7])
                        .frame(height: Dimension.cardHeight)
                        .rotation3DEffect(.degrees(cardRotation),
                                          axis: (x: 0, y: 1, z: 0))
                  }
                  .frame(width: Dimension.cardHeight)
               }
            }
            /// Positions the first square in the middle .
            .padding(.horizontal,
                     (outerGeometryProxy.size.width - Dimension.cardHeight) / 2)
            /// Uncovers the edges of the rotated rectangles .
            .padding(.vertical)
         }
         .frame(height: 300)
         .position(x: outerGeometryProxy.frame(in: .local).midX,
                   y: outerGeometryProxy.frame(in: .local).midY)
      }
   }
}
//Int(geometry.frame(in: .local).minX)





// MARK: - PREVIEWS -

struct CoverFlowScrolling_Previews: PreviewProvider {
   
   static var previews: some View {
      
      CoverFlowScrolling()
   }
}
