// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StatusContract {

    enum Status { 
        isPending,
        active,
        completed 
     }

    address private owner;
    Status private status;

    event StatusChanged(Status newStatus);

    constructor(){
        owner = msg.sender;
        status = Status.isPending;
    }
    modifier onlyOwner(){
        require(msg.sender == owner , "not the owner");
        _;
    }

    function activate() external onlyOwner {
        require(status == Status.isPending , "Its already active");
        status = Status.active;
        emit StatusChanged(status);
    }

    function complete() external onlyOwner {
        require(status == Status.active , "it should be active");
        status = Status.completed;
        emit StatusChanged(status);
    }

    function fundContract() external payable {
        require(msg.value>0 ,"amount should be greater than zero");
    }

    function _getStatus() internal view returns (Status) {
        return status;
    }

    function isComplete() external view returns (bool) {
        return status == Status.completed;
    }
}