// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MyStorage {
    
    uint public storedD;
    
    
    
    function set(uint X) public {
        storedD = X;
    }
    
    
    
    function get() public view returns (uint){
        return storedD;
    }
} 
