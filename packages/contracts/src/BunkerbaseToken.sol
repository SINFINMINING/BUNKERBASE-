// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BunkerbaseToken is ERC20, Ownable {
    uint256 public constant LOCKED_PERCENTAGE = 5; // 5% locked
    uint256 public lockedBalance;

    constructor() ERC20("Bunkerbase Token", "BBT") {
        uint256 initialSupply = 1000000 * 10 ** decimals(); // Total supply
        _mint(msg.sender, initialSupply);
        lockedBalance = (initialSupply * LOCKED_PERCENTAGE) / 100; // Calculate locked balance
    }

    function getLockedBalance() external view returns (uint256) {
        return lockedBalance;
    }

    // Additional functionality can be added here
}