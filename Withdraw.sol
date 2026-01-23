// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Funding{

        mapping (address => uint) public balance;

        function deposit() external  payable {
            require(msg.value>0 ,"Dont donate 0 or less than that");
            balance[msg.sender]+=msg.value;
        }

        function withdrawl(uint amount) external returns(bool success){
            uint userbalance=balance[msg.sender];

            require(userbalance>=amount, "Insufficient funds");
            balance[msg.sender]= userbalance-amount;
            payable(msg.sender).transfer(amount);
            return true;
        } 

}