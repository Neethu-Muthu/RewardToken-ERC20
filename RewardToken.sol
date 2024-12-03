// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleRewardToken is ERC20 {
    address public owner;

    constructor() ERC20("RewardToken", "RWT") {
        owner = msg.sender;
        _mint(owner, 10000 * 10 ** decimals()); // Mint 10,000 tokens to the owner's address
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Reward users with tokens
    function reward(address recipient, uint256 amount) external onlyOwner {
        require(balanceOf(owner) >= amount, "Not enough tokens in the owner's account");
        _transfer(owner, recipient, amount);
    }
    // approve to allow spender to transfer amoount from the owner
    function spend(address spender, uint256 amount) external onlyOwner{
        approve(spender, amount);
    }
    // allowance is used to transfer amount behalf of someone
    function thirdPartyTransfer(address sender, address recipient, uint256 amount) external {
        require(allowance(sender, msg.sender) >= amount, "Allowance exceeded");
        transferFrom(sender, recipient, amount); // Moves tokens using allowance
    }
} 