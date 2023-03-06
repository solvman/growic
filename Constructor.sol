//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 <0.9.0;

contract A {
    
    // contract A should have a variable called owner and it should be immutable
    address public immutable owner;
    
    // contract A should accept a parameter in its constructor called uint _fee 
    // and should be assigned to a variable called FEE
    uint256 public FEE;

    constructor(uint256 _fee) {
        //Set the owner as the person deploying the contract in the constructor
        owner = msg.sender; 
        FEE = _fee;
    }
}

contract B is A {
   
   // contract B should inherit contract A and pass in the required constructor 
   // parameters that A requires
    constructor() A(20) {
    }

    
    // Optional: Create a function that returns each variable that was set in 
    // contract A from contract B
    function getFee() public view returns (uint256) {
        return FEE;
    }

    function getOwner() public view returns (address) {
        return owner; 
    }
}
