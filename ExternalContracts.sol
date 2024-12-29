
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0 ;

import "@openzeppelin/contracts/access/Ownable.sol" ;

contract ExternalContracts is Ownable{

    uint num;

    constructor() Ownable(msg.sender) {

    }


    function add(uint _nums) public onlyOwner returns (uint){
        return num+= _nums;
    }
}
