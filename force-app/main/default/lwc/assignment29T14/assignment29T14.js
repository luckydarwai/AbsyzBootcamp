import { LightningElement,track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class Assignment29T14 extends LightningElement {

    @track accounts = [];
    @track isModalOpen = false;
    @track selectedAccount = {};

    connectedCallback() {
        this.fetchAccounts();
    }

    fetchAccounts() {
        getAccounts()
            .then(result => {
                this.accounts = result.slice(0, 10); // Take only the first 10 accounts
            })
            .catch(error => {
                console.error("Error fetching accounts:", error);
            });
    }

    handleShowModal(event) {
        const accountId = event.target.dataset.id;
        this.selectedAccount = this.accounts.find(acc => acc.Id === accountId);
        this.isModalOpen = true;
    }

    handleCloseModal() {
        this.isModalOpen = false;
    }
}