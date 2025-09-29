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
- **Batch Operations**: Enable storing
