//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 <0.9.0;

error AmountToSmall();

contract Modifier {
 
    // STATE VARIABLES

    address public contractOwner;
    mapping (address => uint256) public balance;
    uint256 public fee;

    constructor (uint256 _minimumFee) {
        contractOwner = msg.sender;
        fee = _minimumFee; 
    }

    // FUNCTIONS

    function deposit() public payable onlyWithZeroBalance {
        balance[msg.sender] = msg.value;
    }
    
    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function addFund() public payable onlyWithBalance minimumFee {
        balance[msg.sender] += msg.value;
    }

    function getTotalBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // MODIFIERS

    modifier onlyOwner {
        require(msg.sender == contractOwner, "Ownership required");
        _;
    }

    modifier onlyWithZeroBalance {
        require(balance[msg.sender] == 0);
        _;
    }

    modifier onlyWithBalance {
        require(balance[msg.sender] > 0);
        _;
    }

    modifier minimumFee {
        if ( msg.value < fee ) 
            revert AmountToSmall();
        _;
    }
}
