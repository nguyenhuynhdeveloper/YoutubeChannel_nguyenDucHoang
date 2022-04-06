//
//  WelcomeShape.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 02/04/2022.
//

import SwiftUI

struct WelcomeShape: View {    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.addRect(CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight))
            }
            .fill(.linearGradient(
                            Gradient(colors: [Color(43, 63, 121), Color(154, 55, 126)]),
                            startPoint: UnitPoint(x: 0, y: 0),
                            endPoint: UnitPoint(x: 1, y: 1)
                        ))
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: 0))
                path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: 30))
                path.addQuadCurve(to: CGPoint(x:0, y:300), control: CGPoint(x: UIScreen.screenWidth/3, y: 100))
            }
            .fill(Color(237, 75, 106))
//            .shadow(color: .black.opacity(0.5), radius: 3, x: 1, y: 1)
            Path { path in
                path.addEllipse(in: CGRect(origin: CGPoint(x: 60, y: 50), size: CGSize(width: 70, height: 70)))
            
            }
            .fill(Color.white)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 1, y: 1)
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: UIScreen.screenHeight))
                path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: UIScreen.screenHeight))
                path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: UIScreen.screenHeight - 300))
                path.addQuadCurve(to: CGPoint(x:0, y:UIScreen.screenHeight - 30), control: CGPoint(x: 2 * UIScreen.screenWidth/3, y: UIScreen.screenHeight - 100))
            }
            .fill(Color(237, 75, 106))
//            .shadow(color: .black.opacity(0.3), radius: 3, x: -1, y: -1)
            Path { path in
                path.addEllipse(in: CGRect(origin: CGPoint(x: UIScreen.screenWidth - 130, y: UIScreen.screenHeight - 120), size: CGSize(width: 70, height: 70)))
            
            }
            .fill(Color.white)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 1, y: 1)
        }.ignoresSafeArea()
        
    }
}

struct WelcomeShape_Previews: PreviewProvider {
    
    static var previews: some View {
        WelcomeShape()
            
    }
}
