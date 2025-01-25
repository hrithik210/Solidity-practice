// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Erc20TokenContract{

    address public owner;
    string public name ;
    string public symbol;
    uint Supply = 0;
    mapping (address => uint) balances;
    mapping(address => mapping(address => uint)) allowances;
    event Approval(address indexed _owner , address indexed _spender , uint _value);
    event Transfer(address indexed _from , address indexed _to , uint _value);
    uint public decimals = 6;

    constructor(string memory _name , string memory _symbol){
        owner = msg.sender;
        name = _name;
        symbol = _symbol;

    }

    function approve(address _spender , uint _value) public returns (bool success){
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender , _spender, _value);
        return success;
    }

    function balanceof(address account) public view returns (uint){
        return balances[account];
    }

    function allowance(address _owner , address _spender) public view returns (uint){
        return allowances[_owner][_spender];
    }

    function totalSupply() public view returns (uint){
        return Supply;
    }

    function transferFrom(address _from , address _to , uint _value) public returns (bool success){
        uint userAllowance = allowances[_from][msg.sender];
        require(userAllowance >= _value ,"u aint allowed this much");
        require(balances[_from] >= _value , "that guy is broke af");
        allowances[_from][msg.sender]-=_value;
        balances[_from]-= _value;
        balances[_to]+= _value;
        emit Transfer(_from, _to, _value);
        return success;
    }


    function mintto(uint amount , address to) private  {
        require(msg.sender == owner);
        balances[to] += amount;
        Supply+=amount;

    }

    function transfer(uint amount , address to) public returns(bool success) {
        require(balances[msg.sender] >= amount, "u dont have enough balance");
        balances[msg.sender]-=amount;
        balances[to]+=amount;
        emit Transfer(msg.sender, to, amount);
        return success;
    }

    function burn(uint amount) public{
        require(balances[msg.sender] >= amount , "not enough balance");
        balances[msg.sender]-=amount;
        Supply-=amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}