// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract Donation {

address payable owner;
address [] donators;
mapping(address => uint) donations;
modifier onlyOwner() {
    require(msg.sender == owner, "You are not owner!");
_;
}

constructor () {
owner = payable(msg.sender);
}

function gatherDonation() public payable {
    donators.push(msg.sender);
    donations[msg.sender] = msg.value;
}

function getBalance() public view returns(uint) {
    return address(this).balance;
}

function trasnferToOwner() public onlyOwner {
owner.transfer(this.getBalance());
}

function getDonators() public view returns(address [] memory) {
    return donators;
}

function getDonations(address _address) public view returns(uint) {
    return donations[_address];
}

}
