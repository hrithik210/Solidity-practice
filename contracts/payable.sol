// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0 ;

contract Payable {

    address owner;
    uint totalAmount;

    constructor(address _owner) {
        owner = _owner;
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    function deposit() public payable{
        totalAmount+=msg.value;
    }


    function drain() public onlyOwner {
        payable(owner).transfer(totalAmount);
        totalAmount = 0 ;
    }
}