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
    static let shared = ItemRepository()
    @Published var items: [Item] = []
    @Published var isLoading = false
    @Published var hasReachedMax = false
    @Published var itemStatus:ItemStatus = .initial
    
    func getProducts(startIndex: Int = 1, limit:Int = 10) async {
        isLoading = true
        if hasReachedMax == true {
            isLoading = false
            return
        }
        do {
            if itemStatus == ItemStatus.initial {
                let responseProducts = await self.fetchItems(startIndex: startIndex, limit: limit)
                self.items = self.items + responseProducts
                self.isLoading = false
                self.itemStatus = .success
            }
            let responseProducts = await self.fetchItems(startIndex: items.count, limit: limit)
            if responseProducts.isEmpty {
                self.hasReachedMax = true
            } else {
                self.items = self.items + responseProducts
                self.itemStatus = .success
                self.hasReachedMax = false
            }
            self.isLoading = false
        }catch {
            isLoading = false
            itemStatus = .failure(message: error.localizedDescription)
        }
    }
    private func fetchItems(startIndex:Int, limit:Int) async -> [Item]{
        do {
            guard let url = URL(string: urlGetProducts(startIndex: startIndex, limit: limit)) else {
                isLoading = false
                itemStatus = .failure(message: "Invalid url")
                return []
            }
            let sharedSession = URLSession.shared
            let (data, response) = try await sharedSession.data(from: url, delegate: nil)
            return try JSONDecoder().decode([Item].self, from: data)
            
        }catch {
            return []
        }
    }
}

