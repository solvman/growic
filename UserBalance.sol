//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

    // Create smart contract that saves user balance

contract UserBalance {

    // Create mapping of address to uint256 to track balances
    mapping (address => uint256) public balance;

    /*  Create deposit(uint256)
        this function accepts one argument and it saves the amount 
        a user is depositing into a mapping
    */
    function deposit(uint256 _amount) public {
        balance[msg.sender] = _amount;
    }

    /*  Create checkBalance()
         this function searches for the user balance inside the 
         balance mapping and returns the balance of whoever is calling the 
         contract (i.e msg.sender). 

        This function does not accept any arguments.
    */
    function checkBalance() public view returns(uint256 _balance) {
        _balance = balance[msg.sender];
    }
}
