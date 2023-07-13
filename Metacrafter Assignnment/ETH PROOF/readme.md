# Creating a Token

MyToken is a Solidity contract that represents a token with basic minting and burning functionalities. It includes public variables to store the token's name, abbreviation, and total supply. The contract also utilizes a mapping variable to track token balances for different addresses.

## Installation

1. Clone the repository or create a new Solidity file.
2. Ensure that you have a compatible Solidity compiler, preferably version 0.8.18.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract to an Ethereum-compatible blockchain network of your choice.

## Contract Overview

The MyToken contract provides the following functionalities:

### Variables

- `tokenName` (string): Stores the name of the token.
- `tokenAbbvr` (string): Stores the abbreviation of the token.
- `totalSupply` (uint): Tracks the total supply of the token.

### Mapping Variable

- `balances` (mapping): A mapping that associates addresses with their corresponding token balances. It allows querying the balance of a specific address.

### Mint Function

```solidity
function mint(address _address, uint _value) public
```

The `mint` function is used to mint new tokens. It takes two parameters: `_address`, the address to which the tokens will be minted, and `_value`, the amount of tokens to mint. The function increases the total supply by `_value` and adds the minted tokens to the balance of the specified `_address`.

### Burn Function

```solidity
function burn(address _address, uint _value) public
```

The `burn` function allows burning existing tokens. It takes two parameters: `_address`, the address from which the tokens will be burned, and `_value`, the amount of tokens to burn. The function checks if the `_address` has a sufficient balance to burn the requested `_value` of tokens. If the balance is sufficient, it decreases the total supply by `_value` and subtracts the burned tokens from the balance of the specified `_address`.

## License

This contract is licensed under the MIT License. You can find the license text in the source code file using the SPDX-License-Identifier tag.

## Compatibility

The contract is written in Solidity version 0.8.18. It should be compatible with Solidity compilers of the same version or higher.

## Contribution

Contributions to this project are welcome. Feel free to open issues and submit pull requests to suggest improvements or fix any identified issues.

## Video Tutorial



