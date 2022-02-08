import SwiftUI

struct ContentView: View {
    @State var progressValue: Float = 0.0
    @State var score: Int=0
    @State var questionNumber = -1
    @State var question:String="Press some button to start"
    
    func handleOnTrue(){
        if questionNumber == -1{
            questionNumber+=1
            question=questions[questionNumber].question
        }
        else if(questions[questionNumber].answer){
            score+=1
            questionNumber+=1
            question=questions[questionNumber].question
            updateProgressBar()
        }else{
            score-=1
        }
    }
    
    func handleOnFalse(){
        if questionNumber == -1{
            questionNumber+=1
            question=questions[questionNumber].question
        }
       else if(!questions[questionNumber].answer){
            score+=1
            questionNumber+=1
            question=questions[questionNumber].question
           updateProgressBar()
        }else{
            score-=1
        }
    }
    func updateProgressBar(){
        progressValue=Float(questionNumber)/Float(questions.count)
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image("Background-Bubbles")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center
                )
            VStack(alignment: .leading){
                Text("Score: \(score)").padding()
                Spacer()
                Text(question)
                    .padding().font(.largeTitle)
                Spacer()
                LargeButton(label: "True", onTap: handleOnTrue)
               LargeButton(label: "False", onTap: handleOnFalse)
                ProgressBar(value: $progressValue).frame(height:20)
                    .padding()
                    .padding(.bottom)
            }.frame(
                maxWidth:.infinity,
                maxHeight:.infinity,
                alignment: .center
            )
                
        }
        .frame(
            maxWidth:.infinity,
            maxHeight:.infinity
        )
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color("BackgroundColor"))
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
