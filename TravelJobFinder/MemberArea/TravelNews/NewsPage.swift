
import SwiftUI

struct NewsPage: View{
    var body: some View{
        NavigationView{
            GeometryReader { dimensions in
                List {
                    ForEach(0..<8) { _ in
                        AsyncImage(url: URL(string: "https://picsum.photos/600")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 240)
                        } placeholder: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray.opacity(0.6))
                                    .frame(height: 240)
                                ProgressView()
                            }
                        }
                        .aspectRatio(3 / 2, contentMode: .fill)
                        .cornerRadius(12)
                        .padding(.vertical)
                        .shadow(radius: 4)
                    }
                    .listStyle(.inset)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                }
                
            }
        }
    }
}

struct NewsPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsPage()
    }
}
