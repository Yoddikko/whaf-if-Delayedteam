import SwiftUI
import PlaygroundSupport
import CoreGraphics

//scena 1
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

struct ContentView: View {
    @State var rotation = false
    @State var scale = 0.00
    @State var opac = 1.00
    @State var tappato = 0

    
    @State private var showingGame = false
    var body: some View {
    //    scene.backgroundImage = #imageLiteral(resourceName: "space.jpeg")
        ZStack {
        Image(uiImage: #imageLiteral(resourceName: "space.jpeg"))
            .resizable()
            .frame(width: 600, height: 600)
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "wormhole.png"))
                    .resizable()
                    .frame(width: 400, height: 400)
                    .scaleEffect(scale)
                    .animation(
                        .linear(duration: 1.2),
                        value: scale
                    )
                    .onAppear{ //appena compare l'immagine
                        rotation = true
                        scale = 1                   }
                    .rotationEffect(rotation ? .zero : Angle.degrees(360))
                    .animation(
                        .linear(duration: 40).repeatForever(autoreverses: false),
                        value: rotation
                    )
                    .onTapGesture {

                        
                        
                        tappato = tappato + 1
                        scale = 5
                        opac = 0
                        if tappato == 1 {
                            playSound(sound: "portal", type: "wav")
                            audioPlayer?.numberOfLoops = 0
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                PlaygroundPage.current.setLiveView(ContentView2())
                            }
                        }
                        else {print ("Hai già tappato")}
                    }


                Text("What if...")
                                    .padding(10)
                                    .font(.system(size: 30, weight: .light, design: .serif))
                                    //.italic()
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(20)
                    .opacity(opac)
                Text("Delayed team | Alessio Iodice & Martina Esposito")
                                    .padding(10)
                                    .font(.system(size: 10, weight: .light, design: .serif))
                                    //.italic()
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(20)
                    .opacity(opac)
            }
        }
    }
}




//scena 2
struct ContentView2: View {
    @State var value = 1.00
    @State var scale1 = 0.00
    @State var rotation1 = false
    @State var y = 1.00
    @State var tappato1 = 0
    @State var tapped = false
    

    var body: some View {
        ZStack {
              Image(uiImage: #imageLiteral(resourceName: "park"))
                  .resizable()
                  .frame(width: 600, height: 600)
                    VStack{
                        Image(uiImage: #imageLiteral(resourceName: "apple.png"))
                                  .resizable()
                                  .rotationEffect(rotation1 ? .zero : Angle.degrees(360))
                                  .animation(
                                      .linear(duration: 40).repeatForever(autoreverses: false),
                                      value: rotation1
                                  )
                                  .frame(width: 35, height: 35)
                                  .padding(.top ,-100)
                                  .padding(.leading ,100)
                                  .offset(y: y)
                                  .onTapGesture {
                                      rotation1 = true
                                      tappato1 = tappato1 + 1
                                      withAnimation(.linear(duration: 18)){
                                          y = -150
                                        
                                      }
                                      if tappato1 == 1 {
                                          tapped = true
                                          playSound(sound: "pop", type: "wav")
                                          audioPlayer?.numberOfLoops = 0
                                          DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                            PlaygroundPage.current.setLiveView(ContentView3())
                                          }
                                      }
                                      else {print ("Hai già tappato")}
                                  }
                        

                        Image(uiImage: #imageLiteral(resourceName: "isaac"))
                            .resizable()
                            .rotationEffect(rotation1 ? .zero : Angle.degrees(360))
                            .animation(
                                .linear(duration: 40).repeatForever(autoreverses: false),
                                value: rotation1
                            )



                                  .frame(width: 100, height: 200)
                                  .padding(.leading ,400)
                                  .padding(.top ,25)
                                  .onTapGesture {
                                      rotation1 = true
                                      tappato1 = tappato1 + 1
                                      withAnimation(.linear(duration: 18)){
                                          y = -150
                                      }
                                      if tappato1 == 1{
                                          playSound(sound: "pop", type: "wav")
                                          audioPlayer?.numberOfLoops = 0
                                          tapped = true
                                          
                                          DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                              PlaygroundPage.current.setLiveView(ContentView3())
                                          }
                                      }
                                  }

                       }
                Text("It is said that in a parallel universe Isaac Newton was sitting under an apple tree on his estate in Woolsthorpe when an apple did not fall on his head. He was deep in his thoughts when nothing fell from the apple tree. ") //testo 1
                .transition(.opacity)
                .frame(maxWidth: 450, alignment: .center)
                .position(x:300, y:520)
                .font(.system(size: 20, weight: .light, design: .serif))
                .onAppear{
                    value = 10
                    scale1 = 1
                }

            Text("Tap the Apple or Isaac Newton!")
                .foregroundColor(tapped ? Color.green : Color.red)
                .position(x:300 , y:425)

        }
    }
}




//scene 3
struct ContentView3: View {
@State var value = 1.00
@State var scale1 = 0.00
@State var rotation1 = false
    
    @State private var angle: Double = 0
    @State private var angle1: Double = 0
    @State private var angle2: Double = 0

@State var cat = false
@State var can = false
@State var trash = false
@State var apple = false
@State var tapped = 0
@State var tappedAll = false

    var body: some View {
        ZStack {
            Image(uiImage: #imageLiteral(resourceName: "city.png"))
                .resizable()
                .frame(width: 600, height: 600)
            Text("In this universe the laws of dynamics were never theorized and therefore people began to fluctuate due to the absence of a law that theorized the force of gravity.")
                .position(x:200, y:520)
                .frame(maxWidth: 400, alignment: .center)
                .font(.system(size: 20, weight: .light, design: .serif))
 

            VStack {
                Image(uiImage: #imageLiteral(resourceName: "cat.png"))
                    .resizable()
                    .onTapGesture {
                        playSound(sound: "ding", type: "aiff")
                        audioPlayer?.numberOfLoops = 0

                        angle -= 45
                        if cat == false {
                            tapped += 1
                        }
                        cat = true
                        
                        if tapped == 4 {
                            tappedAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                PlaygroundPage.current.setLiveView(ContentView4())
                            }
                        }
                        }
                    .padding()
                    .rotationEffect(.degrees(angle))
                    .animation(.easeIn, value: angle)
                    .onAppear {
                        rotation1 = true
                    }
                    .frame(width: 140, height: 100)
                    .rotationEffect(rotation1 ? .zero : Angle.degrees(360))
                    .animation(
                        .linear(duration: 70).repeatForever(autoreverses: false),
                        value: rotation1
                    )
                    .position(x: 100, y:350)

                Image(uiImage: #imageLiteral(resourceName: "can.png"))
                    .resizable()
                    .onTapGesture {
                        playSound(sound: "ding", type: "aiff")
                        audioPlayer?.numberOfLoops = 0

                        angle1 -= 45
                        if can == false {
                            tapped += 1
                        }
                        can = true
                        if tapped == 4 {
                            tappedAll = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                PlaygroundPage.current.setLiveView(ContentView4())
                            }
                        }
                    }
                    .padding()
                    .rotationEffect(.degrees(angle1))
                    .animation(.easeIn, value: angle1)
                    .onAppear {
                        rotation1 = true
                    }
                    .frame(width: 50, height: 60)
                    .rotationEffect(rotation1 ? .zero : Angle.degrees(360))
                    .animation(
                        .linear(duration: 40).repeatForever(autoreverses: false),
                        value: rotation1
                    )
                    .padding(.bottom, 400)
                    .padding(.leading, 300)
                
             }
            
            Image(uiImage: #imageLiteral(resourceName: "trash.png"))
                .resizable()
                .onTapGesture {
                    playSound(sound: "ding", type: "aiff")
                    audioPlayer?.numberOfLoops = 0

                    if trash == false {
                        tapped += 1
                    }
                    trash = true
                    angle2 -= 45
                    if tapped == 4 {
                        tappedAll = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            PlaygroundPage.current.setLiveView(ContentView4())
                        }
                    }
                }
                .padding()
                .rotationEffect(.degrees(angle2))
                .animation(.easeIn, value: angle2)
                .onAppear {
                    rotation1 = true
                }
                .frame(width: 130, height: 150)
                .rotationEffect(rotation1 ? .zero : Angle.degrees(360))
                .animation(
                    .linear(duration: 25).repeatForever(autoreverses: false),
                    value: rotation1
                )
                .position(x: 240, y:100)

            
            Image(uiImage: #imageLiteral(resourceName: "apple.png"))
                .resizable()
                .onTapGesture {
                    playSound(sound: "ding", type: "aiff")
                    audioPlayer?.numberOfLoops = 0
                    if apple == false {
                        tapped += 1
                    }
                    apple = true
                    if tapped == 4 {
                        tappedAll = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            PlaygroundPage.current.setLiveView(ContentView4())
                        }
                    }
                }
                .position(x: 95, y:35)
                .onAppear {
                    rotation1 = true
                }
                .frame(width: 30, height: 30)
                .rotationEffect(rotation1 ? .zero : Angle.degrees(360))
                .animation(
                    .linear(duration: 2).repeatForever(autoreverses: false),
                    value: rotation1
                )

            Text("Tap all the objects!")
                .position(x:300 , y:400)
            Text("Items tapped: \(tapped) / 4")
                .position(x: 300, y: 425)
                .foregroundColor(tappedAll ? Color.green : Color.red)
        }

    }
}

//scene 4
struct ContentView4: View {
    @State var opacity2 = 0.0
    @State var opacity1 = 0.75
    @State var value = 1.00
    @State var scale1 = 0.00
    @State var pear = false
    @State var scale = 0.75
    @State var scale2 = 0.00
    @State var fadeInOut = false

    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 600, height: 600)
            
                Text("Tap the logo")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    .frame(maxWidth: 400, alignment: .center)
                    .position(x:275, y:35)
                    .opacity(opacity1)
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .onAppear(){
                        withAnimation(Animation
                                        .easeInOut(duration:0.6)
                            .repeatForever(autoreverses: true)){
                            fadeInOut.toggle()
                        }
                    }.opacity(fadeInOut ? 0 : 1)
            
            Image(uiImage: UIImage(named: "apple2.png")!)
                .resizable()
                .position(x:170, y:70)
                .scaledToFit()
                .frame(width: 400, height: 400)
                .padding()
                .scaleEffect(scale)
                .animation(
                    .linear(duration: 1),
                    value: scale
                )
                .onTapGesture {
                    opacity2 = 1
                    scale = 0.0
                    scale2 = 0.75
                    pear = true
                    opacity1 = 0.00
                    
                }
                .padding()
            Image(uiImage: UIImage(named: "pear.png")!)
                .resizable()
                .position(x:165, y:100)
                .scaledToFit()
                .frame(width: 400, height: 400)
                .padding()
                .opacity(opacity2)
                .scaleEffect(scale2)
                .animation(
                    .linear(duration: 1),
                    value: scale2
                )
            Text("Consequently the apple logo, which was created in 1976, was not inspired by Isaac Newton sitting under an apple tree, but ...") //testo 1
                            .frame(maxWidth: 400, alignment: .center)
                            .position(x:300, y:480)
                            .font(.system(size: 30, weight: .light, design: .serif))
                            .onAppear{
                                value = 10
                                scale1 = 1
                            }
                            .scaleEffect(scale1)
                            .animation(
                                Animation.spring(response: 0.5, dampingFraction: 1),
                                value: value
                            )
            if pear{
                Text(" BY A PEAR!")
                    .frame(maxWidth: 400, alignment: .center)
                    .position(x:435, y:635)
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .opacity(opacity2)
                    .scaleEffect(scale2)
                    .animation(
                        .linear(duration: 1),
                        value: scale2
                    )
            }
        }
    }
}
PlaygroundPage.current.setLiveView(ContentView())
