// CoverFlowScrolling.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/scrollview-effects-using-geometryreader

// MARK: - LIBRARIES -

import SwiftUI



struct CoverFlowScrolling: View {
   
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
                     Rectangle()
                        .fill(colors[index % 7])
                        .frame(height: 150)
                        .rotation3DEffect(.degrees(-Double(innerGeometryProxy.frame(in: .global).midX - outerGeometryProxy.size.width / 2) / 10),
                                          axis: (x: 0, y: 1, z: 0))
                  }
                  .frame(width: 150)
               }
            }
            /// Positions the first square in the middle .
            .padding(.horizontal,
                     (outerGeometryProxy.size.width - 150) / 2)
            /// Uncovers the edges of the rotated rectangles .
            .padding(.vertical)
         }
      }
   }
}
/*
 outerGeometryProxy
 */




// MARK: - PREVIEWS -

struct CoverFlowScrolling_Previews: PreviewProvider {
   
   static var previews: some View {
      
      CoverFlowScrolling()
   }
}
