// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// These contracts are for practicing constructors, arrays, and mappings in Solidity.

// Contracts to understand constructors 
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

// Array practice
contract learnArrays {
    uint[] public myArray1;
    uint[] public myArray2;
    uint[200] public myFixedSizedArray;

    // push() adds element to end of the array and returns the length
    function push(uint number) public {
        myArray1.push(number);
    }

    // pop() method removes the last element of an array and returns that value
    function pop() public {
        myArray1.pop();
    }

    // length() is a string property that determines the length of a string
    function getLength() public view returns(uint) {
        return myArray1.length;
    }

    // delete changes the value in an array to 0
    function remove(uint _i) public {
        delete myArray1[_i];
    }

    // Exercise to completely remove an element from an array rather than use delete and set it to 0
    uint[] public changeArray;

    // remove element removes the specified element and replaces it with the last element
    function removeElement(uint i) public {
        // set i to last element in the array
        changeArray[i] = changeArray[changeArray.length -1];
        // remove last element from array
        changeArray.pop();
    }

    // Create a function that adds the values 1, 2, 3, and 4 to the array
    function test() public {
        changeArray.push(1);
        changeArray.push(2);
        changeArray.push(3);
        changeArray.push(4);
    }

    // Or use a for loop
    function testForLoop() public {
        for(uint i=1; i <=4; i++) {
            changeArray.push(i);
        }
    }

    // Get the Values in changeArray    
    function getChangeArray() public view returns(uint[] memory) {
        return changeArray;
    }
}

// Learning enumerated variables
// Enums restrict a variable to have only one of only a few predefined values.
// This contract teaches enums by offering a small medium or large fry
contract enumsLearn {
    // instantiate enum
    enum frenchFriesSize {LARGE, MEDIUM, SMALL}

    // define choice varibes to allow for options
    frenchFriesSize choice; 

    // define default choice
    frenchFriesSize constant defaultChoice = frenchFriesSize.MEDIUM;

    // create function to allow choice of size
    function setSmall() public {
        choice = frenchFriesSize.SMALL;
    }

    // function to display size
    function getChoice() public view returns(frenchFriesSize) {
        return choice; 
    }

    // function to return default choice
    function getDefaultchoice() public pure returns (uint) {
        return uint (defaultChoice); 
    }

}

// Exercise 02 Enum practice

contract enumExercise {
    enum shirtColor {RED, WHITE, BLUE}
    shirtColor choice;
    shirtColor constant defaultChoice = shirtColor.BLUE;

    function setWhite() public {
        choice = shirtColor.WHITE;
    }

    function getChoice() public view returns (shirtColor) {
        return choice;
    }

    function getDefaultChoice() public pure returns(uint) {
        return uint(defaultChoice);
    }
}

// Learning Structures

contract learnStructs {
    // create a struct
    struct Movie {
        string title; 
        string director;
        uint movie_id;
    }
    
    // set the struct to a variable
    Movie movie;

    // create new movie with same struct
    Movie comedy;

    // Set values for the struct
    function setMovie() public {
        // set movie to a test movies
       // movie = Movie('Blade Runner', 'Ridley Scott', 1);
       // set movie to a comedy
       comedy = Movie('Zoolanders', 'Ben Stiller', 2);

    }

    // Get struct values
    function getMovieId() public view returns (uint) {
        return movie.movie_id;
    }
}

// Learning mapping
// Mapping creates a references with a key and a value to create a library to access
// No looping or iterating
// No retreiving size

contract learnMapping {
    // Create a key and value pair through mapping
    // key is address value is uint
    mapping(address => uint) public myMap;

    // set values to addresses
    function setAddress(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }

    // Get index of address
    function getAddress(address _addr) public view returns(uint) {
        return myMap[_addr];
    }

    // Remove address
    function removeAddress(address _addr) public {
        delete myMap[_addr];
    }
}

// Exercise 03: Struct Practice
// Integrate structs and maps

contract structExercies {

    // create movie map
    mapping(uint => Movie) movie;

    // create Movie struct
    struct Movie {
        string title;
        string director;
    }

    // create function to add id as key and title and director as values
    function addMovie(uint id, string memory title, string memory director) public {
        movie[id] = Movie(title, director);
    }
}

// Learning nested mapping

contract nestedMapping {

    // Create a nested map
    mapping(address => mapping(uint => Movie)) public myMovie; 

    struct Movie {
        string title;
        string director;
    }

    // create function to add id as key and title and director as values
    function addmyMovie(uint id, string memory title, string memory director) public {
        // msg.sender is a global variable which captures the address that is calling the contract
        myMovie[msg.sender][id] = Movie(title, director);
    }
}
