// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator{
    uint nums ;

    constructor(uint _nums){
        nums = _nums;
    }

    function add(uint _nums) public returns (uint) {
       return nums+=_nums ;
    }

    function getValue() public view returns (uint) {
        return nums;
    }
    
}