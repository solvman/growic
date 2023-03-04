//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 <0.9.0;

    // Create smart contract that saves user balance

contract UserBalanceKYC {

    // Create struct tracking user details as a KYC measure
    struct UserDetail {
        string name;
        uint256 age;
    }

    // Create mapping of address to uint256 to track balances
    mapping (address => uint256) public balance;

    // Create mapping of address ot UserDetail struct
    mapping (address => UserDetail) public userDetail;

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
    function checkBalance() public view returns(uint256) {
        return balance[msg.sender];
    }

    /*  setUserDetails(string calldata name, uint256 age) 
        This function accepts 2 arguments that represent the details of 
        the user calling the smart contract and it saves them into a 
        defined struct
    */
    function setUserDetail(string calldata name, uint256 age) public {
        userDetail[msg.sender] = UserDetail(name, age);
    }

    /*  getUserDetail() 
        This function retrieves and returns the details saved for the user 
        calling the contract.
    */
    function getUserDetail() public view returns(UserDetail memory) {
        return userDetail[msg.sender];
    }
}
