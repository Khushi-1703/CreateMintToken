// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {
    // Constructor to initialize the token with a name and symbol
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Mint initial supply of tokens to the contract deployer (owner)
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Function to allow the contract owner to mint new tokens to a provided address
    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Invalid address");
        _mint(to, amount);
    }

    // Function to allow any user to burn (destroy) their own tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Override the transfer function to add additional checks
    function transfer(address to, uint256 amount) public override returns (bool) {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        
        _transfer(msg.sender, to, amount);
        return true;
    }

    // Function to transfer tokens on behalf of the sender (requires approval)
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        require(from != address(0), "Invalid sender address");
        require(to != address(0), "Invalid recipient address");
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(from) >= amount, "Insufficient balance");
        require(allowance(from, msg.sender) >= amount, "Allowance exceeded");
        
        _transfer(from, to, amount);
        _approve(from, msg.sender, allowance(from, msg.sender) - amount);
        return true;
    }
    
    // Function to approve a spender to spend a certain amount of tokens on behalf of the sender
    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }
}
