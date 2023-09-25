//
//  MovieDetailViewModelTests.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import XCTest
@testable import AssessmentHome
@testable import AssessmentCore

final class MovieDetailViewModelTests: XCTestCase {
    var viewModel: MovieDetailViewModel!
    
    override func setUp() {
        super.setUp()
        let testMovie =  Movie(title: "The Shawshank Redemption",
                               genre: "Drama",
                               description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
                               imageName: "shawshank_redemption.jpg",
                               releaseDate: "1994")
        viewModel = MovieDetailViewModel(movie: testMovie)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testMovieDetailViewModelInitialization() {
        XCTAssertEqual(viewModel.movie.title, "The Shawshank Redemption")
        XCTAssertEqual(viewModel.movie.imageName, "shawshank_redemption.jpg")
    }
    
    func testPosterImageURL() {
        let expectedURL = URL(string: Configuration.imageBaseUrl + "shawshank_redemption.jpg")
        XCTAssertEqual(viewModel.posterImageURL(), expectedURL)
    }
}
