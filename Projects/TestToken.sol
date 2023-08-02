// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract TestToken is ERC20PresetMinterPauser, Ownable {

    constructor(address owner, uint256 amount) ERC20PresetMinterPauser("TestToken", "TTK") {
            _mint(owner, amount * (10 ** decimals()));
    }

    function mint(uint256 amount) public {
        _mint(msg.sender, amount * (10 ** decimals()));
    }

}
