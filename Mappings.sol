contract understandingmapping{

    mapping(address=>uint) public map;

    function settter(address _addr , uint _num)public{
        map[_addr]=_num;
    }
    function getter(address _addr)public view returns(uint){
        return map[_addr];
    }
}
