// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint256 amount)
        external
        returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);
}

contract Vault {

    IERC20 public immutable token;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    constructor(IERC20 _token){
        token = _token;
    }

    function _mint(address _to, uint256 _shares) private {
        totalSupply += _shares;
        balanceOf[_to] += _shares; 
    }

    function _burn(address from, uint256 _shares) private {
        totalSupply -= _shares;
        balanceOf[_from] -= _shares; 
    }

    function deposit(uint256 _depositAmount) external { // s = aT / B
        uint256 shares;
        if(totalSupply == 0){
            shares = _depositAmount;
        } else {
            shares = _depositAmount * totalSupply / balanceOf[msg.sender];
        }
        _mint(msg.sender, shares);
        token.transferFrom(msg.sender, address(this), _depositAmount);
    }

    function withdraw(uint256 _shares) external { // a = sB / T
        uint256 amount =
            (_shares * token.balanceOf(address(this))) / totalSupply;
        _burn(msg.sender, _shares);
        token.transfer(msg.sender, amount);
    }
}