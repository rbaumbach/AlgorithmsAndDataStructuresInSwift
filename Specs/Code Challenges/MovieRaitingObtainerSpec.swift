import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

// Problem: Write a method that takes a "Movie" object and integer value n
//          The method should return an array of the highest ranking movies no larger than n.
//          Move object
//          class Movie {
//              rating: Int
//              similiar: [Movie]
//          ex: input movie (see below), n = 2
//          Movie(rating: 5, similiar: [Movie(rating: 6, similar:[Movie(rating: 7, similiar: []])])]
//              -> [Movie(rating: 7, similar: []]), Movie(raiting: 6, similar:[Movie(rating: 7, similiar: []])])]

class MovieRatingObtainerSpec: QuickSpec {
    override func spec() {
        var subject: MovieRatingObtainer!
        
        beforeEach {
            subject = MovieRatingObtainer()
        }
        
        describe("#obtainHighestSimilarMovies(movie:numberOfHighestRatedMovies:)") {
            var inputMovie: Movie!
            var highestSimilarMovies: [Movie]!
            
            beforeEach {
                inputMovie = Movie(rating: 5, similiarMovies: [Movie(rating: 6, similiarMovies: [Movie(rating: 7)])])
                
                highestSimilarMovies = subject.obtainHighestSimiliarMovies(movie: inputMovie, numberOfHighestRatedMovies: 2)
            }
            
            it("returns the correct [Movie] array") {
                let expectedHighestSimilarMoviesArray = [Movie(rating: 7),
                                                         Movie(rating: 6, similiarMovies: [Movie(rating: 7)])]
                
                expect(highestSimilarMovies).to(equal(expectedHighestSimilarMoviesArray))
            }
        }
    }
}
