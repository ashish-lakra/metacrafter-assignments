# ExampleContract

This Solidity contract is an example contract that demonstrates some important concepts and statements used in Solidity programming. It includes functions to set and retrieve a value, as well as a function to revert a transaction.

## Functionality
1. Contract successfully uses require()
2. Contract successfully uses assert()
3. Contract successfully uses revert() statements

## Installation

1. Clone the repository or create a new Solidity file.
2. Ensure that you have a compatible Solidity compiler, preferably version 0.8.0 or higher.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract to an Ethereum-compatible blockchain network of your choice.

## Contract Overview

The ExampleContract is a basic Solidity contract that allows users to set and retrieve a value. It includes the following functions:

### setValue

```solidity
function setValue(uint256 newValue) public
```

This function sets the value of the `value` variable in the contract. It takes a `newValue` as a parameter and requires that the new value is not zero. If the new value is zero, the function will throw an exception with the message "Value must not be zero". After setting the new value, the function performs two assertions:

1. It asserts that the `value` variable is equal to the `newValue`.
2. It asserts that the `oldValue` is not equal to the `value`.

### getValue

```solidity
function getValue() public view returns (uint256)
```

This function allows users to retrieve the current value stored in the contract. It returns the value as a `uint256` type.

### revertTransaction

```solidity
function revertTransaction() public pure
```

This function is used to demonstrate the `revert` statement. When called, it reverts the current transaction with the message "Transaction reverted". The `pure` modifier ensures that this function does not modify the contract's state.

## License

This contract is licensed under the MIT License. You can find the license text in the source code file using the SPDX-License-Identifier tag.

## Compatibility

The contract is written in Solidity version 0.8.0. It should be compatible with Solidity compilers of the same version or higher.

## Contribution

Contributions to this project are welcome. Feel free to open issues and submit pull requests to suggest improvements or fix any identified issues.
