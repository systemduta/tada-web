<template>
    <div class="app-main__outer">
        <div class="app-main__inner">
            <div class="row">
                <div class="col-sm-12">
                    <div class="main-card mb-3 card">
                        <div class="card-header">
                            Datail Voucher
                        </div>
                        <div class="card-body">
                            <table class="mb-0 table table-hover">
                                <tbody>
                                <tr>
                                    <th>Name</th>
                                    <td>{{ voucher.name }}</td>
                                </tr>
                                <tr>
                                    <th>Description</th>
                                    <td>{{ voucher.description }}</td>
                                </tr>
                                <tr>
                                    <th>Minimun Trx</th>
                                    <td>{{ voucher.min_transaction }}</td>
                                </tr>
                                <tr>
                                    <th>Value</th>
                                    <td>{{ voucher.value }}</td>
                                </tr>
                                <tr>
                                    <th>Expiration</th>
                                    <td>{{ voucher.expiration }}</td>
                                </tr>
                                <tr>
                                    <th>Background</th>
                                    <td>
                                        <img :src="`/merchant/voucher/background/${voucher.background}`" alt="background-voucher" style="max-width: 600px; height: auto;">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="d-block text-right card-footer">
                            <router-link type="button" class="mr-2 btn btn-link" :to="{name: 'indexVoucher'}">Back</router-link>
                            <router-link type="button" class="btn btn-warning" :to="{name: 'editVoucher', params: {id: voucher.id}}">Edit</router-link>
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
    name: "ShowVoucher",
    data () {
        return {
            isLoading: false,
            voucher: null
        }
    },
    methods: {
        fetchVoucher() {
            this.$set(this, 'isLoading', true);
            Api.voucher.show(this.$route.params.id, {}).then((res) => {
                this.$set(this, 'voucher', res.data.data);
                this.$set(this, 'isLoading', false);
            }).catch((err) => {
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                this.$set(this, 'isLoading', false);
            });
        }
    },
    mounted() {
        this.fetchVoucher();
    }
}
</script>

<style scoped>

</style>
