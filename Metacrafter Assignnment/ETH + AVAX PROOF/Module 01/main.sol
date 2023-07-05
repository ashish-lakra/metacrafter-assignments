// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract useOfStatements {
   
    function Assertfun(uint num) public pure{
        assert(num!=0);
    }

    function divide(uint _numerator, uint _denominator) public pure returns (uint){
        if(_numerator<_denominator){
           
            revert("Please input numerator greater than denominator.");
            
        }
        return _numerator/_denominator;
       

    }
    function multiple(uint a) public view returns (uint){
        require(a>0,"Enter more then 0.");
        return a*mult;

    }
uint mult=3;
}