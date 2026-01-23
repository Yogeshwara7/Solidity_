// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract RestricitngAccess{

    address public owner= msg.sender;
    uint public creationtime=block.timestamp;

    modifier onlyBy(address inputowner){
        require(msg.sender==inputowner, "Unauthorized Access");
        _;
    }

    modifier onlyAfter(uint blocka){
        require(creationtime > blocka, "Wait atleast 3 weeks" );
        _;

    }


    function changeowner(address _account) external onlyBy(owner){
        owner=_account;
    } 

    function disown() onlyAfter(creationtime + 3 weeks)external{
        delete owner;
    }


}