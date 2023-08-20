// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {
    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Invalid address");
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    function transferTokens(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        
        _transfer(msg.sender, to, amount);
    }
}
