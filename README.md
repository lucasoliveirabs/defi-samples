# defi-samples

### Dutch Auction
- Contract that manages an auction where the seller begins with a high asking price and lowers it incrementally until a participant accepts the price or the minimum price is reached

### English Auction
- Contract that manages an auction where the seller begins with a low asking price and increases it incrementally until a participant accepts the price

### WETH
- Contract that manages operations between received Ether and a specified token. This token is created using contract's constructor()
- The goal is to **abstract the relation between Ether and any token**
- This relationship ether-token can be direct or indirect, possibly intermediated by a dynamic fee for example

### Vault
- Contract that manages operations between an existing token and its shares, which is owned by token holders. This token is already created and it's passed as parameter to contract's constructor() and will be interacted with through an interface
- The goal is to **securely hold token holders' deposits** while, in the context of DeFI, to **generate shares proportionally to the deposit amount**
- The functions responsible for yield generation operations, whether positive (profit) or negative (loss), should be included in the Vault contract (e.g., staking, lending, yield farming)