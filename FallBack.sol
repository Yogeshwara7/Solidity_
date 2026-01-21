// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Fallback function is executed when no other function matches or no data is supplied
//It is a special function that does not take any arguments and does not return anything
//It must be declared as external
//It can be declared as payable to accept ether
//It is often used to log ether sent to the contract or to implement proxy contracts
contract fallbackfun {
    
    // Define an event to log gas left when fallback is called
    event log(uint gas);
    // Fallback function
    fallback() external payable {
        emit log(gasleft());
     }
    // Function to get the contract's balance
    function getbal() view external returns(uint)  {
        return address(this).balance;
    }
}

// A contract to send ether to another contract
contract sendethh{

    // Function to send ether using transfer
    // transfer is a simple and safe way to send ether
    // It forwards a fixed amount of gas (2300 gas)
    function sendeth(address payable _to) public payable {
        _to.transfer(msg.value);
    }
    // Function to send ether using call
    // call is the recommended method to send ether
    // It is more flexible and forwards all available gas
    function callfallback(address payable _to) public payable {
        (bool sent,)=_to.call{value:msg.value}('');
        require(sent, 'Failed to send');
    }
}