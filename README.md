# CustomToken Smart Contract
CustomToken is a Solidity smart contract that implements a custom ERC20 token with minting, burning, and transferring functionality. It uses the OpenZeppelin library's ERC20 and Ownable contracts to create a customizable token.

## Features
1. Mint new tokens to a specified address.
2. Burn (destroy) tokens held by the contract owner.
3. Transfer tokens between addresses.

## Prerequisites
Before deploying and interacting with the contract, make sure you have the following prerequisites:

1. Solidity compiler (version 0.8.0 or compatible)
2. Ethereum development environment (Remix, Truffle, Hardhat, etc.)
3. OpenZeppelin library

## Deployment
1. Deploy the contract to an Ethereum-compatible blockchain network using your chosen development environment.
2. Provide a name and symbol for your token during deployment.

## Functions
1. **mint(address to, uint256 amount)**
Allows the contract owner to mint new tokens and send them to the specified address.

*Parameters:
to: The address to which the new tokens will be minted.
amount: The amount of tokens to mint.*

2. **burn(uint256 amount)**
Allows any user to burn (destroy) their own tokens.

*Parameters:
amount: The amount of tokens to burn.*

3. **transferTokens(address to, uint256 amount)**
Allows any user to transfer tokens to another address.

*Parameters:
to: The address to which the tokens will be transferred.
amount: The amount of tokens to transfer.*

## Events
1. **TokensMinted**
Emitted when tokens are minted by the contract owner.

*Parameters:
to: The address to which the tokens were minted.
amount: The amount of tokens minted.*

2. **TokensBurned**
Emitted when tokens are burned by a user.

*Parameters:
from: The address from which the tokens were burned.
amount: The amount of tokens burned.*

## Security Considerations
Ensure proper testing and auditing before deploying the contract to a production environment.
Handle private keys and access control carefully to prevent unauthorized access to minting and burning functions.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
