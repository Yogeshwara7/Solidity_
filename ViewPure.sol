// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//View does not allows the state to change(returns value)
//Pure ensures tht they dont read or modify the state(returns calculations)

contract viewpure{

    uint price;

    function setvalue(uint _value) public {
        price= _value;
    }

    function getvalue() view public returns(uint){
        return price;
    }

    function sett() pure public returns(uint){
        return 3+3;
    }
}