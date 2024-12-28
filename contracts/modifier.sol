// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0 ;

contract PracticeModifiers{

    uint owner ;
    uint num ;
    constructor(uint _nums){
        owner = msg.sender ;
        nums = _nums;
    
    }
    modifier isOwner{
        require(owner == msg.sender);
        _;
    }


    function add() public returns (uint) isOwner {

    }
}