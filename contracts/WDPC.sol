// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract WDPC is ERC20 {
    AggregatorV3Interface internal priceFeed;

    event Deposit(address indexed account, uint256 depositAmount, uint256 mintAmount);
    event Withdraw(address indexed account, uint256 withdrawAmount, uint256 burnAmount);
    
    constructor() ERC20("Wrapped Ether Dollar-Pegged Coin", "WDPC"){
        priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    receive() external payable {
        deposit();
    }
    
    fallback() external payable {
        deposit();
    }

    function deposit() public payable {
        uint256 unsignedPrice = uint256(getLatestETHUSDPrice());
        require(msg.value != 0, "Requested value is zero");
        require(msg.value <= type(uint256).max / unsignedPrice, "Results in overflow");
        uint256 mintAmount = msg.value * uint256(unsignedPrice);

        _mint(msg.sender, mintAmount);
        emit Deposit(msg.sender, msg.value, mintAmount);
    }

    function withdraw(uint256 _withdrawAmount) payable external {
        require(msg.value != 0, "Requested value is zero");
        require(address(this).balance >= _withdrawAmount, "Insufficient balance");

        uint256 unsignedPrice = uint256(getLatestETHUSDPrice());
        require(_withdrawAmount <= type(uint256).max / unsignedPrice, "Results in overflow");
        uint256 burnAmount = _withdrawAmount * uint256(unsignedPrice);
        require(burnAmount <= totalSupply(), "Insufficient supply");

        payable(msg.sender).transfer(_withdrawAmount);
        _burn(msg.sender, burnAmount);
        emit Withdraw(msg.sender, _withdrawAmount, burnAmount);
    }

    function getLatestETHUSDPrice() public view returns (int) {
        (
            ,
            int answer,
            ,
            ,
        ) = priceFeed.latestRoundData();
        return answer / 10 ** 8;
    }
}