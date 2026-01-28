// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assigment{
    mapping(address=>uint) balance;

    address public owner;
    constructor(){
    owner=msg.sender;
    }
    modifier costs(uint _amount){
        require(msg.value>=_amount, "Not Enough Ether");
        _;
    }

    function forceOwnerChange(address _newOwner)external payable costs(99 ether){
        owner = _newOwner;
    }
    function sendeth(address _owner, uint amount) external payable {
        payable(_owner).transfer(amount);
    }
    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }
}