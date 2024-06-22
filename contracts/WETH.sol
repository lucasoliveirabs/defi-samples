// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20 {

    event Deposit(address indexed account, uint256 depositAmount);
    event Withdraw(address indexed account, uint256 withdrawAmount);
    
    constructor() ERC20("Wrapped Ether", "WETH"){}

    receive() external payable {
        deposit();
    }
    
    fallback() external payable {
        deposit();
    }

    function deposit() public payable {
        _mint(msg.sender, msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _withdrawAmount) payable external {
        _burn(msg.sender, _withdrawAmount);
        payable(msg.sender).transfer(_withdrawAmount);
        emit Withdraw(msg.sender, _withdrawAmount);
    }
}