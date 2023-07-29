# Building On Avalanche
## DegenGamingToken (DGT) Smart Contract

## Description

The `Degen` smart contract is an ERC-20 token contract that represents a gaming token. It allows the contract owner to mint new tokens, distribute them to players as rewards, and transfer tokens between addresses. The contract also features an in-game store where players can redeem their tokens for various items, and they can burn their tokens when they are no longer needed.

## Token Details

- Name: Degen
- Symbol: DEG
- Total Supply: (Initial supply specified during deployment)

## In-Game Store

The contract features an in-game store where players can redeem their tokens for various items. The available items in the store are as follows:

1. One Piece gear 01 - 100 tokens
2. One Piece gear 02 - 200 tokens
3. One Piece gear 03 - 300 tokens
4. One Piece gear 04 - 400 tokens
5. One Piece gear 05 - 500 tokens

## Contract Functions

The `Degen` smart contract exposes the following functions:

- `mint(address to, uint256 amount)`: Allows the contract owner to mint new tokens and distribute them to the specified address as rewards.

- `transferTokens(address to, uint256 amount)`: Allows players to transfer tokens to others.

- `redeemTokens(uint256 choice)`: Allows players to redeem tokens for items in the in-game store. The `choice` parameter corresponds to the item they wish to redeem.

- `burnTokens(uint256 amount)`: Allows anyone to burn their own tokens that are no longer needed.

- `checkBalance()`: Allows players to check their token balance.

## Deployment

To deploy the `Degen` smart contract, you need to provide the following details:

- Name: Name of the token (e.g., "Degen").
- Symbol: Symbol of the token (e.g., "DGN").
- Initial Supply: Initial supply of tokens to be minted and assigned to the contract deployer (owner).

## License

This smart contract is released under the MIT License.

## Video Explanation

https://www.loom.com/share/0e62253f2d7a4d2b9109e39bae44a477
