contract enumr{
    enum shirtColor {Red, White, Green, blue}
    shirtColor option;
    shirtColor constant defaultoption = shirtColor.blue;

    function setWhite() public {
        option=shirtColor.White;
    }
    function getCurrentChoice() public view returns(shirtColor){
        return option;
    }
    
    function defautopt() public pure returns(uint){
        return uint(defaultoption);
    }
}