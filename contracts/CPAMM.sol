// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

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

contract CPAMM {   // k = x * y
    IERC20 public immutable token0;
    IERC20 public immutable token1;

    uint256 public reserve0;
    uint256 public reserve1;

    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    constructor(address _token0, address _token1) {
        token0 = IERC20(_token0);
        token1 = IERC20(_token1);
    }

    function _mint(address to, uint256 amount) private {
        balanceOf[to] += amount;
        totalSupply += amount;
    }

    function _burn(address from, uint256 amount) private {
        balanceOf[to] -= amount;
        totalSupply -= amount;
    }

    function swap(address _tokenIn, uint256 _amountIn) external returns (uint256 amountOut) {
        require(_tokenIn == address(token0) || _tokenIn == address(token1), "invalid token");
        bool isToken0 = _tokenIn == address(token0);

        (IERC20 tokenIn, IERC20 tokenOut, uint256 resIn, uint256 resOut) = isToken0
            ? (token0, token1, reserve0, reserve1)
            : (token1, token0, reserve1, reserve0);

        tokenIn.transferFrom(msg.sender, address(this), _amountIn);
        uint256 amountIn = tokenIn.balanceOf(address(this)) - resIn;

        amountOut = (amountIn * 997) / 1000;

        (uint256 res0, uint256 res1) = isToken0
            ? (resIn + amountIn, resOut - amountOut)
            : (resOut - amountOut, resIn + amountIn);

        reserve0 = res0;
        reserve1 = res1;
        tokenOut.transfer(msg.sender, amountOut);
    }


    function addLiquidity(uint256 amount0, uint256 amount1) external returns (uint256 shares) {
        token0.transferFrom(msg.sender, address(this), amount0);
        token1.transferFrom(msg.sender, address(this), amount1);

        uint256 bal0 = token0.balanceOf(address(this));
        uint256 bal1 = token1.balanceOf(address(this));

        uint256 d0 = bal0 - reserve0;
        uint256 d1 = bal1 - reserve1;
        
        if (totalSupply > 0) {
            shares = ((d0 + d1) * totalSupply) / (reserve0 + reserve1);
        } else {
            shares = d0 + d1;
        }

        require(shares > 0, "shares = 0");
        _mint(msg.sender, shares);

        reserve0 = bal0;
        reserve1 = bal1;
    }

    function removeLiquidity(uint256 shares) external returns (uint256 d0, uint256 d1) {
        d0 = (reserve0 * shares) / totalSupply;
        d1 = (reserve1 * shares) / totalSupply;

        _burn(msg.sender, shares);

        reserve0 = reserve0 - d0;
        reserve1 = reserve1 - d1;

        if (d0 > 0) {
            token0.transfer(msg.sender, d0);
        }
        if (d1 > 0) {
            token1.transfer(msg.sender, d1);
        }
    }
}
