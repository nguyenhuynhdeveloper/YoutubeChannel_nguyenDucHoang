//https://jsonplaceholder.typicode.com/photos?_start=10&_limit=5
import Foundation
enum ItemStatus: Equatable {
    case initial, success
    case failure(message:String)
}
class ItemRepository:ObservableObject {
    public static let SERVER = "jsonplaceholder.typicode.com"
    private func urlGetProducts(startIndex:Int, limit:Int) -> String {
        "https://\(ItemRepository.SERVER)/photos?_start=\(startIndex)&_limit=\(limit)"
    }
    @Published var products: [Item] = []
    @Published var isLoading = false
    @Published var hasReachedMax = false
    @Published var itemStatus:ItemStatus = .initial
    
    func getProducts(startIndex: Int = 1, limit:Int = 10) async throws {
        isLoading = true
        if hasReachedMax == true {
            isLoading = false
            return
        }
        do {
            guard let url = URL(string: urlGetProducts(startIndex: startIndex, limit: limit)) else {
                isLoading = false
                itemStatus = .failure(message: "Invalid url")
                return
            }
            let sharedSession = URLSession.shared
            if itemStatus == ItemStatus.initial {
                
            }            
            let (data, response) = try await sharedSession.data(from: url, delegate: nil)
            var responseProducts:[Item] = []
            responseProducts = try JSONDecoder().decode([Item].self, from: data)
            self.products = self.products + responseProducts
            self.isLoading = false
        }catch {
            isLoading = false
            itemStatus = .failure(message: error.localizedDescription)
        }
    }
}

