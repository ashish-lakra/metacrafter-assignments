# Minting token on local Hardhat network

**MyToken** is an Ethereum ERC20 token contract with added ownership functionality. It is implemented using Solidity and inherits from the OpenZeppelin ERC20 and Ownable contracts.

## Overview

This smart contract provides a standard ERC20 token with additional features for token minting and burning, as well as ownership management using the Ownable contract.

### ERC20 Token Standard

The contract follows the ERC20 token standard, providing the following basic functionalities:

- Token transfers between addresses.
- Querying account balances.
- Querying the total supply of tokens.

### Minting

The contract allows the owner to mint new tokens and assign them to specified accounts. Only the owner has the authority to mint new tokens.

### Burning

Token holders can burn (destroy) a specified amount of their own tokens, effectively reducing the total supply.

## Getting Started

To deploy and use the MyToken ERC20 contract, follow these steps:

1. The `npx hardhat init` command is used to initialize a new Hardhat project.

2. The `npm i @remix-project/remixd` command is used to install the remixd package. `remixd` is a tool that allows you to connect your local filesystem to the Remix IDE. This means that you can edit your Solidity contracts and other files on your computer, and the changes will be reflected in the Remix IDE in real time.

3. The `npx remixd` command is used to start a local server that allows you to connect your local filesystem to the Remix IDE.

4. The `npx hardhat node` command is used to start a local Ethereum node that can be used for development and testing.

5. Open the Remix IDE.

6. Change the workspace to localhost.

7. Click the "Connect" button.

## Contract Overview

### Constructor

The constructor of the contract takes two parameters:

- `name`: The name of the ERC20 token.
- `symbol`: The symbol of the ERC20 token.

### Functions

1. `mint(address account, uint256 amount)`: Mint new tokens and assign them to the specified account. Only the contract owner can call this function.

2. `transfer(address recipient, uint256 amount)`: Transfer tokens from the sender to the specified recipient. This function overrides the ERC20 transfer function to include custom functionality.

3. `burn(uint256 amount)`: Burn (destroy) a specified amount of tokens from the sender's balance. The tokens will be permanently removed from the sender's account.

## License

This smart contract is released under the MIT License. Please refer to the [LICENSE](LICENSE) file for more information.

## Video Tutorial

https://www.loom.com/share/a70753e7eb6a4d0e829cd069512a709c
