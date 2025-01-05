// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Erc20TokenContract{

    address public owner;
    string public name = "JohnPork";
    string public symbol = "JP";
    uint totalSupply = 0;
    mapping (address => uint) balances;
    mapping(address => mapping(address => uint)) allowance;
    event Approval(address indexed _owner , address indexed _spender , uint _value);
    event Transfer(address indexed _from , address indexed _to , uint _value);

    constructor(){
        owner = msg.sender;
    }

    function approve(address _spender , uint _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender,_spender, _value);
        return success;
    }

    function transferFrom(address _from , address _to , uint _value) public returns (bool success){
        uint userAllowance = allowance[_from][msg.sender];
        require(userAllowance >= _value ,"u aint allowed this much");
        require(balances[_from] >= _value , "that guy is broke af");
        allowance[_from][msg.sender]-=_value;
        balances[_from]-= _value;
        balances[_to]+= _value;
        emit Transfer(_from, _to, _value);
        return success;
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