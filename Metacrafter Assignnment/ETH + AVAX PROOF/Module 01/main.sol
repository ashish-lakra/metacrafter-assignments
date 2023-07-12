// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract simpleContract {
    uint256 public value;

//The 'setValue' function allows users to set the value.
    function setValue(uint256 newValue) public {

//A require() statement is used to check if the new value is not zero. If the value is zero, the function will revert. 
        require(newValue != 0, "Value must not be zero"); // Require statement

        uint256 oldValue = value;
        value = newValue;

//The assert() statements is used to ensure that the value is updated correctly. It checks if the updated value variable matches the newValue passed to the function and if it differs from the previous value (oldValue).
        assert(value == newValue); // Assert statement
        assert(oldValue != value); // Assert statement
    }

    function getValue() public view returns (uint256) {
        return value;
    }

//The 'revertTransaction' function that demonstrates the usage of the revert() statement. 
    function revertTransaction() public pure {
        revert("Transaction reverted"); // Revert statement
    }
}
