#!/bin/bash

cd /opt/gopath/src/chain

peer lifecycle chaincode package basic.tar.gz --path ./agri-cc/ --lang node --label basic_1.0

export ORDERER_CA=/opt/gopath/fabric-samples/agri-network/crypto-config/ordererOrganizations/agri-network.com/orderers/orderer.agri-network.com/msp/tlscacerts/tlsca.agri-network.com-cert.pem

CORE_PEER_LOCALMSPID=SupplierMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/users/Admin@supplier.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.supplier.agri-network.com:7051
CORE_PEER_TLS_ENABLED=true

peer lifecycle chaincode install /opt/gopath/src/chain/basic.tar.gz

CORE_PEER_LOCALMSPID=ProducerMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/peers/peer0.producer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/users/Admin@producer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.producer.agri-network.com:7051

peer lifecycle chaincode install /opt/gopath/src/chain/basic.tar.gz

CORE_PEER_LOCALMSPID=DelivererMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/peers/peer0.deliverer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/users/Admin@deliverer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.deliverer.agri-network.com:7051

peer lifecycle chaincode install /opt/gopath/src/chain/basic.tar.gz

CORE_PEER_LOCALMSPID=RetailerMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/peers/peer0.retailer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/users/Admin@retailer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.retailer.agri-network.com:7051

peer lifecycle chaincode install /opt/gopath/src/chain/basic.tar.gz

CC_PACKAGE_ID=basic_1.0:c272b035ed5c95228fede6bca14f85bf84e7abe58d012b9435f9281dd9ab853f

##########################################################################################

CORE_PEER_LOCALMSPID=SupplierMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/users/Admin@supplier.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.supplier.agri-network.com:7051
CORE_PEER_TLS_ENABLED=true

peer lifecycle chaincode approveformyorg -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA --channelID channeldemo --name basic --version 1 --init-required --package-id $CC_PACKAGE_ID --sequence 1 --signature-policy "OR('SupplierMSP.peer', 'ProducerMSP.peer', 'DelivererMSP.peer', 'RetailerMSP.peer')"

CORE_PEER_LOCALMSPID=ProducerMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/peers/peer0.producer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/users/Admin@producer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.producer.agri-network.com:7051

peer lifecycle chaincode approveformyorg -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA --channelID channeldemo --name basic --version 1 --init-required --package-id $CC_PACKAGE_ID --sequence 1 --signature-policy "OR('SupplierMSP.peer', 'ProducerMSP.peer', 'DelivererMSP.peer', 'RetailerMSP.peer')"

CORE_PEER_LOCALMSPID=DelivererMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/peers/peer0.deliverer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/users/Admin@deliverer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.deliverer.agri-network.com:7051

peer lifecycle chaincode approveformyorg -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA --channelID channeldemo --name basic --version 1 --init-required --package-id $CC_PACKAGE_ID --sequence 1 --signature-policy "OR('SupplierMSP.peer', 'ProducerMSP.peer', 'DelivererMSP.peer', 'RetailerMSP.peer')"

CORE_PEER_LOCALMSPID=RetailerMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/peers/peer0.retailer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/users/Admin@retailer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.retailer.agri-network.com:7051

peer lifecycle chaincode approveformyorg -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA --channelID channeldemo --name basic --version 1 --init-required --package-id $CC_PACKAGE_ID --sequence 1 --signature-policy "OR('SupplierMSP.peer', 'ProducerMSP.peer', 'DelivererMSP.peer', 'RetailerMSP.peer')"

peer lifecycle chaincode checkcommitreadiness --channelID channeldemo --name basic --version 1 --sequence 1 --output json --init-required --signature-policy "OR('SupplierMSP.peer', 'ProducerMSP.peer', 'DelivererMSP.peer', 'RetailerMSP.peer')"

PEER_SUPPLIER_TLSROOTCERTFILES=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt

PEER_PRODUCER_TLSROOTCERTFILES=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/peers/peer0.producer.agri-network.com/tls/ca.crt

PEER_DELIVERER_TLSROOTCERTFILES=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/peers/peer0.deliverer.agri-network.com/tls/ca.crt

PEER_RETAILER_TLSROOTCERTFILES=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/peers/peer0.retailer.agri-network.com/tls/ca.crt

peer lifecycle chaincode commit -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA --channelID channeldemo --name basic --peerAddresses peer0.supplier.agri-network.com:7051 --tlsRootCertFiles $PEER_SUPPLIER_TLSROOTCERTFILES --peerAddresses peer0.producer.agri-network.com:7051 --tlsRootCertFiles $PEER_PRODUCER_TLSROOTCERTFILES --peerAddresses peer0.deliverer.agri-network.com:7051 --tlsRootCertFiles $PEER_DELIVERER_TLSROOTCERTFILES --peerAddresses peer0.retailer.agri-network.com:7051 --tlsRootCertFiles $PEER_RETAILER_TLSROOTCERTFILES --version 1 --sequence 1 --init-required --signature-policy "OR('SupplierMSP.peer', 'ProducerMSP.peer', 'DelivererMSP.peer', 'RetailerMSP.peer')"

peer lifecycle chaincode querycommitted --channelID channeldemo --name basic

peer chaincode invoke -o orderer.agri-network.com:7050 --tls true --cafile $ORDERER_CA -C channeldemo -n basic --peerAddresses peer0.supplier.agri-network.com:7051 --tlsRootCertFiles $PEER_SUPPLIER_TLSROOTCERTFILES --peerAddresses peer0.producer.agri-network.com:7051 --tlsRootCertFiles $PEER_PRODUCER_TLSROOTCERTFILES --peerAddresses peer0.deliverer.agri-network.com:7051 --tlsRootCertFiles $PEER_DELIVERER_TLSROOTCERTFILES --peerAddresses peer0.retailer.agri-network.com:7051 --tlsRootCertFiles $PEER_RETAILER_TLSROOTCERTFILES --isInit -c '{"function":"InitLedger","Args":[]}'


echo "---> Chaincode deoployed !"









