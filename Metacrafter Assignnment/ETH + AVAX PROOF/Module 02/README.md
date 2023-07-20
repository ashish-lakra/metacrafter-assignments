


# Smart Contract Management

The TokenMaster smart contract is an Ethereum-based contract that facilitates the listing and purchase of tickets for various occasions/events. The contract extends the ERC721 standard to create unique tokens for each ticket sold. Below is an overview of the contract's functionality and how to use it.

## Technology Stack & Tools

- Solidity (Writing Smart Contracts & Tests)
- Javascript (React & Testing)
- [Hardhat](https://hardhat.org/) (Development Framework)
- [Ethers.js](https://docs.ethers.io/v5/) (Blockchain Interaction)
- [React.js](https://reactjs.org/) (Frontend Framework)
- [MetaMask](https://metamask.io/)

## Requirements For Initial Setup
- Install [NodeJS](https://nodejs.org/en/). Recommended to use the LTS version.
- Install [MetaMask](https://metamask.io/) on your browser.

## Setting Up/Installation

### 1. Clone/Download the Repository

### 2. Install Dependencies:
`$ npm install`

### 3. Run tests
`$ npx hardhat test`

### 4. Start Hardhat node
`$ npx hardhat node`

### 5. Run deployment script
In a separate terminal execute:
`$ npx hardhat run ./scripts/deploy.js --network localhost`

### 6. Start frontend
`$ npm run start`

## Contract Overview

The TokenMaster contract includes the following state variables and functions:

### State Variables

- `owner`: Stores the address of the contract owner, who has certain administrative privileges.
- `totalOccasions`: Keeps track of the total number of occasions/events listed in the contract.
- `totalSupply`: Keeps track of the total number of tickets sold across all occasions.

### Struct

- `Occasion`: A struct to store the details of each occasion/event, including `id`, `name`, `cost`, `tickets`, `maxTickets`, `date`, `time`, and `location`.

### Mappings

- `occasions`: Maps occasion ID (uint256) to the corresponding `Occasion` struct, which holds all the details of that occasion.
- `hasBought`: Maps occasion ID to a mapping of addresses that have bought a ticket for that occasion.
- `seatTaken`: Maps occasion ID to a mapping of seat numbers and their respective owners' addresses.
- `seatsTaken`: Maps occasion ID to an array of seat numbers that have been taken.

### Modifiers

- `onlyOwner`: A modifier that restricts certain functions to be called only by the contract owner.

### Constructor

```solidity
constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol)
```

The constructor initializes the contract and sets the contract owner as the deployer's address. It also sets the name and symbol for the ERC721 token.

### Functions

1. `list`

```solidity
function list(string memory _name, uint256 _cost, uint256 _maxTickets, string memory _date, string memory _time, string memory _location) public onlyOwner
```

Allows the contract owner to list a new occasion/event. It takes various parameters representing the occasion details and adds the occasion to the `occasions` mapping.

2. `mint`

```solidity
function mint(uint256 _id, uint256 _seat) public payable
```

Enables users to purchase tickets for a specific occasion by sending enough Ether to cover the ticket cost. Each ticket purchased is represented as an ERC721 token, which is assigned to the buyer.

3. `getOccasion`

```solidity
function getOccasion(uint256 _id) public view returns (Occasion memory)
```

Allows anyone to query the details of a specific occasion by providing the occasion ID. It returns the `Occasion` struct for that occasion.

4. `getSeatsTaken`

```solidity
function getSeatsTaken(uint256 _id) public view returns (uint256[] memory)
```

Allows anyone to get the list of seats that have been taken for a specific occasion.

5. `withdraw`

```solidity
function withdraw() public onlyOwner
```

Allows the contract owner to withdraw the contract's balance to their address.

## License

The contract is provided without any license (SPDX-License-Identifier: UNLICENSED), which means it is proprietary and not open for reuse or modification. It is essential to consult the contract creator before using or deploying any part of the code elsewhere.

## Compatibility

The contract is written in Solidity version 0.8.9. It should be compatible with Solidity compilers of the same version or higher.

## Contribution

Contributions to this project are welcome. Feel free to open issues and submit pull requests to suggest improvements or fix any identified issues.

## Video Tutorial

https://www.loom.com/share/93a3686db5114c01a4459e0b66ad38f4
