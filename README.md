# defi-samples

## Dutch Auction
- Contract that manages an auction where the seller begins with a high asking price and lowers it incrementally until a participant accepts the price or the minimum price is reached

## English Auction
- Contract that manages an auction where the seller begins with a low asking price and increases it incrementally until a participant accepts the price

## WETH
#### Why
- WETH is a standard created to encapsulate Ether (ETH) and make it compatible with the ERC-20 standard, allowing ETH to be tradable in ERC-20-based decentralized applications (dApps)
#### How
- The ERC-20 created in construction-time is wrapped in a 1:1 Token/ETH pair
#### What
- To wrapp a token is to create an ERC-20 representation of the token
- The wrapp standard can naturally be applied to any not-ERC-20 token we want to translate to ERC-20. Once every Ethereum address may receive and transfer ETH, to WETH it is valid if we want to set it as ERC-20-like

## Vault
#### Why
- To hold investors' money and generate yields by investing it in various strategies
#### How
- Storage: The vault stores state variables like totalSupply (total shares minted) and balanceOf (shares balance by address)
- Operations: It allows deposit of any asset, including the same ERC-20 token received as the constructor parameter, which the vault's assets reference (e.g. Ether-Token, DAI-DAI, Ether-Ether)
#### What
- Shares are similar to stocks in traditional markets, representing ownership in the vault's total assets (token received as constructor parameter)
- Value: The value of each share fluctuates over time, based on internal vault operations (making use of deposited amount) or relative external ones