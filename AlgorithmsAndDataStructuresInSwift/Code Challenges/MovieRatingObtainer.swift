import UIKit

class Movie: Equatable, Comparable, CustomStringConvertible {
    // MARK: - Public Properties
    
    var rating = 0
    var similiarMovies: [Movie] = []
    
    // MARK: - <CustomStringConvertible>
    
    var description: String {
        return "{rating: \(rating)}"
    }
    
    // MARK: - Init Method
    
    init(rating: Int, similiarMovies: [Movie] = []) {
        self.rating = rating
        self.similiarMovies = similiarMovies
    }
    
    // MARK: - <Equatable>
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.rating == rhs.rating &&
               lhs.similiarMovies == rhs.similiarMovies
    }
    
    // MARK: - <Comparable>
    
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.rating < rhs.rating
    }
}

class MovieRatingObtainer {
    // MARK: - Public Methods
    
    func obtainHighestSimiliarMovies(movie: Movie, numberOfHighestRatedMovies: Int) -> [Movie] {
        // First, we want to build an array of all the movies
        
        var allMovies: [Movie] = [movie]
        
        obtainHighestSimiliarMovies(movie: movie, finalMovieOutput: &allMovies)
        
        // Once we have an array of all the movies, let's sort them in descending order
        
        allMovies.sort { lhs, rhs in
            return rhs < lhs
        }
        
        // Now that the array is in descending order, let's only return the elements from 0 upto numberOfHighestRatedMovies (n) [0..<numberOfHighestRatedMovies]
        
        return Array(allMovies[0..<numberOfHighestRatedMovies])
    }
    
    // MARK: - Private Methods
    
    func obtainHighestSimiliarMovies(movie: Movie, finalMovieOutput: inout [Movie]) {
        // kick out when movie doesn't have any similiar movies
        
        if movie.similiarMovies == [] {
            return
        }
        
        // Iterate through all movies to add to final array, and then recursively do this
        // with all of that movies similiar movies
        
        movie.similiarMovies.forEach { movie in
            finalMovieOutput.append(movie)
            
            obtainHighestSimiliarMovies(movie: movie, finalMovieOutput: &finalMovieOutput)
        }
    }
}
