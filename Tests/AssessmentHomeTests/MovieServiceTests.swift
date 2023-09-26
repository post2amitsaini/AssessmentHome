//
//  MovieServiceTests.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import XCTest
@testable import AssessmentHome

final class MovieServiceTests: XCTestCase {
    var sut: MovieService!
    var networkManagerMock: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManagerMock = MockNetworkManager()
        sut = MovieService(networkManager: networkManagerMock)
    }
    
    override func tearDown() {
        sut = nil
        networkManagerMock = nil
        super.tearDown()
    }
    
    func testFetchMoviesFromNetwork() async {
        // Prepare test data
        let testMovieDataList: [MovieData] = [
            MovieData(title: "Movie 1", overview: "Description 1", poster_path: "Image1", release_date: "2022-01-01"),
            MovieData(title: "Movie 2", overview: "Description 2", poster_path: "Image2", release_date: "2022-02-01")
        ]
        networkManagerMock.movieApiResponse = MovieApiResponse(results: testMovieDataList)
        
        // Execute service method
        do {
            let fetchedMovieDataList = try await sut.fetchMoviesFromNetwork()
            XCTAssertEqual(fetchedMovieDataList.count, testMovieDataList.count, "Fetched movie data count should be equal to test data count.")
            
            for (index, fetchedMovieData) in fetchedMovieDataList.enumerated() {
                XCTAssertEqual(fetchedMovieData.title, testMovieDataList[index].title, "Fetched movie data title should be equal to test data title.")
                XCTAssertEqual(fetchedMovieData.overview, testMovieDataList[index].overview, "Fetched movie data description should be equal to test data description.")
                XCTAssertEqual(fetchedMovieData.poster_path, testMovieDataList[index].poster_path, "Fetched movie data imageName should be equal to test data imageName.")
                XCTAssertEqual(fetchedMovieData.release_date, testMovieDataList[index].release_date, "Fetched movie data releaseDate should be equal to test data releaseDate.")
            }
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    
}
