//
//  MovieRepositoryTests.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import XCTest
@testable import AssessmentHome

final class MovieRepositoryTests: XCTestCase {
    var sut: MovieRepository!
    var movieServiceMock: MockMovieService!
    
    override func setUp() {
        super.setUp()
        movieServiceMock = MockMovieService()
        sut = MovieRepository(service: movieServiceMock)
    }
    
    override func tearDown() {
        sut = nil
        movieServiceMock = nil
        super.tearDown()
    }
    
    func testFetchMovies() async {
        // Prepare test data
        let testMovieDataList: [MovieData] = [
            MovieData(title: "Movie 1", overview: "Description 1", poster_path: "Image1", release_date: "2022-01-01"),
            MovieData(title: "Movie 2", overview: "Description 2", poster_path: "Image2", release_date: "2022-02-01")
        ]
        movieServiceMock.movieDataList = testMovieDataList
        
        // Execute repository method
        do {
            let fetchedMovies = try await sut.fetchMovies()
            XCTAssertEqual(fetchedMovies.count, testMovieDataList.count, "Fetched movies count should be equal to test data count.")
            
            for (index, fetchedMovie) in fetchedMovies.enumerated() {
                XCTAssertEqual(fetchedMovie.title, testMovieDataList[index].title, "Fetched movie title should be equal to test data title.")
                XCTAssertEqual(fetchedMovie.description, testMovieDataList[index].overview, "Fetched movie description should be equal to test data description.")
                XCTAssertEqual(fetchedMovie.imageName, testMovieDataList[index].poster_path, "Fetched movie imageName should be equal to test data imageName.")
                XCTAssertEqual(fetchedMovie.releaseDate, testMovieDataList[index].release_date, "Fetched movie releaseDate should be equal to test data releaseDate.")
            }
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
