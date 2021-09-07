// CoordinateSpacesExperiment.swift
// Experiments by Olivier

// MARK: - LIBRARIES -

import SwiftUI



struct CoordinateSpacesExperiment: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      GeometryReader { geometryProxy in
         ZStack {
            Circle()
               .foregroundColor(.yellow)
               .frame(width: 300)
               .position(x: geometryProxy.frame(in: .global).midX,
                         y: geometryProxy.frame(in: .global).midY)
            Circle()
               .foregroundColor(.orange)
               .frame(width: 200)
               .position(x: geometryProxy.frame(in: .local).midX,
                         y: geometryProxy.frame(in: .local).midY)
            Circle()
               .foregroundColor(.red)
               .frame(width: 100)
               .position(x: geometryProxy.frame(in: .named("Custom")).midX,
                         y: geometryProxy.frame(in: .named("Custom")).midY)
            Circle()
               .foregroundColor(.black)
               .frame(width: 10)
         }
      }
      
//      GeometryReader { geometryProxy in
//         ZStack {
//            Circle()
//               .foregroundColor(.yellow)
//               .frame(width: geometryProxy.size.width)
//            Circle()
//               .foregroundColor(.orange)
//               .frame(width: geometryProxy.size.width * 0.60)
//            Circle()
//               .foregroundColor(.red)
//               .frame(width: geometryProxy.size.width * 0.30)
//            Circle()
//               .foregroundColor(.black)
//               .frame(width: 10)
//         }
//      }
//      .padding()
      
//      ZStack {
//         Circle()
//            .foregroundColor(.yellow)
//            .frame(width: 300)
//         Circle()
//            .foregroundColor(.orange)
//            .frame(width: 200)
//         Circle()
//            .foregroundColor(.red)
//            .frame(width: 100)
//         Circle()
//            .foregroundColor(.black)
//            .frame(width: 10)
//      }
   }
}

/*
 print("Global center: \(geometryProxy.frame(in: .global).midX) x \(geometryProxy.frame(in: .global).midY)")
 print("Custom center: \(geometryProxy.frame(in: .named("Custom")).midX) x \(geometryProxy.frame(in: .named("Custom")).midY)")
 print("Local center: \(geometryProxy.frame(in: .local).midX) x \(geometryProxy.frame(in: .local).midY)")
 */



// MARK: - PREVIEWS -

struct CoordinateSpacesExperiment_Previews: PreviewProvider {
   
   static var previews: some View {
      
      CoordinateSpacesExperiment()
   }
}
