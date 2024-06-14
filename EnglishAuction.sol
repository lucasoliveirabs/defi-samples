// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IERC721 {
    function transferFrom(address from, address to, uint nftId) external;
}

contract EnglishAuction {
    event Start();
    event Bid(address indexed sender, uint256 amount);
    event Withdraw(address indexed bidder, uint256 amount);
    event End(address winner, uint256 amount);

    IERC721 public immutable nft;
    uint256 public immutable nftId;

    address payable public immutable seller;
    uint256 public endAt;
    bool public started;
    bool public ended;

    address public highestBidder;
    uint256 public highestBid;
    // mapping from bidder to amount of ETH the bidder can withdraw
    mapping(address => uint256) public bids;

    constructor(address _nft, uint256 _nftId, uint256 _startingBid) {
        nft = IERC721(_nft);
        nftId = _nftId;
        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    function start() external {
        require(msg.sender == seller, "Only seller");
        require(!started, "Auction has started");
        
        nft.transferFrom(seller, address(this), nftId);
        started = true;
        endAt = block.timestamp + 7 days;
        emit Start();
    }

    function bid(uint256 _amount) external payable {
        require(started, "Auction has not started");
        require(!ended, "Auction has expired");
        require(_amount > highestBid, "Sent amount must be greater than previous bid");
        
        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid;
        }
        
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit Bid(msg.sender, msg.value);
    }

    function withdraw() external {
        uint256 amount = bids[msg.sender];
        payable(msg.sender).transfer(amount);
        bids[msg.sender] = 0;
        emit Withdraw(msg.sender, amount);
    }

    function end() external {        
        require(started, "Not started");
        require(block.timestamp >= endAt, "Already ended");
        require(!ended, "Already ended");
        
        if (highestBidder != address(0)) {
            nft.transferFrom(address(this), highestBidder, nftId);
            seller.transfer(highestBid);
        } else {
            nft.transferFrom(address(this), seller, nftId);
        }
        
        ended = true;
        emit End(highestBidder, highestBid);
    }
}