//Cross-contract invocation

// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0 ;

    interface ICCI {
        function add(uint _nums) external returns (uint);
        function getValue() external  view returns (uint);

    }
contract CCI {
    address contractAddress;
    constructor(address _contractAdress) {
      contractAddress = _contractAdress;  
    }  



    function addProxy(uint value) public {
        ICCI(contractAddress).add(value);
    } 

    function getValueProxy() public view returns (uint){
        uint value = ICCI(contractAddress).getValue();
        return value;
    }
}