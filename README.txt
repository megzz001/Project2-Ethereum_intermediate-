# Secure Balance Management

This Solidity program is a secure balance management contract that demonstrates basic balance operations such as increasing, decreasing, and resetting a balance with appropriate checks and restrictions.

## Description

This contract is designed to manage a balance securely. It includes functions to increase and decrease the balance, with checks to ensure valid operations. The balance can only be reset by the contract owner. This contract serves as an example of secure Solidity programming practices, including the use of require, assert, and revert statements.

## Getting Started

### Prequisites
To run this program, you will need:

A modern web browser
Internet access
Basic understanding of Solidity and Ethereum smart contracts

### Executing program

Go to the Remix website: Remix.

Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., SecureBalanceManagement.sol).

```javascript
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract SecureBalanceManagement {

    uint public balance;
    address public owner;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    function increaseBalance(uint amount) public {
        // Ensure the amount is greater than zero
        require(amount > 0, "Amount must be greater than zero");
        balance += amount;
    }

    function decreaseBalance(uint amount) public {
        // Ensure the amount is less than or equal to the balance
        require(amount <= balance, "Insufficient balance");

        // Use assert to check for underflow (should never happen due to the require above)
        uint newBalance = balance - amount;
        assert(newBalance <= balance);

        balance = newBalance;
    }

    function resetBalance() public {
        // Ensure the caller is the owner
        require(msg.sender == owner, "Only the owner can reset the balance");

        // Use revert with a custom error message if the condition is met
        if (balance == 0) {
            revert("Balance is already zero");
        }

        balance = 0;
    }
}


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to a compatible version (e.g., 0.8.4), and then click on the "Compile SecureBalanceManagement.sol" button.

Once the code is compiled, deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the SecureBalanceManagement contract from the dropdown menu, and then click on the "Deploy" button.

After the contract is deployed, interact with it by calling the functions increaseBalance, decreaseBalance, and resetBalance as needed.

## Authors

Megha  
[meghagusain03@gmail.com]

