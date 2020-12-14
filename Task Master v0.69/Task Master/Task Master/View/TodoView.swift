

import SwiftUI

struct TodoView: View {
    
    
    @EnvironmentObject var todo: Todo

    var body: some View {
        NavigationView {
            ZStack {
                ListView()
                    .navigationBarTitle("Task Master")
                
                NewItemButton()

            }
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView().environmentObject(Todo())
    }
}
