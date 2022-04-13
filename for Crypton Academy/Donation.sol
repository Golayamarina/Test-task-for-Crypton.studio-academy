// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract Donation {

address payable public owner;
address [] public donators;
mapping(address => uint256) public donations;
uint256 donationAmount;

constructor () {
owner = payable(msg.sender);
}

function gatherDonation() public payable {
donators.push(msg.sender);
}

function trasnferToOwner() external {
require(msg.sender == owner);
owner.transfer(address(this).balance);
}

function getDonators() public view returns(address [] memory) {
return donators;
}

function getDonations() public view returns(uint256) {
return donations[msg.sender];
}
}
