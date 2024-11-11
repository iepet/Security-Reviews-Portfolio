
// SPDX-License-Identifier: MIT
//This contract will just decode the data into the key

pragma solidity ^0.8.0;

contract PrivacyKeyExtractor {
    
    // This function takes a bytes32 input and returns the first 16 bytes as a bytes16 key
    function getKey(bytes32 data) public pure returns (bytes16) {
        // Convert and return the first 16 bytes of the input data as bytes16
        return bytes16(data);
    }
}
