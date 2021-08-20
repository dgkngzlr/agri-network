PEER_SUPPLIER_TLSROOTCERTFILES=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt

PEER_PRODUCER_TLSROOTCERTFILES=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/peers/peer0.producer.agri-network.com/tls/ca.crt

PEER_DELIVERER_TLSROOTCERTFILES=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/peers/peer0.deliverer.agri-network.com/tls/ca.crt

PEER_RETAILER_TLSROOTCERTFILES=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/peers/peer0.retailer.agri-network.com/tls/ca.crt

export ORDERER_CA=/opt/gopath/fabric-samples/agri-network/crypto-config/ordererOrganizations/agri-network.com/orderers/orderer.agri-network.com/msp/tlscacerts/tlsca.agri-network.com-cert.pem

CORE_PEER_LOCALMSPID=SupplierMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/users/Admin@supplier.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.supplier.agri-network.com:7051
CORE_PEER_TLS_ENABLED=true
echo "###############################################################"
echo "###########################Transferred#########################"
echo "###############################################################"
echo "---> ASSET_ID: Onion1 transferred From: Supplier1 To: Producer1"
peer chaincode invoke -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA -C channeldemo -n basic --peerAddresses peer0.supplier.agri-network.com:7051 --tlsRootCertFiles $PEER_SUPPLIER_TLSROOTCERTFILES --peerAddresses peer0.producer.agri-network.com:7051 --tlsRootCertFiles $PEER_PRODUCER_TLSROOTCERTFILES --peerAddresses peer0.deliverer.agri-network.com:7051 --tlsRootCertFiles $PEER_DELIVERER_TLSROOTCERTFILES --peerAddresses peer0.retailer.agri-network.com:7051 --tlsRootCertFiles $PEER_RETAILER_TLSROOTCERTFILES -c '{"function":"TransferToProducer","Args":["Onion1"]}'
echo "---> Query result :"
peer chaincode invoke -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA -C channeldemo -n basic --peerAddresses peer0.supplier.agri-network.com:7051 --tlsRootCertFiles $PEER_SUPPLIER_TLSROOTCERTFILES --peerAddresses peer0.producer.agri-network.com:7051 --tlsRootCertFiles $PEER_PRODUCER_TLSROOTCERTFILES --peerAddresses peer0.deliverer.agri-network.com:7051 --tlsRootCertFiles $PEER_DELIVERER_TLSROOTCERTFILES --peerAddresses peer0.retailer.agri-network.com:7051 --tlsRootCertFiles $PEER_RETAILER_TLSROOTCERTFILES -c '{"function":"ReadAsset","Args":["Onion1"]}'
sleep 5
echo "###############################################################"
echo "###########################Transferred#########################"
echo "###############################################################"
echo "---> ASSET_ID: Onion1 transferred From: Producer1 To: Deliverer1"
peer chaincode invoke -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA -C channeldemo -n basic --peerAddresses peer0.supplier.agri-network.com:7051 --tlsRootCertFiles $PEER_SUPPLIER_TLSROOTCERTFILES --peerAddresses peer0.producer.agri-network.com:7051 --tlsRootCertFiles $PEER_PRODUCER_TLSROOTCERTFILES --peerAddresses peer0.deliverer.agri-network.com:7051 --tlsRootCertFiles $PEER_DELIVERER_TLSROOTCERTFILES --peerAddresses peer0.retailer.agri-network.com:7051 --tlsRootCertFiles $PEER_RETAILER_TLSROOTCERTFILES -c '{"function":"TransferToDeliverer","Args":["Onion1"]}'
echo "---> Query result :"
peer chaincode invoke -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA -C channeldemo -n basic --peerAddresses peer0.supplier.agri-network.com:7051 --tlsRootCertFiles $PEER_SUPPLIER_TLSROOTCERTFILES --peerAddresses peer0.producer.agri-network.com:7051 --tlsRootCertFiles $PEER_PRODUCER_TLSROOTCERTFILES --peerAddresses peer0.deliverer.agri-network.com:7051 --tlsRootCertFiles $PEER_DELIVERER_TLSROOTCERTFILES --peerAddresses peer0.retailer.agri-network.com:7051 --tlsRootCertFiles $PEER_RETAILER_TLSROOTCERTFILES -c '{"function":"ReadAsset","Args":["Onion1"]}'
sleep 5
echo "###############################################################"
echo "###########################Transferred#########################"
echo "###############################################################"
echo "---> ASSET_ID: Onion1 transferred From: Deliverer1 To: Retailer"
peer chaincode invoke -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA -C channeldemo -n basic --peerAddresses peer0.supplier.agri-network.com:7051 --tlsRootCertFiles $PEER_SUPPLIER_TLSROOTCERTFILES --peerAddresses peer0.producer.agri-network.com:7051 --tlsRootCertFiles $PEER_PRODUCER_TLSROOTCERTFILES --peerAddresses peer0.deliverer.agri-network.com:7051 --tlsRootCertFiles $PEER_DELIVERER_TLSROOTCERTFILES --peerAddresses peer0.retailer.agri-network.com:7051 --tlsRootCertFiles $PEER_RETAILER_TLSROOTCERTFILES -c '{"function":"TransferToRetailer","Args":["Onion1"]}'
echo "---> Query result :"
peer chaincode invoke -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA -C channeldemo -n basic --peerAddresses peer0.supplier.agri-network.com:7051 --tlsRootCertFiles $PEER_SUPPLIER_TLSROOTCERTFILES --peerAddresses peer0.producer.agri-network.com:7051 --tlsRootCertFiles $PEER_PRODUCER_TLSROOTCERTFILES --peerAddresses peer0.deliverer.agri-network.com:7051 --tlsRootCertFiles $PEER_DELIVERER_TLSROOTCERTFILES --peerAddresses peer0.retailer.agri-network.com:7051 --tlsRootCertFiles $PEER_RETAILER_TLSROOTCERTFILES -c '{"function":"ReadAsset","Args":["Onion1"]}'
sleep 2
