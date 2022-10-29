// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

interface Payout {
    function distribute(address payable cardHolder) external payable;
}

interface Check {
    function balanceOf(address user) external returns(uint256);
}

contract MikesShoes {
   address payable owner;

   constructor() {
    owner = payable(msg.sender);
   }

   function sold(address payable _cardHolder) public payable {
        uint payout = (msg.value * 1500) / 10000;
        uint profit = (msg.value * 8500) / 10000;
        uint response = checkIfHasCard(_cardHolder);
        if(response > 0) {
            Payout(0x3eadE785D96743fABF8A3a744fe302d9A43A787a).distribute{value: payout}(_cardHolder);
            owner.transfer(profit);
        } else {
            uint total = payout + profit;
            owner.transfer(total);
        }
   }

   function checkIfHasCard(address _user) private returns(uint256) {
        uint256 tokens = Check(0x3eadE785D96743fABF8A3a744fe302d9A43A787a).balanceOf(_user);
        return tokens;
   }
}
