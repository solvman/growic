//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract PrimitiveDataTypes {

    /*  Boolean 
        Boolean data type only has 2 values: true and false.
        Use case: function return as success or failure.
    */
    bool public success = true;

    /* 
        Integers
        Integers are represented with signed and unsigned (int/uint) integers
        of various sizes in steps of 8 (8 to 256 bits) int8 to int256, and uint2
        to uint 256.

        Unsigned Integers hold only positive values:

        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
        
    */

    uint8 public u_a = 5;
    uint public u_b = 345; // uint is an alias for uint256
    uint256 public u_c = 345678; 

    /* 
        Signed integers may hold positive and negative values:
        
        int256 ranges from -2 ** 255 to 2 ** 255 - 1
        int128 ranges from -2 ** 127 to 2 ** 127 - 1
    */

    int8 public i_a = -4;
    int public i_b = 10; // int is an alias to int256;
    int256 public i_c = -123434;

    // Minimun and maximum values for int
    int256 public minInt = type(int256).min;
    int256 public maxint = type(int256).max;

    // Minimum and maximum values for uint
    uint256 public minUint = type(uint256).min;
    uint256 public maxUint = type(uint256).max;

    /*  Address
        Address type in solidity comes in 2 very simular flavors: 
        - address: represent 20 byte value of Ethereum address
        - address payable: the same as "address", but includes 2 additional methods "transfer" and "send"

        Use case: address of ethereum contract or account.
    */

    address public address1 = 0x000095E79eAC4d76aab57cB2c1f091d553b36ca0; // you won't be able to send any ether to it.
    
    // type "address" is not implicitly converted to "address payable",
    // that's why you must cast address literal to type "address payable"
    address payable public address2 = payable(0x4c1471e1a6446534923164a132F825341c2cc446); 

    /*  In Solidity there are 2 types of byte arrays:
        - fixed size byte arrays 
        - dynamically-sized byte arras

        The term "bytes" represents a dynamic array of bytes
        Use case: functions where byte manipulations required, working with bytecode. 

        !!!IMPORTANT: bytes and strings are not value types, but a special arrays (reference type)!!!
    */
    bytes1 public a = 0xFF;
    bytes1 public b = 0xEF;

    // Unasigned variables have default values:
    bool public defaultBoolean;     // false
    uint256 public defaultUint;     // 0
    int256 public defaultInt;       // 0
    address public defaultAddress;  // 0x0000000000000000000000000000000000000000

    /*  Solidity provides us with ability to create custom data type of a finite set of custome values. 
        Enum custom enumerated type assignes values starting from 0 and on, such as in the 
        example below OPEN = 0, PENDING = 1, CLOSED = 2

        Use case: replication of a state or a switch.
    */

    enum RaffleState {
        OPEN,       // value of 0
        PENDING,    // value of 1
        CLOSED      // value of 2
    }

    // Initialize a variable of type RaffleState and assigns it a value of RaffleState.OPEN
    RaffleState public myRaffleState = RaffleState.OPEN; 

   // Another way to assign value to custom types:
   // Initialize a variable of type RaffleState and assigns it a value of RaffleState.CLOSED
    RaffleState public anotherRaffleState = RaffleState(2); 
}
