// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract Degen is ERC20, Ownable, ERC20Burnable {
    // Create a mapping to store the redemption values for each choice
    mapping(uint256 => uint256) private redemptionValues;
    
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        // Mint initialSupply tokens and assign them to the contract deployer (owner)
        _mint(msg.sender, initialSupply);

        // Initialize the redemption values for each choice
        redemptionValues[1] = 100; 
        redemptionValues[2] = 200;  
        redemptionValues[3] = 300;
        redemptionValues[4] = 400;
        redemptionValues[5] = 500;  
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
    
    // Function to view the items available in the game store
    function gameStore() public pure returns (string[] memory) {
        string[] memory items = new string[](5);
        items[0] = "1. One Piece gear 01 = 100";
        items[1] = "2. One Piece gear 02 = 200";
        items[2] = "3. One Piece gear 03 = 300";
        items[3] = "4. One Piece gear 04 = 400";
        items[4] = "5. One Piece gear 05 = 500";
        return items;
    }

    // Redeem tokens for items in the in-game store (burn tokens)
    function redeemTokens(uint256 choice) external {
        require(choice >= 1 && choice <= 5, "Invalid selection");

        uint256 amountToRedeem = redemptionValues[choice];
        require(amountToRedeem > 0, "Invalid choice");

        require(balanceOf(msg.sender) >= amountToRedeem, "Insufficient balance");

        // Burn the tokens
        _burn(msg.sender, amountToRedeem);

        // Emit a confirmation message
        console.log("Tokens redeemed successfully. Burned %s tokens.", amountToRedeem);
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
