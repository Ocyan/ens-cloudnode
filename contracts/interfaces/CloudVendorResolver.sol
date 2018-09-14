pragma solidity ^0.4.24;

/**
 * Allow the Cloud Vendor (Blockchain Cloud Provider) to manage its end-users
 * for DApps hosted externally to their premises.
 */
interface CloudVendorResolver is ERC165 {
    bytes4 constant INTERFACE_SIGNATURE_USER_ATOKEN = // 0x2191acd5
        bytes4(keccak256("cloudSupplier(bytes32)"));


    function recoverAccessToken(address user, bytes32 node, bytes32 service) external view returns (address);
    function endpoint(address user, bytes32 node, bytes32 service) external view returns (string);
    function authMethod(address user, bytes32 node, bytes32 service) external view returns (string);
    function supports(address user, bytes32 node, bytes32 service) external view returns (bool);
}

