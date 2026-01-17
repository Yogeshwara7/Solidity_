// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Owner{
    address owner;

    constructor() {
        owner=msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender==owner);
        _;
    }

    modifier cost(uint price) {
        require(msg.value>=price);
        _;
    }
}

contract modifi is Owner{

    mapping(address=>bool) registeredAddress;
    uint price;

    constructor(uint initalprice) {
        price = initalprice;
    }

     function register() public payable cost(price){
        registeredAddress[msg.sender] = true;
     }

     function changePrice(uint _price) public onlyOwner{
        price=_price;
     }
}