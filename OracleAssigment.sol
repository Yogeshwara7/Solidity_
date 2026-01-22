// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Oracle {

    address admin;
    uint public  rand;

    constructor(){
        admin=msg.sender;
    }

    function setadmin(uint _rand)  external {
        require(msg.sender==admin);
        rand=_rand;
    }
}

contract generateRandomNumber{
   Oracle oracle;
    constructor(address Oracleaddress){
        oracle=Oracle(Oracleaddress);
    }
    function randd(uint range) view external returns(uint){
        return uint(keccak256(abi.encodePacked(oracle.rand,block.timestamp, block.prevrandao, msg.sender, block.number)))%range;
    }
}