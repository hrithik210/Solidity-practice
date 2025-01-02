// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gojoToken{

    address public owner;
    string public name = "JohnPork";
    string public symbol = "JP";
    uint totalSupply = 0;
    mapping (address => uint) balances;


    constructor(){
        owner = msg.sender;
    }


    function mintto(uint amount , address to) private  {
        require(msg.sender == owner);
        balances[to] += amount;
        totalSupply+=amount;

    }

    function transfer(uint amount , address to) public {
        require(balances[msg.sender] >= amount, "u dont have enough balance");
        balances[msg.sender]-=amount;
        balances[to]+=amount;
    }

    function burn(uint amount) public{
        require(balances[msg.sender] >= amount , "not enough balance");
        balances[msg.sender]-=amount;
        totalSupply-=amount;
    }
}