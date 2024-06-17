// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WDPC is ERC20 {

    event Deposit(address indexed account, uint256 amount);
    event Withdraw(address indexed account, uint256 amount);

}
