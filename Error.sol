// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SmartContract {
    uint256 public balance;
    constructor() {
        balance = 800;
    } 
//using external so that deposit and withdraw can only be accessed from external account. also less gas fees compared to public.
    function deposit(uint256 amount) external {
        require(amount > 0, "INVALID! Amount is less than zero");
        balance += amount;
    }
    function withdraw(uint256 amount) external {
        assert(amount <= balance);
        balance -= amount;
        if (amount > 300) {
            revert("Withdrawal amount shoudnt be more than 100. You could be getting scammed!");
        }
    }
}
