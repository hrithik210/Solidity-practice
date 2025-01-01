// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0 ;


contract willHeritence{
    address private  owner ;
    address private  reciepient;
    uint startTime;
    uint tenYears;
    uint lastVisited;

    constructor(address _reciepient){
        owner = msg.sender;
        reciepient = _reciepient;
        startTime = block.timestamp;
        tenYears = 1 hours * 24 * 365 * 10;
        lastVisited = block.timestamp;

    }

    modifier onlyOwner(){
        require(msg.sender == owner , "lil bro is not owner");
        _;
    }

     modifier onlyRecipeient(){
        require(msg.sender == reciepient , "u aint the reciepeint");
        _;
    }

    function deposit() public payable onlyOwner{
        lastVisited = block.timestamp;
    }

    function changeReciepient(address newReciepient) public onlyOwner{
        reciepient = newReciepient;
    }

    function ping() public onlyOwner{
        lastVisited = block.timestamp;
    }

    function drain() public onlyRecipeient {
        require(lastVisited <= block.timestamp - tenYears , "10 years have not been passed");

        payable(reciepient).transfer(address(this).balance);
    }
}