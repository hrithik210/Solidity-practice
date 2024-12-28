// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0 ;

contract PracticeModifiers{

    address owner ;
    uint num ;
    constructor(uint _nums){
        owner = msg.sender ;
        num = _nums;
    
    }
    modifier isOwner{
        require(owner == msg.sender, "u ain the owner lil bro");
        _;
    }


    function add(uint _nums) public isOwner returns (uint)  {
        return num += _nums ;
    }

    function getValue() public view returns (uint) {
        return num ;
    }
}