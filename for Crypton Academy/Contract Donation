// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract Donation {

address payable public owner;
address [] public donators;
uint public donationValue;
string message;

constructor () {
owner = payable(msg.sender);
}

function currentBalance() public view returns(uint) {
        return address(this).balance;
}

function gatherDonation() public payable {
    //require(msg.value >= 0.01 ether, "Too little money!");
donators.push(msg.sender);
}

function trasnferToOwner() external {
require(msg.sender == owner);
owner.transfer(address(this).balance);
}

function getDonators() public view returns(address [] memory) {
return donators;
}

function getDonationValue() public view  returns(uint) {
return donationValue;
}
}
