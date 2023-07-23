// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        // Mint initialSupply tokens and assign them to the contract deployer (owner)
        _mint(msg.sender, initialSupply);
    }

    // Mint new tokens and distribute them to players as rewards
    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Invalid address.");
        _mint(to, amount);
    }

    // Transfer tokens to others
    function transferTokens(address to, uint256 amount) external {
        require(to != address(0), "Invalid address.");
        _transfer(msg.sender, to, amount);
    }

    // Redeem tokens for items in the in-game store (burn tokens)
    function redeemTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance in the account.");
        _burn(msg.sender, amount);
    }

    // Check token balance of the caller
    function checkBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Allow anyone to burn tokens they own that are no longer needed
    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance in the account.");
        _burn(msg.sender, amount);
    }
}
