//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 <0.9.0;

error AmountToSmall();

contract Modifier {
 
    // STATE VARIABLES

    // Create struct tracking user details as a KYC measure
    struct UserDetail {
        string name;
        uint256 age;
    }

    // Store the user and the amount in a mapping as the previous task.
    address public contractOwner;
    mapping (address => uint256) public balance;
    mapping (address => UserDetail) public userDetail;
    uint256 public fee;

    // EVENTS
    event FundsDeposited(address indexed user, uint256 amount);
    event ProfileUpdated(address indexed user);   

    // fee and contract owner are set at deployment
    constructor (uint256 _minimumFee) {
        contractOwner = msg.sender;
        fee = _minimumFee; 
    }

    // FUNCTIONS

    // Create a deposit function that allows anybody to send funds. 
    function deposit(uint256 _amount) public onlyWithZeroBalance {
        balance[msg.sender] = _amount;
        emit FundsDeposited(msg.sender, _amount);
    }
    
    
    // Add a withdraw function and create a modifier that only allows 
    // the owner of the contract to withdraw the funds.
    function withdraw() public onlyOwner {
        balance[msg.sender] = 0;  // simulate withdrawal
    }

    /*  Add an addFund function and create a modifier that only allows 
        users that have deposited using the deposit function, to increase 
        their balance on the mapping. The function should accept the amount 
        to be added and update the mapping to have the new balance
    */
    function addFund(uint256 _amount) public onlyWithBalance value(_amount) {
        balance[msg.sender] += _amount;
        emit FundsDeposited(msg.sender, _amount);
    }
    
    /*  setUserDetails(string calldata name, uint256 age) 
        This function accepts 2 arguments that represent the details of 
        the user calling the smart contract and it saves them into a 
        defined struct
    */
    function setUserDetail(string calldata name, uint256 age) public {
        userDetail[msg.sender] = UserDetail(name, age);
        emit ProfileUpdated(msg.sender);
    }

    /*  getUserDetail() 
        This function retrieves and returns the details saved for the user 
        calling the contract.
    */
    function getUserDetail() public view returns(UserDetail memory) {
        return userDetail[msg.sender];
    }

    // MODIFIERS

    modifier onlyOwner {
        require(msg.sender == contractOwner, "must be owner");
        _;
    }

    modifier onlyWithZeroBalance {
        require(balance[msg.sender] == 0, "must have zero balance");
        _;
    }

    modifier onlyWithBalance {
        require(balance[msg.sender] > 0, "must have initial deposit");
        _;
    }

    // Create a modifier that accepts a value(uint256 _amount)
    // In the modifier check if the value(_amount) it accepts is 
    // less than the Fee, revert with a custom error AmountToSmall()
    modifier value(uint256 _amount) {
        if ( _amount < fee ) 
            revert AmountToSmall();
        _;
    }
}
