/*
 * Copyright IBM Corp. All Rights Reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

'use strict';

const { Contract } = require('fabric-contract-api');

function getTimestamp() {
    let date_ob = new Date();

    // current date
    // adjust 0 before single digit date
    let date = ("0" + date_ob.getDate()).slice(-2);

    // current month
    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);

    // current year
    let year = date_ob.getFullYear();

    // current hours
    let hours = date_ob.getHours();

    // current minutes
    let minutes = date_ob.getMinutes();

    // current seconds
    let seconds = date_ob.getSeconds();

    // prints date & time in YYYY-MM-DD HH:MM:SS format
    return (year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds);
}
class AssetTransfer extends Contract {
    
    async InitLedger(ctx) {
        const assets = [
            {
                ID: 'Onion1',
                Owner: 'Supplier1',
                AssetStatus: 'Seed',
                Amount: '10kg',
                SalePrice: '10TL',
                TimeStamp: getTimestamp(),
            },
            {
                ID: 'Lettuce1',
                Owner: 'Supplier1',
                AssetStatus: 'Seed',
                Amount: '8kg',
                SalePrice: '5TL',
                TimeStamp: getTimestamp(),
            },
            {
                ID: 'Potatoes1',
                Owner: 'Supplier1',
                AssetStatus: 'Seed',
                Amount: '8kg',
                SalePrice: '12TL',
                TimeStamp: getTimestamp(),
            },
        ];

        for (const asset of assets) {
            asset.docType = 'asset';
            await ctx.stub.putState(asset.ID, Buffer.from(JSON.stringify(asset)));
            console.info(`Asset ${asset.ID} initialized`);
        }
    }

    // CreateAsset issues a new asset to the world state with given details.
    async CreateAsset(ctx, id, owner, status, amount, salePrice) {
        const asset = {
            ID: id,
            Owner: owner,
            AssetStatus: status,
            Amount: amount,
            SalePrice: salePrice,
            TimeStamp: getTimestamp(),
        };
        ctx.stub.putState(id, Buffer.from(JSON.stringify(asset)));
        return JSON.stringify(asset);
    }

    // ReadAsset returns the asset stored in the world state with given id.
    async ReadAsset(ctx, id) {
        const assetJSON = await ctx.stub.getState(id); // get the asset from chaincode state
        if (!assetJSON || assetJSON.length === 0) {
            throw new Error(`The asset ${id} does not exist`);
        }
        return assetJSON.toString();
    }

    // UpdateAsset updates an existing asset in the world state with provided parameters.
    async UpdateAsset(ctx, id, owner, status, amount, salePrice) {
        const exists = await this.AssetExists(ctx, id);
        if (!exists) {
            throw new Error(`The asset ${id} does not exist`);
        }

        // overwriting original asset with new asset
        const updatedAsset = {
            ID: id,
            Owner: owner,
            AssetStatus: status,
            Amount: amount,
            SalePrice: salePrice,
            TimeStamp: getTimestamp(),
        };
        return ctx.stub.putState(id, Buffer.from(JSON.stringify(updatedAsset)));
    }

    // DeleteAsset deletes an given asset from the world state.
    async DeleteAsset(ctx, id) {
        const exists = await this.AssetExists(ctx, id);
        if (!exists) {
            throw new Error(`The asset ${id} does not exist`);
        }
        return ctx.stub.deleteState(id);
    }

    // AssetExists returns true when asset with given ID exists in world state.
    async AssetExists(ctx, id) {
        const assetJSON = await ctx.stub.getState(id);
        return assetJSON && assetJSON.length > 0;
    }

    // TransferAsset updates the owner field of asset with given id in the world state.
    async TransferAsset(ctx, id, newOwner) {
        const assetString = await this.ReadAsset(ctx, id);
        const asset = JSON.parse(assetString);
        console.info("[OK] Asset transfered ! From : " + asset.Owner + " To :" + newOwner);
        asset.Owner = newOwner;
        asset.TimeStamp = getTimestamp();
        return ctx.stub.putState(id, Buffer.from(JSON.stringify(asset)));
    }

    async TransferToProducer(ctx, id){
        const assetString = await this.ReadAsset(ctx, id);
        const asset = JSON.parse(assetString);

        if (asset.Owner == "Supplier1"){
            console.info("[OK] Asset transfered ! From : " + asset.Owner + " To :" + "Producer1");
            asset.Owner = "Producer1";
            asset.AssetStatus = "Planting";
            asset.Amount = "5kg";
            asset.SalePrice = "15TL";
            asset.TimeStamp = getTimestamp();

            return ctx.stub.putState(id, Buffer.from(JSON.stringify(asset)));
        }
    }

    async TransferToDeliverer(ctx, id){
        const assetString = await this.ReadAsset(ctx, id);
        const asset = JSON.parse(assetString);

        if (asset.Owner == "Producer1"){
            console.info("[OK] Asset transfered ! From : " + asset.Owner + " To :" + "Deliverer1");
            asset.Owner = "Deliverer1";
            asset.AssetStatus = "Delivering";
            asset.Amount = "5kg";
            asset.SalePrice = "20TL";
            asset.TimeStamp = getTimestamp();

            return ctx.stub.putState(id, Buffer.from(JSON.stringify(asset)));
        }
    }

    async TransferToRetailer(ctx, id){
        const assetString = await this.ReadAsset(ctx, id);
        const asset = JSON.parse(assetString);

        if (asset.Owner == "Deliverer1"){
            console.info("[OK] Asset transfered ! From : " + asset.Owner + " To :" + "Retailer1");
            asset.Owner = "Retailer1";
            asset.AssetStatus = "On the shelf";
            asset.Amount = "5kg";
            asset.SalePrice = "25TL";
            asset.TimeStamp = getTimestamp();

            return ctx.stub.putState(id, Buffer.from(JSON.stringify(asset)));
        }
    }

    // GetAllAssets returns all assets found in the world state.
    async GetAllAssets(ctx) {
        const allResults = [];
        // range query with empty string for startKey and endKey does an open-ended query of all assets in the chaincode namespace.
        const iterator = await ctx.stub.getStateByRange('', '');
        let result = await iterator.next();
        while (!result.done) {
            const strValue = Buffer.from(result.value.value.toString()).toString('utf8');
            let record;
            try {
                record = JSON.parse(strValue);
            } catch (err) {
                console.log(err);
                record = strValue;
            }
            allResults.push({ Key: result.value.key, Record: record });
            result = await iterator.next();
        }
        return JSON.stringify(allResults);
    }


}

module.exports = AssetTransfer;
