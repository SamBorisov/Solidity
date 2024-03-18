// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
    Using requite, with not long text the the best way to function that rarely hits error
    Using assert is the most gas efficient when we hit an error but costly on execution
    Using custom error is also very gas efficient when we hit error but costly on execution (provides more information than assert)
    Using custom error with data is gas costly on error, but very cheap when not hitting an error for some reason (almost like require)
    Using If with revet and string is the worst and least beneficial
    (Be aware that we can use 1 custom error in multiple functions)
*/

contract TestOne {

    uint256 public one = 1;

    error Err1();
    error Err2(address, uint256);

    // 4604 estimated
    // 2597 gas no error
    // 2338 gas with error
    function f1() public view returns (uint256){
        assert(one == 1);
        return one;
    }

    // 4560 estimated
    // 2553 gas no error
    // 2551 gas with error
    function f2() public view returns (uint256){
        require(one == 1, "one is not 1");
        return one;
    }

    // 4582 estimated
    // 2575 gas no error
    // 2573 gas with error
    function f3() public view returns (uint256){
        if (one != 1) {
            revert("one is not 1");
        }
        return one;
    }

    // 4626 estimated
    // 2619 gas no error
    // 2368 gas with error
    function f4() public view returns (uint256){
        if (one != 1) {
            revert Err1();
        }
        return one;
    }

    // 4561 estimated
    // 2554 gas no error
    // 2603 gas with error
    function f5() public view returns (uint256){
        if (one != 1) {
            revert Err2(msg.sender, block.timestamp);
        }
        return one;
    }

    function addToOne(uint256 x) external {
        one += x;
    }

    function resetOne() external  {
        one = 1;
    }
    
}
