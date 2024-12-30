// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mapping{

    mapping (address => uint) UserBalance;

    function deposit(uint amount) public {
        require(amount > 0 , "amount cant be zero lil bro");
        UserBalance[msg.sender] += amount;
    }

    function getBalance() public view returns (uint){
        return UserBalance[msg.sender];
    }

}