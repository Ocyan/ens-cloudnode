pragma solidity ^0.4.24;


interface ERC165 {
    bytes4 constant INTERFACE_SIGNATURE_ERC165 = // 0x01ffc9a7
        bytes4(keccak256("supportsInterface(bytes4)"));

    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}
