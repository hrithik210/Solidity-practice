// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract skibbidyRizzler{

    address public helloKittyGirl; //owner
    uint public gyattCounter;
    mapping (address => Rizzler) public rizzlers;
    address[] npcList;

    struct Rizzler{
        uint gyatLevel ;
        string status ;
        bool sigmaApproved ;
    }

    //events
    event BigW(address indexed , uint gyat);
    event BigL(address indexed , string reason);
    event GyatLevelUp(address indexed rizzler , string message);

    
    constructor(){
        helloKittyGirl = msg.sender;
        gyattCounter = 69;
    }

    modifier pickMeGirl(){
        require(msg.sender == helloKittyGirl , "u aint her lil bro");
        _;
    }
    modifier npcCheck(address _npc) {
        require(rizzlers[_npc].sigmaApproved == false, "This NPC isn't sigma-approved!");
        _;
    }

    function skibbidy(uint _gyat) public pickMeGirl {
        require(_gyat > 0 , "need bigger gyatt");
        rizzlers[msg.sender].gyatLevel+=_gyat;
        rizzlers[msg.sender].status  = "Certified Sigma";
        rizzlers[msg.sender].sigmaApproved = true;
        gyattCounter+=_gyat;
        emit BigW(msg.sender, gyattCounter);

    }

    function deRizz(address _npc) public {
        delete rizzlers[_npc];
        npcList.push(_npc);
        emit BigL(_npc, "this dude has no game");
    }

    function getGyat() public view returns (uint gyatlevel , string memory status) {
        Rizzler memory rizzler = rizzlers[msg.sender];
        return (rizzler.gyatLevel , rizzler.status);
    }

    function BoostGyaat(uint multiplier) public{
        require(rizzlers[msg.sender].gyatLevel> 0 , "no gyat to boost");
        rizzlers[msg.sender].gyatLevel*= multiplier;
        emit GyatLevelUp(msg.sender, "gyat boosted");
    }

    function transferBigRizz(address finalBoss) public pickMeGirl{
        helloKittyGirl = finalBoss ;
    }

    function pureSigmaCalculator(uint a  , uint b) public pure returns (uint){
        return a+ b;
    }
}