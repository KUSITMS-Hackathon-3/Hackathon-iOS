//
//  CalendarView.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/30.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("<")
                    Text("2023년 3월")
                    Text(">")
                }
                HStack(spacing: 30) {
                    Text("화")
                    Text("수")
                    Text("목")
                    Text("금")
                    Text("토")
                    Text("일")
                    Text("월")
                }
                .frame(maxWidth: .infinity)
            }
            .font(.system(size: 24, weight: .semibold))
            .navigationBarTitle(Text("Calender"), displayMode: .inline)
        }
    }
}
    

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
