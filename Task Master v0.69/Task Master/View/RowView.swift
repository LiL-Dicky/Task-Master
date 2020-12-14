

import SwiftUI

struct RowView: View {
    
    @EnvironmentObject var todo: Todo
    @Environment(\.colorScheme) var colorScheme
    

    @State var sheetIsPresented = false

    @State var readyToBeDeleted = false

    @State var alertIsPresented = false

    @State var deleting = false

    @State var viewState = CGSize.zero

    @State var completedLongPress = false

    @GestureState var isDetectingLongGesture = false
    
    func hapticSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func hapticWarning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    var valueToBeDeleted: CGFloat = -75
    
    var itemId: UUID
    
    var item: TodoItem? {
        return todo.getItemById(itemId: itemId)
    }
    

    var body: some View {
        HStack {
            Image(systemName: item?.isDone ?? false ? "circle.fill" : "circle")
                .font(.system(size: 10, weight: .black))
                .padding(.trailing, 10)
                .foregroundColor(Color(item?.colorName ?? "purple"))

            Text(item?.title ?? "Sample task")
                .foregroundColor(.primary)
            Spacer()
        }
            
        .padding(20)
        .background(self.readyToBeDeleted ? Color(.systemRed) : (colorScheme == .light ? Color(item?.colorName ?? "purple").opacity(0.2) : Color(.systemGray6)))
        .cornerRadius(20)
        
        // UI responces
        .offset(x: self.viewState.width < 0 ? self.viewState.width : 0)
        .scaleEffect(
            (self.isDetectingLongGesture || self.viewState.width < 0) ? 0.95 : (self.deleting ? 0 : 1))
            
        .animation(.default)
            
        .gesture(
            LongPressGesture(minimumDuration: 0.5)
                .updating($isDetectingLongGesture) { currentstate, gestureState, transaction in
                    gestureState = currentstate
                }
                .onEnded { finished in
                    self.sheetIsPresented = true
                    self.hapticSuccess()
                }
        )
        
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.viewState = value.translation
                    self.readyToBeDeleted = self.viewState.width < self.valueToBeDeleted ? true : false
                }
                .onEnded { _ in
                    if self.viewState.width < self.valueToBeDeleted {
                        self.alertIsPresented = true
                        self.hapticWarning()
                    }
                    self.viewState = .zero
                    self.readyToBeDeleted = false
                }
        )
            
        .gesture(
            LongPressGesture(minimumDuration: 0)
                .onEnded {_ in
                    self.todo.toggleItem(itemId: self.itemId)
                    self.hapticSuccess()
        })
            
        .alert(isPresented: self.$alertIsPresented) {
            Alert(
                title: Text("Delete task"),
                message: Text("This action cannot be undone"),
                primaryButton: .destructive(Text("Yes"), action: {
                    self.deleting = true
                    self.todo.deleteItem(itemId: self.itemId)
                }),
                secondaryButton: .cancel())
        }
        
        .sheet(isPresented: self.$sheetIsPresented, onDismiss: {self.sheetIsPresented = false }) {
            EditItemView(todo: self.todo, todoItem: self.item ?? TodoItem(title: "Error"))
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(itemId: UUID()).environmentObject(Todo())
    }
}
