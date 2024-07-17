// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockToken is ERC20 {
    uint8 private immutable tokenDecimals;

    constructor(
        address owner,
        uint amount,
        uint8 decimals_
    ) ERC20("My Mock Token", "MMT") {
        tokenDecimals = decimals_;
        uint256 initialSupply = amount * 10 ** decimals_;
        _mint(owner, initialSupply);
    }

    function decimals() public view override returns (uint8) {
        return tokenDecimals;
    }
}
