# StoreBlock

## Project Description

StoreBlock is a decentralized storage management smart contract built on the Ethereum blockchain. It provides a secure, transparent, and immutable way to store and manage data hashes on-chain. Users can store data references (such as IPFS hashes or SHA256 checksums), retrieve them when needed, and maintain full ownership control over their stored information.

The contract acts as a decentralized registry that maps data hashes to their owners, creating an auditable trail of data storage activities while keeping the actual data off-chain for efficiency.

## Project Vision

Our vision is to create a trustless and decentralized data management ecosystem where:

- **Users maintain full ownership** of their data references without relying on centralized authorities
- **Data integrity** is guaranteed through blockchain immutability
- **Transparency** in data storage and access is achieved through on-chain records
- **Interoperability** with decentralized storage solutions like IPFS, Arweave, and Filecoin
- **Privacy and Control** where users can deactivate their data references at any time

StoreBlock aims to be the foundational layer for decentralized applications that require verifiable data storage proof and ownership tracking.

## Key Features

### 1. **Decentralized Data Storage**
- Store data hashes (IPFS CIDs, SHA256, etc.) permanently on the blockchain
- Each stored item receives a unique block ID for easy reference
- Automatic timestamping of all storage operations

### 2. **Ownership Management**
- Only data owners can deactivate their stored blocks
- Track all blocks owned by a specific address
- Complete ownership history preserved on-chain

### 3. **Data Retrieval**
- Retrieve data hash, owner, timestamp, and status using block ID
- Query all blocks owned by any address
- Event emissions for tracking retrieval activities

### 4. **Access Control**
- Owner-only deactivation functionality
- Public read access for transparency
- Validation checks to prevent invalid operations

### 5. **Event Logging**
- `DataStored` event for new data registrations
- `DataRetrieved` event for access tracking
- `DataDeactivated` event for monitoring deletions

## Future Scope

### Short-term Enhancements
- **Access Permissions**: Implement granular access control where owners can grant read permissions to specific addresses
- **Data Categories**: Add tagging and categorization for better data organization
- **Batch Operations**: Enable storing and retrieving multiple data blocks in a single transaction

### Mid-term Development
- **Storage Marketplace**: Create a marketplace where users can monetize their stored data
- **Encryption Layer**: Integrate with encryption protocols for private data storage
- **Data Verification**: Add cryptographic proof verification for stored hashes
- **Cross-chain Bridge**: Enable StoreBlock to operate across multiple blockchain networks

### Long-term Vision
- **Decentralized CDN**: Build a content delivery network using StoreBlock as the registry
- **AI Integration**: Use stored data for training decentralized AI models with provenance tracking
- **DAO Governance**: Transition to community governance for protocol upgrades
- **Storage Provider Integration**: Direct integration with major decentralized storage providers
- **Data Recovery Protocol**: Implement mechanisms for data recovery and backup verification

### Technical Improvements
- **Gas Optimization**: Implement storage patterns to reduce transaction costs
- **Upgradability**: Add proxy pattern for contract upgrades while preserving data
- **Layer 2 Integration**: Deploy on L2 solutions for faster and cheaper transactions
- **GraphQL API**: Develop indexing services for easier data querying

---

## Installation & Deployment

### Prerequisites
- Node.js v14+ and npm
- Hardhat or Truffle framework
- MetaMask or similar Web3 wallet

### Setup
```bash
npm install
npx hardhat compile
npx hardhat test
npx hardhat deploy --network <network-name>
```

### Usage Example
```javascript
// Store data
const tx = await storeBlock.storeData("QmYourIPFSHash...");
const receipt = await tx.wait();

// Retrieve data
const [dataHash, owner, timestamp, isActive] = await storeBlock.retrieveData(1);

// Deactivate data (owner only)
await storeBlock.deactivateData(1);
```

## License
MIT License

## Contributing
Contributions are welcome! Please open an issue or submit a pull request.

## Contact
For questions and support, please open an issue in the repository.
