// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0 ;

import "./Vehicle.sol";

contract Car is Vehicle{
    constructor(string memory _brand , string memory _wheels) Vehicle(_brand , _wheels){
        wheels = _wheels ;
        brand = _brand ;
    
    }

    function description() public view override returns (string memory){
          return string(abi.encodePacked(
            "this is a ",
            wheels,
            "-wheeler of brand-",
            brand)
            ) ;
    }
}