import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    gretting ="Welcome to my Component";
    userDetails = {
        firstname : "Lucky",
        lastname : "Darwai",
        age : 22
    };
}