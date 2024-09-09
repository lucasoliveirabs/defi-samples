# defi-samples

## Dutch Auction
- Contract that manages an auction where the seller begins with a high asking price and lowers it incrementally until a participant accepts the price or the minimum price is reached
#### Usage
- ICOs (fundraising)

### English Auction
- Contract that manages an auction where the seller begins with a low asking price and increases it incrementally until a participant accepts the price
### Usage
- Traditional auction operations (art, colletibles and tangible assets)

## WETH
#### Why
- WETH is a standard created to encapsulate Ether (ETH) and make it compatible with the ERC-20 standard, allowing ETH to be tradable in ERC-20-based dApps or blockchains
- WETH has this name because of ETH ERC-20 encapsulation case but at the end it serves any case of not-ERC-20 token we want to encapsulate into ERC-20. Once every Ethereum address may receive and transfer ETH, to encapsulate the token to ERC-20 only make sense if needed
#### How
- The ERC-20 created in construction-time is wrapped in a 1:1 Token/ETH pair
#### What
- To wrapp a token is to create an ERC-20 representation of the token

## Vault
#### Why
- To hold investors' money and generate yields by investing it in various strategies
#### How
- Storage: The vault stores state variables like totalSupply (total shares minted) and balanceOf (shares balance by address)
- Operations: It allows deposit of any asset, including the same ERC-20 token received as the constructor parameter, which the vault's assets reference (e.g. Ether-Token, DAI-DAI, Ether-Ether)
#### What
- Shares are similar to stocks in traditional markets, representing ownership in the vault's total assets (token received as constructor parameter)
- Value: The value of each share fluctuates over time, based on internal vault operations (making use of deposited amount) or relative external ones
#### Usage
- Yield Farming, Liquidity Provision, Staking, Arbitrage, Asset Management 

## Automated Market Makers
- DEXs that operate based on smart contracts where 1.given *amount of tokens* are deposited/withdrawed into/from the liquidity pool, 2.*shares (liquidity pool tokens)* of these tokens are minted/burned and 3.the relationship between the *quantities of tokens in the pool* and *their price* follows a determined equation
- The price of the token depends on its existing quantity on the pool, so the choice of tokens quantity relation should be based on token's nature and price volatility goal
- The equation name the AMM and defines the relation between the tokens and the consequent price of each one in function of operations made (deposits, withdraws or swaps)

## Constant Sum Automated Market Maker
#### Why
- To provide predictable and stable pricing for tokens in the pool
#### How
- Operates based on a Constant Sum (k=x+y), total value of tokens in the pool remains constant
#### What
- A decentralized exchange model where the sum of the quantities of two tokens in the pool remains constant, facilitating stable and predictable trades.
#### Usage
- Stablecoins or low-volatility asset exchanges

## Constant Product Automated Market Maker
#### Why
- To provide dynamic pricing that reflects the supply and demand for tokens in the pool
#### How
- Operates based on a Constant Product formula (k=x*y), total value of tokens in the pool remains constant
#### What
- A decentralized exchange model where the product of the quantities of two tokens in the pool remains constant, maintaining liquidity and fair prices
#### Usage
- Uniswap V2 and volatile assets

## StableSwap AMMs 
#### Why
- To provide stable and low-slippage trading for stablecoin pairs
#### How
- Operates based on a StableSwap algorithm, which adjusts the weights of tokens in the pool to maintain stability
#### What
- A decentralized exchange model designed specifically for trading stablecoins, where the weights of the stablecoins are adjusted to minimize price slippage
#### Usage
- Curve

## Customized AMM
#### Why
- To provide customized liquidity provision and price range control for specific token pairs
#### How
- Operates based on Uniswap V3's Concentrated Liquidity feature, allowing liquidity providers to specify price ranges (tick ranges) where their capital is allocated
#### What
- A decentralized exchange model designed to optimize capital efficiency and reduce impermanent loss by concentrating liquidity within specific price ranges
#### Usage
- Uniswap V3