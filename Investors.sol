// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// TODO:
//      Build a smart contract that can add investor wallets
//      to a decentralized bank and then allocate (pay) them funds.
//      Pay a few accounts some funds of your choose and when you're done run the checkInvestors testing function.
contract AddressWallets {
    address bankAddress;

    constructor() payable {
        bankAddress = msg.sender;
    }

    address payable[] investorWallets;
    mapping(address => uint) investors;

    function payInvestors(address payable investorAddress, uint amount) public {
        investorWallets.push(investorAddress);
        investors[investorAddress] = amount;
    }

    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    }
}
