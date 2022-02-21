//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Artwork is ERC721 {
   
   uint256 public tokenCounter;
   mapping (uint256 => string) _tokenURIs;

   
   constructor(string memory name, string memory symbol) ERC721(name, symbol) {
      tokenCounter = 0;
   }

    modifier existing(uint256 _tokenId) {
       require(_exists(_tokenId),
        "ERC721Metadata: URI set of nonexistent token"
       );
       _;
    }

   function mint(string memory _tokenURI) public {
      _safeMint(msg.sender, tokenCounter);
      _setTokenURI(tokenCounter, _tokenURI);

      tokenCounter++;
   }

   function _setTokenURI(uint256 _tokenId, string memory _tokenURI) internal virtual existing(_tokenId) {
      _tokenURIs[_tokenId] = _tokenURI;
   }

   function tokenURI(uint256 _tokenId) public view virtual override existing(_tokenId) returns (string memory) {
      return _tokenURIs[_tokenId];
   }

}
