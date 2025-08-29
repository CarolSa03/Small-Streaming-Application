//
//  SearchViewModel.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

final class SearchViewModel {
    private let searchUseCase: SearchContentUseCase
    let results = Box<[ContentCellViewModel]>([])
    let isLoading = Box<Bool>(false)
    let error = Box<String?>(nil)

    init(searchUseCase: SearchContentUseCase) {
        self.searchUseCase = searchUseCase
    }

    @MainActor
    func search(query: String) async {
        guard !query.isEmpty else {
            results.value = []
            return
        }
        isLoading.value = true
        do {
            let found = try await searchUseCase.execute(query: query)
            results.value = found.map { ContentCellViewModel(contentType: $0) }
            isLoading.value = false
        } catch {
            self.error.value = error.localizedDescription
            isLoading.value = false
        }
    }
}
