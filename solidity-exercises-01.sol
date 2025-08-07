// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This contract is practicing arrays, mappings, and structures in Solidity.

contract Member {
    // Initialize name and age upon depolyment
    string name;
    uint age;

    constructor (string memory _name, uint _age) {
        name = _name;
        age = _age;
    }
}