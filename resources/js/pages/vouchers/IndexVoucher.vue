<template>
    <div class="app-main__outer">
        <div class="app-main__inner">
            <div class="row">
                <div class="col-sm-12">
                    <div class="main-card mb-3 card">
                        <div class="card-header">
                            All Voucher
                            <div class="btn-actions-pane-right">
                                <router-link :to="{ name: 'addVoucher'}" class="btn btn-light btn-sm">
                                    Add Voucher
                                </router-link>
                            </div>
                        </div>
                        <div class="card-body">
                            <table class="mb-0 table table-hover">
                                <thead>
                                <tr>
                                    <th>&nbsp;</th>
                                    <th>Name</th>
                                    <th>Min Trx</th>
                                    <th>Value</th>
                                    <th>Expiration</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(voucher, index) in vouchers" :key="index">
                                    <th scope="row">{{ index+1 }}</th>
                                    <td>{{ voucher.name }}</td>
                                    <td>{{ voucher.min_transaction }}</td>
                                    <td>{{ voucher.value }}</td>
                                    <td>{{ voucher.expiration }}</td>
                                    <td>
                                        <router-link class="mr-2 btn-icon btn-icon-only btn-pill btn btn-success" :to="{name: 'showVoucher', params: {id: voucher.id}}" title="Detail">
                                            <i class="lnr-eye btn-icon-wrapper"> </i>
                                        </router-link>
                                        <router-link class="mr-2 btn-icon btn-icon-only btn-pill btn btn-warning" :to="{name: 'editVoucher', params: {id: voucher.id}}" title="Edit">
                                            <i class="lnr-pencil btn-icon-wrapper"> </i>
                                        </router-link>
                                        <button class="mr-2 btn-icon btn-icon-only btn-pill btn btn-danger" @click="deleteVoucher(voucher.id, voucher.name)" title="Delete">
                                            <i class="lnr-trash btn-icon-wrapper"> </i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <loading :active.sync="isLoading"
                 :can-cancel="false"
                 :is-full-page="true"
                 color="#007bff"
        />
    </div>
</template>

<script>
import Api from "../../api";
import toastr from "toastr";

export default {
    name: "IndexVoucher",
    data() {
        return {
            isLoading: false,
            vouchers: []
        }
    },
    methods: {
        fetchVouchers() {
            this.$set(this,'isLoading',true);
            Api.voucher.index().then((res)=>{
                this.$set(this,'vouchers', res.data.data);
                this.$set(this,'isLoading',false);
            }).catch((err)=>{
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                this.$set(this,'isLoading',false);
            });
        },
        deleteVoucher(id, name) {
            if(confirm(`Do you really want to delete ${name} ?`)){
                this.$set(this,'isLoading',true);
                Api.voucher.destroy(id).then((res)=>{
                    toastr.options.progressBar = true;
                    toastr.success('data deleted successfully','Success');
                    this.fetchVouchers();
                }).catch((err)=>{
                    toastr.options.progressBar = true;
                    toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                    this.$set(this,'isLoading',false);
                })
            }
        }
    },
    mounted() {
        this.fetchVouchers();
    }
}
</script>

<style scoped>

</style>
