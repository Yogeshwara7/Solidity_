contract assignment{
    struct Movie{
        string name;
        string director;
    }
    mapping(uint=> Movie) public mapp;
    function addmovie(uint movie_id, string memory title, string memory directorname) public {
        mapp[movie_id]= Movie(title, directorname);

    }

    function getmovie(uint movie_id) public view returns(string memory, string memory){
        Movie storage m = mapp[movie_id];
        return (m.name, m.director);
    }
}