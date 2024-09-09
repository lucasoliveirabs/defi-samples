# defi-samples

## Dutch Auction
- Contract that manages an auction where the seller begins with a high asking price and lowers it incrementally until a participant accepts the price or the minimum price is reached
- ICOs (fundraising)
<br/>

### English Auction
- Contract that manages an auction where the seller begins with a low asking price and increases it incrementally until a participant accepts the price
- Traditional auction operations (art, colletibles and tangible assets)
<br/>

## WETH
- WETH is a standard created to encapsulate Ether (ETH) and make it compatible with the ERC-20 standard, allowing ETH to be tradable in ERC-20-based dApps or blockchains
- WETH has this name because of ETH ERC-20 encapsulation case but at the end it serves any case of not-ERC-20 token we want to encapsulate into ERC-20. Once every Ethereum address may receive and transfer ETH, to encapsulate the token to ERC-20 only make sense if needed
- The ERC-20 created in construction-time is wrapped in a 1:1 Token/ETH pair
- To wrapp a token is to create an ERC-20 representation of the token
<br/>

## Vault
- To hold investors' money and generate yields by investing it in various strategies
- Storage: The vault stores state variables like totalSupply (total shares minted) and balanceOf (shares balance by address)
- Operations: It allows deposit of any asset, including the same ERC-20 token received as the constructor parameter, which the vault's assets reference (e.g. Ether-Token, DAI-DAI, Ether-Ether)
- Shares are similar to stocks in traditional markets, representing ownership in the vault's total assets (token received as constructor parameter)
- Value: The value of each share fluctuates over time, based on internal vault operations (making use of deposited amount) or relative external ones
- Yield Farming, Liquidity Provision, Staking, Arbitrage, Asset Management 
<br/>

## Automated Market Makers
- DEXs that operate based on smart contracts where 1.given *amount of tokens* are deposited/withdrawed into/from the liquidity pool, 2.*shares (liquidity pool tokens)* of these tokens are minted/burned and 3.the relationship between the *quantities of tokens in the pool* and *their price* follows a determined equation
- The price of the token depends on its existing quantity on the pool, so the choice of tokens quantity relation should be based on token's nature and price volatility goal
- The equation name the AMM and defines the relation between the tokens and the consequent price of each one in function of operations made (deposits, withdraws or swaps)
<br/>

## Constant Sum Automated Market Maker
- To provide predictable and stable pricing for tokens in the pool
- Operates based on a Constant Sum (k=x+y), total value of tokens in the pool remains constant
- A decentralized exchange model where the sum of the quantities of two tokens in the pool remains constant, facilitating stable and predictable trades.
- Stablecoins or low-volatility asset exchanges
<br/>

## Constant Product Automated Market Maker
- To provide dynamic pricing that reflects the supply and demand for tokens in the pool
- Operates based on a Constant Product formula (k=x*y), total value of tokens in the pool remains constant
- A decentralized exchange model where the product of the quantities of two tokens in the pool remains constant, maintaining liquidity and fair prices
- Uniswap V2 and volatile assets
<br/>

## StableSwap AMMs 
- To provide stable and low-slippage trading for stablecoin pairs
- Operates based on a StableSwap algorithm, which adjusts the weights of tokens in the pool to maintain stability
- A decentralized exchange model designed specifically for trading stablecoins, where the weights of the stablecoins are adjusted to minimize price slippage
- Curve
<br/>

## Customized AMM
- To provide customized liquidity provision and price range control for specific token pairs
- Operates based on Uniswap V3's Concentrated Liquidity feature, allowing liquidity providers to specify price ranges (tick ranges) where their capital is allocated
- A decentralized exchange model designed to optimize capital efficiency and reduce impermanent loss by concentrating liquidity within specific price ranges
- Uniswap V3
<br/>
