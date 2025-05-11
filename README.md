## BundleBear 🐻✨

BundleBear is a dataset that tracks the adoption of smart accounts.

The SQL queries in this [dbt](https://docs.getdbt.com/docs/introduction) project run once a day to transform raw and decoded blockchain data into easy-to-interpret records of every smart account transaction.

### How to contribute to the Operator Registry:

The Operator Registry stores labels for the addresses of ERC-4337 and EIP-7702 operators (bundlers, paymasters, factories, apps and authorized contracts). 

To add a label you have to make a pull request to this repo. Once your label is in the dataset, the BundleBear team will update the BundleBear [dashboard](https://www.bundlebear.com/overview/all) so that your app or infrastructure provider is properly represented there.

1. Fork the BundleBear repo (button towards the top right of the repo page).

2. Start a new branch in your forked repo.

3. Edit the appropriate label query in the [BundleBear/models/erc4337/labels](https://github.com/Jam516/BundleBear/tree/main/models/erc4337/labels) or [BundleBear/models/eip4337/labels](https://github.com/Jam516/BundleBear/tree/main/models/eip7702/labels) folder. The queries are as follows

    - [BundleBear/models/erc4337/labels/erc4337_labels_apps.sql](https://github.com/Jam516/BundleBear/blob/main/models/erc4337/labels/erc4337_labels_apps.sql) = Edit this to label a new app contract
    - [BundleBear/models/erc4337/labels/erc4337_labels_bundlers.sql](https://github.com/Jam516/BundleBear/blob/main/models/erc4337/labels/erc4337_labels_bundlers.sql) = Edit this to label a new bundler EOA
    - [BundleBear/models/erc4337/labels/erc4337_labels_factories.sql](https://github.com/Jam516/BundleBear/blob/main/models/erc4337/labels/erc4337_labels_factories.sql) = Edit this to label a new factory contract
    - [BundleBear/models/erc4337/labels/erc4337_labels_paymasters.sql](https://github.com/Jam516/BundleBear/blob/main/models/erc4337/labels/erc4337_labels_paymasters.sql) = Edit this to label a new paymaster contract
    - [BundleBear/models/eip7702/labels/eip7702_labels_authorized_contracts.sql](https://github.com/Jam516/BundleBear/blob/main/models/eip7702/labels/eip7702_labels_authorized_contracts.sql) = Edit this to label a new EIP-7702 authorized contract

    #### Note: All addresses need to be in lowercase!!

4. Make a Pull Request on your new branch, to the main BundleBear repo, with a brief explanation of what you changed.

5. Wait for someone to either comment on or merge your Pull Request. 

6. Once your PR has been merged, please give 24 hours for the front-end team to make any needed changes on the BundleBear dashboard site.

### Sponsors:

If you find BundleBear useful or use it for work, please consider sponsoring BundleBear. Thank you 🙏

<p>
  <a href="https://ethereum.org/en/foundation">
    <picture>
      <img alt="ethereum foundation logo" src="https://github.com/Jam516/bundlebear-app/blob/main/public/ethereum-foundation-logo.png" width="auto" height="70">
    </picture>
  </a>
</p>

<p>
  <a href="https://www.pimlico.io">
    <picture>
      <img alt="pimlico logo" src="https://github.com/Jam516/bundlebear-app/blob/main/public/pimlico-logo.png" width="auto" height="50">
    </picture>
  </a>
</p>
<p>
  <a href="https://www.biconomy.io">
    <picture>
      <img alt="biconomy logo" src="https://github.com/Jam516/bundlebear-app/blob/main/public/biconomy-logo.png" width="auto" height="50">
    </picture>
  </a>
</p>

### Resources:
- Read the [4337 proposal](https://eips.ethereum.org/EIPS/eip-4337)
- Learn more about [4337 data analysis](https://read.cryptodatabytes.com/p/web3-sql-weekly-8-analyzing-account)
- Read the [7702 proposal](https://eips.ethereum.org/EIPS/eip-7702)
