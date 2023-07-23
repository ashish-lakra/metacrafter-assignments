# Building On Avalanche
## DegenGamingToken (DGT) Smart Contract

The DegenGamingToken (DGT) is an ERC20 token smart contract. This contract allows Degen Gaming to create and distribute new tokens as rewards, enables players to transfer tokens to others, and provides a mechanism for players to redeem their tokens for in-game items in the in-game store. Additionally, anyone can burn tokens they own but no longer need.

## Token Information

- Name: Degen Token
- Symbol: DGT
- Decimals: 18 (Token amount is represented with 18 decimal places)

## Functionalities

### Minting New Tokens

Only the contract owner can mint new tokens. New tokens can be created and distributed to players as rewards.

Function Signature:
```solidity
function mint(address to, uint256 amount) public onlyOwner
```

### Transferring Tokens

Players can transfer their tokens to others.

Function Signature:
```solidity
function transferTokens(address to, uint256 amount) external
```

### Redeeming Tokens

Players can redeem their tokens for in-game items in the in-game store. This is achieved by burning tokens.

Function Signature:
```solidity
function redeemTokens(uint256 amount) external
```

### Checking Token Balance

Players can check their token balance at any time.

Function Signature:
```solidity
function checkBalance() external view returns (uint256)
```

### Burning Tokens

Anyone can burn tokens they own but no longer need.

Function Signature:
```solidity
function burnTokens(uint256 amount) external
```

## Getting Started

To interact with the DegenGamingToken smart contract, you can use the web3 library or a tool like MetaMask. Make sure you have the necessary setup and access to the Ethereum blockchain to perform transactions.

## Security Considerations

When interacting with smart contracts, please ensure the following security considerations:

- Double-check contract addresses before executing any transactions.
- Ensure you have enough gas to perform transactions on the Ethereum blockchain.
- Be cautious when interacting with functions that alter token balances or perform critical operations.

## License

This smart contract is released under the MIT License.

## Video Explanation

https://www.loom.com/share/47b53485cb844ce0b806cae119cf7a3a
