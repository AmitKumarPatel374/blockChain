// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title StoreBlock
 * @dev A decentralized storage management system for storing and retrieving data on blockchain
 */
contract StoreBlock {
    
    struct DataBlock {
        string dataHash;
        address owner;
        uint256 timestamp;
        bool isActive;
    }
    
    mapping(uint256 => DataBlock) public dataBlocks;
    mapping(address => uint256[]) public userBlocks;
    uint256 public blockCounter;
    
    event DataStored(uint256 indexed blockId, address indexed owner, string dataHash, uint256 timestamp);
    event DataRetrieved(uint256 indexed blockId, address indexed requester);
    event DataDeactivated(uint256 indexed blockId, address indexed owner);
    
    /**
     * @dev Store data hash on the blockchain
     * @param _dataHash The hash of the data to be stored (IPFS hash, SHA256, etc.)
     * @return blockId The unique identifier for the stored data
     */
    function storeData(string memory _dataHash) public returns (uint256) {
        require(bytes(_dataHash).length > 0, "Data hash cannot be empty");
        
        blockCounter++;
        uint256 newBlockId = blockCounter;
        
        dataBlocks[newBlockId] = DataBlock({
            dataHash: _dataHash,
            owner: msg.sender,
            timestamp: block.timestamp,
            isActive: true
        });
        
        userBlocks[msg.sender].push(newBlockId);
        
        emit DataStored(newBlockId, msg.sender, _dataHash, block.timestamp);
        
        return newBlockId;
    }
    
    /**
     * @dev Retrieve data information by block ID
     * @param _blockId The unique identifier of the data block
     * @return dataHash The stored data hash
     * @return owner The address of the data owner
     * @return timestamp When the data was stored
     * @return isActive Whether the data is still active
     */
    function retrieveData(uint256 _blockId) public returns (string memory, address, uint256, bool) {
        require(_blockId > 0 && _blockId <= blockCounter, "Invalid block ID");
        require(dataBlocks[_blockId].isActive, "Data block is not active");
        
        DataBlock memory block = dataBlocks[_blockId];
        
        emit DataRetrieved(_blockId, msg.sender);
        
        return (block.dataHash, block.owner, block.timestamp, block.isActive);
    }
    
    /**
     * @dev Deactivate a data block (only owner can deactivate)
     * @param _blockId The unique identifier of the data block to deactivate
     */
    function deactivateData(uint256 _blockId) public {
        require(_blockId > 0 && _blockId <= blockCounter, "Invalid block ID");
        require(dataBlocks[_blockId].owner == msg.sender, "Only owner can deactivate");
        require(dataBlocks[_blockId].isActive, "Data block is already inactive");
        
        dataBlocks[_blockId].isActive = false;
        
        emit DataDeactivated(_blockId, msg.sender);
    }
    
    /**
     * @dev Get all block IDs owned by a specific address
     * @param _owner The address to query
     * @return Array of block IDs owned by the address
     */
    function getUserBlocks(address _owner) public view returns (uint256[] memory) {
        return userBlocks[_owner];
    }
    
    /**
     * @dev Get total number of stored blocks
     * @return Total count of data blocks
     */
    function getTotalBlocks() public view returns (uint256) {
        return blockCounter;
    }
}
