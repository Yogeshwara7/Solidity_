// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C{
    uint internal data;
    uint public info;
    constructor(){
        info=10;
    }

    function increment(uint a) view internal returns(uint) {
        return (a+1);
    }

    function dupdata(uint a) public {
       data=a;
    }


    function getData() view public returns(uint){
       return data;
    } 

    function compute(uint a, uint b) pure internal returns(uint){
        uint c=a+b;
        return(c);
    }
}

contract D{
    C public c;

    function inst() public {
    c = new C();
    }

    function readInfo() view public returns(uint){
       return c.info();

    }

}

contract E is C{
    uint private result;
    C private c;
    
    constructor(){
        c=new C();
    }

    function getComputedResult() public {
        result=compute(25, 5);

    }

    function getresult() view public returns(uint){
        return result;
    }

    function rea() view public returns(uint){
        return c.info();

    }


}