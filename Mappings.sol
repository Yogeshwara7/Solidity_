contract understandingmapping{
// mapping is key value pair data structure in which we can store data in form of key and value
    mapping(address=>uint) public map;
// here address is key and uint is value
    function settter(address _addr , uint _num)public{
        map[_addr]=_num;
    }
// setter function to set the value in mapping
    function getter(address _addr)public view returns(uint){
        return map[_addr];
    }
}
