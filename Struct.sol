contract strucct {
// struct is user defined data type which allows us to combine data of different data types
    struct Movie{
    uint movie_id;
    string directorName;
    string movieTitle;
    }

    Movie movie;
    function setmovie() public{
        movie= Movie(4, 'Richard', 'Hobert');
    }

    function getmovie() public view returns(uint , string memory, string memory){
        return (movie.movie_id , movie.directorName , movie.movieTitle);

    }


}