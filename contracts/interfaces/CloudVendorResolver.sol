pragma solidity ^0.4.24;

/**
 * Allow the Cloud Vendor (Blockchain Cloud Provider) to manage its end-users
 * for DApps hosted externally to their premises.
 */
interface CloudVendorResolver is ERC165 {
    bytes4 constant INTERFACE_SIGNATURE_USER_ATOKEN = // 0x3e4431bb
        bytes4(keccak256("accessToken(address,bytes32,bytes32)"));
    bytes4 constant INTERFACE_SIGNATURE_SERVICE_ENDPOINT = // 0xb325c9a6
        bytes4(keccak256("endpoint(address,bytes32,bytes32)"));

    // Resolves the access token for a user. The user must already be signed-up to the provider,
    // So the provider should have deployed an access token in the network. The returned Value is
    // an instance of the AccessToken interface. eg
    // 
    // ```
    // bytes32 node = keccak256("ens.domains");
    // bytes32 service = keccak256("domain_manage"); 
    // 
    // AccessToken atoken = AccessToken(CloudProvider.accessToken(userAddr, node, service));
    // ```
    function accessToken(address user, bytes32 node, bytes32 service) external view returns (address);

    // Resolves the endpoint information (string-serilised) that the client needs to know, 
    // in order to connect to the given service for a given user.
    // 
    // Cloud Proviers can provide "Premium" type APIs to premium subscribers using this pattern,
    // without the DApp developers being aware of the end-user's subscription.
    function endpoint(address user, bytes32 node, bytes32 service) external view returns (string);
}

