// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// TODO:
//      Build a smart contract that can add investor wallets
//      to a decentralized bank and then allocate (pay) them funds.
//      Pay a few accounts some funds of your choose and when you're done run the checkInvestors testing function.
contract Investors {
    address bankAddress;

    constructor() payable {
        bankAddress = msg.sender;
    }

    address payable[] investors;
    mapping(address => uint) funds;

    function payAccount(address payable investorAddress, uint amount) public {
        investors.push(investorAddress);
        funds[investorAddress] = amount;
    }

    function viewFunds() public view returns(mapping(address => uint)) {
        return funds;
    }
}
