//
//  FetchMoviesUseCaseTests.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import XCTest
@testable import AssessmentHome

final class FetchMoviesUseCaseTests: XCTestCase {
    var sut: FetchMoviesUseCase!
    var movieRepositoryMock: MockMovieRepository!
    
    override func setUp() {
        super.setUp()
        movieRepositoryMock = MockMovieRepository()
        sut = FetchMoviesUseCase(movieRepository: movieRepositoryMock)
    }
    
    override func tearDown() {
        sut = nil
        movieRepositoryMock = nil
        super.tearDown()
    }
    
    func testExecute_fetchMovies() async {
        // Prepare test data
        let testMovies: [Movie] = [
            Movie(title: "Movie 1", genre: "Action", description: "Description 1", imageName: "Image1", releaseDate: "2022-01-01"),
            Movie(title: "Movie 2", genre: "Comedy", description: "Description 2", imageName: "Image2", releaseDate: "2022-02-01")
        ]
        movieRepositoryMock.movies = testMovies
        
        // Execute use case
        do {
            let fetchedMovies = try await sut.execute()
            XCTAssertEqual(fetchedMovies.count, testMovies.count, "Fetched movies count should be equal to test data count.")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
