// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0 ;

contract Vehicle {
    string brand;
    string wheels ;
    constructor(string memory _brand , string memory _wheels){
        brand = _brand ;
        wheels = _wheels;
    }


    function description()  public  virtual returns(string memory){
        return string(abi.encodePacked(
            "this is a ",
            wheels,
            "-wheeler of brand-",
            brand)
            ) ;
    }
}