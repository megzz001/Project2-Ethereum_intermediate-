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
