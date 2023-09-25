//
//  MovieListViewModelTests.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import XCTest
@testable import AssessmentHome

final class MovieListViewModelTests: XCTestCase {
    var viewModel: MovieListViewModel!
    var mockFetchMoviesUseCase: MockFetchMoviesUseCase!
    
    override func setUp() {
        super.setUp()
        mockFetchMoviesUseCase = MockFetchMoviesUseCase()
        viewModel = MovieListViewModel(fetchMoviesUseCase: mockFetchMoviesUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockFetchMoviesUseCase = nil
        super.tearDown()
    }
    
    func testFetchMoviesSuccess() async {
        let movie1 = Movie(title: "Movie Title 1", genre: "Action", description: "Description", imageName: "/abc.jpg", releaseDate: "25sept 2023")
        let movie2 = Movie(title: "Movie Title 2", genre: "Drama", description: "Description", imageName: "/xyz.jpg", releaseDate: "2March 2023")
        mockFetchMoviesUseCase.result = .success([movie1, movie2])
        
        await viewModel.fetchMovies()
        // Add a 5-second wait before checking the result
            await Task.sleep(5 * 1_000_000_000)
        
        XCTAssertEqual(viewModel.movies.count, 2)
    }
    
    func testFetchMoviesFailure() async {
        mockFetchMoviesUseCase.result = .failure(MockFetchMoviesUseCaseError.fetchMoviesError)
        
        await viewModel.fetchMovies()
        
        XCTAssertTrue(viewModel.movies.isEmpty)
    }
    
}
