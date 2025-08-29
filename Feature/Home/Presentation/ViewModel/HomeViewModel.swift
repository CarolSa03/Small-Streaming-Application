//
//  HomeViewModel.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import Foundation

final class HomeViewModel {
    private let getFeaturedContentUseCase: GetFeaturedContentUseCase
    private let getMoviesUseCase: GetMoviesUseCase
    private let getShowsUseCase: GetShowsUseCase
    private let repository: ContentRepository
    
    let sections = Box<[ContentSection]>([])
    let isLoading = Box<Bool>(false)
    let error = Box<String?>(nil)
    
    init(getFeaturedContentUseCase: GetFeaturedContentUseCase, getMoviesUseCase: GetMoviesUseCase, getShowsUseCase: GetShowsUseCase, repository: ContentRepository) {
        self.getFeaturedContentUseCase = getFeaturedContentUseCase
        self.getMoviesUseCase = getMoviesUseCase
        self.getShowsUseCase = getShowsUseCase
        self.repository = repository
    }
    
    @MainActor
    func loadContent() async {
        isLoading.value = true
        error.value = nil
        
        do {
            async let featured = getFeaturedContentUseCase.execute()
            async let movies = getMoviesUseCase.execute()
            async let shows = getShowsUseCase.execute()
            
            let featuredContent = try await featured
            let moviesContent = try await movies
            let showsContent = try await shows
            
            let contentSections = [
                ContentSection(title: "Featured", type: .featured, items: featuredContent),
                ContentSection(title: "Movies", type: .movies, items: moviesContent.map({ .movie($0) })),
                ContentSection(title: "Shows", type: .shows, items: showsContent.map({ .show($0) })),
            ]
            sections.value = contentSections
            isLoading.value = false
        } catch {
            self.error.value = error.localizedDescription
            isLoading.value = false
        }
    }
}
