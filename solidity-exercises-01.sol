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

// Contract inheriting from member contract with hardcoded variables
contract Teacher is Member {

    // constructor for teacher that sets the name and age
    constructor() Member('Rachel', 28) {}

    // function to return the name intantiated in the constructor
    function getName() public view returns(string memory) {
        return name;
    }
}

// Contract inheriting from member contract with variable inputs
contract teacherVariable is Member {

    // constructor for teacher that sets the name and age
    constructor(string memory inputName, uint inputAge) Member(inputName, inputAge) {}

    // function to return the name intantiated in the constructor
    function getName() public view returns(string memory) {
        return name;
    }
}

// Constructor exercise 01:
// Contract that stores fully accessible (inside and outside) integer data upon deployment

contract Base {
    uint numberOne;

    constructor (uint _one) {
     numberOne = _one;
    }
}

// Contract that derives data from the above the Base contract that runs a function and outputs the data to 5

contract Derived is Base (5) {

    function get5() public view returns(uint) {
        return numberOne; 
    }
}