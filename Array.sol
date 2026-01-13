contract arr {

    uint[] public changeArray;
// dynamic array
    function removee(uint i) public{
        changeArray[i]=changeArray[changeArray.length-1];
        changeArray.pop();
    }
    function test() public {
        for (uint i=0; i<=5; i++) 
        {
            changeArray.push(i);
        }
    }
// function to get length of array
    function len() view public returns(uint) {
       return  changeArray.length;
    }

    function showarr() view public returns(uint [] memory){
               return changeArray;
    }
    
}