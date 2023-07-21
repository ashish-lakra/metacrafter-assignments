// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// MyToken is an ERC20 token contract with added ownership functionality.
contract MyToken is ERC20, Ownable {
    // Constructor for deploying the token contract.
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // The constructor of ERC20 contract is invoked with the provided name and symbol.
        // The ERC20 contract is used as the base for this token contract.
    }

    // Mint new tokens and assign them to the specified account.
    function mint(address account, uint256 amount) public onlyOwner {
        // This function can only be called by the owner of the contract (using the Ownable modifier).
        _mint(account, amount); // The specified account receives the specified amount of new tokens.
    }

    // Transfer tokens from the sender to the specified recipient.
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        // Override the transfer function of ERC20 to add custom functionality.
        _transfer(_msgSender(), recipient, amount); // Transfer tokens from the sender to the recipient.
        return true; // Indicate that the transfer was successful.
    }

    // Burn (destroy) a specified amount of tokens from the sender's balance.
    function burn(uint256 amount) public {
        _burn(msg.sender, amount); // The specified amount of tokens is removed from the sender's balance.
    }
}
