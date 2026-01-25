// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract auction{
    address payable  beneficiary;
    address public highestbidder;
    uint public end;
    uint public highestbid;
    bool ended;

    mapping (address=> uint) returnaddress;
    event bidchange(
       uint amount,
       address highestbidder
    );

    event AuctionEnd(
        address winner,
        uint amount
    );

    constructor(uint biddingtime, address payable _beneficiary){
        beneficiary= _beneficiary;
        end=block.timestamp+biddingtime;
    }

    function bid() public payable {
        if(block.timestamp<end) revert('Auction has ended');
        if(msg.value>highestbid) revert('Amount to be higher than previous bid');

        if(highestbid!=0){
            returnaddress[highestbidder] +=highestbid;
        }
        highestbid=msg.value;
        highestbidder=msg.sender;
        emit bidchange(msg.value, msg.sender);
    }

    function withdraw() public payable returns(bool) {
        uint amount= returnaddress[msg.sender];
        if(amount==0){
            returnaddress[msg.sender]=0;
        }
        if(!payable (msg.sender).send(amount)){
            returnaddress[msg.sender]=amount;
        }
        return true;   
    }

    function endd() public {
        ended = true;
        emit AuctionEnd(highestbidder, highestbid);
        beneficiary.transfer(highestbid);

    }
}