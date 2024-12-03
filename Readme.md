# SimpleRewardToken Smart Contract

This is a simple ERC20 token smart contract that allows the owner to mint tokens, reward users, and manage allowances for third-party transfers. It uses the ERC20 standard from OpenZeppelin to implement token functionality and additional features for rewarding users and handling third-party transfers.

## Contract Features

- **Minting**: The owner can mint a predefined amount of tokens (10,000 tokens) upon deployment.
- **Rewarding Users**: The owner can reward other addresses by transferring tokens from their balance.
- **Allowance Management**: The owner can approve a spender to transfer a specific amount of tokens on their behalf.
- **Third-Party Transfers**: A third party (spender) can transfer tokens from another user's account, provided the sender has approved the allowance.

## Prerequisites

- **Solidity**: The contract is written in Solidity version 0.8.20.
- **OpenZeppelin**: This contract uses the OpenZeppelin library for ERC20 functionality, which simplifies the implementation and ensures security.

## Deployment

To deploy this contract, you can use the following steps:

1. **Install Dependencies**:
   - Install OpenZeppelin contracts using npm:
     ```bash
     npm install @openzeppelin/contracts
     ```

2. **Deploy Contract**:
   - Use Remix, Truffle, or Hardhat to deploy the contract. For example, in Remix:
     - Paste the code into a new Solidity file.
     - Compile the contract.
     - Deploy it to a network (e.g., Rinkeby, Mainnet, or a local Ethereum network).

3. **Interacting with the Contract**:
   After deployment, you can interact with the contract functions via the deployed contract address using a Web3 library or directly through the Remix interface.

## Functions

### 1. `constructor()`

The constructor mints 10,000 tokens to the owner's address upon deployment.

### 2. `reward(address recipient, uint256 amount)`

- **Description**: This function allows the owner to reward a specific user by transferring tokens from the owner's balance to the recipient.
- **Access Control**: Only the owner can call this function.
- **Parameters**:
  - `recipient`: The address of the user to receive the tokens.
  - `amount`: The amount of tokens to be transferred.

### 3. `spend(address spender, uint256 amount)`

- **Description**: This function allows the owner to approve a spender to transfer a specified amount of tokens on their behalf.
- **Access Control**: Only the owner can call this function.
- **Parameters**:
  - `spender`: The address of the spender allowed to transfer the specified amount.
  - `amount`: The amount of tokens the spender is allowed to transfer.

### 4. `thirdPartyTransfer(address sender, address recipient, uint256 amount)`

- **Description**: This function allows a third-party spender to transfer tokens from a user's account to another recipient, as long as the user has approved the spender to transfer tokens on their behalf.
- **Access Control**: Anyone can call this function as long as they have been approved by the sender to transfer tokens.
- **Parameters**:
  - `sender`: The address from which the tokens will be transferred.
  - `recipient`: The address that will receive the tokens.
  - `amount`: The amount of tokens to transfer.

