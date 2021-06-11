<template>
    <div class="app-container app-theme-white body-tabs-shadow">
        <div class="app-container">
            <div class="h-100">
                <div class="h-100 no-gutters row">
                    <div class="h-100 d-md-flex d-sm-block bg-white justify-content-center align-items-center col-md-12 col-lg-7">
                        <div class="mx-auto app-login-box col-sm-12 col-md-10 col-lg-9">
<!--                            <div class="app-logo"></div>-->
                            <h4>
                                <div>Welcome,</div>
                                <span>It only takes a <span class="text-success">few seconds</span> to create your account</span>
                            </h4>
                            <div>
                                <form class="" @submit.prevent="doRegister()">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="adminName" class=""><span class="text-danger">*</span> Nama Admin</label>
                                                <input name="adminName" id="adminName" type="text" class="form-control" v-model="register.name">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="exampleEmail" class=""><span class="text-danger">*</span> Email</label>
                                                <input name="email" id="exampleEmail" type="email" class="form-control" v-model="register.email">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="examplePassword" class=""><span class="text-danger">*</span> Password</label>
                                                <input name="password" id="examplePassword" type="password" class="form-control" v-model="register.password">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="examplePasswordRep" class=""><span class="text-danger">*</span> Ulangi Password</label>
                                                <input name="passwordrep" id="examplePasswordRep" type="password" class="form-control" v-model="register.password_confirmation">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="merchantName" class=""><span class="text-danger">*</span> Nama Merchant</label>
                                                <input name="merchantName" id="merchantName" type="text" class="form-control" v-model="register.name_merchant">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="merchantCategory" class=""><span class="text-danger">*</span> Kategori Merchant</label>
<!--                                                <v-select name="merchantCategory" class="form-control" label="name" :options="merchant_categories" v-model="register.category_id"></v-select>-->
                                                <select name="merchantCategory" id="merchantCategory" class="form-control" v-model="register.category_id">
                                                    <option value="">&nbsp;</option>
                                                    <option :value="cat.id" v-for="(cat, index) in merchant_categories" :key="index">{{ cat.name }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="merchantBackground" class=""><span class="text-danger">*</span> Background Merchant</label>
                                                <input name="merchantBackground" id="merchantBackground" type="file" class="form-control" accept="image/*" @change="readImage($event)">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="shortDescription" class=""><span class="text-danger">*</span> Deskripsi Singkat</label>
                                                <input type="text" name="shortDescription" id="shortDescription" class="form-control" v-model="register.short_description">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="position-relative form-group">
                                                <label for="longDescription" class=""><span class="text-danger">*</span> Penjelasan Merchant</label>
                                                <textarea name="longDescription" id="longDescription" class="form-control" v-model="register.long_description"></textarea>
                                            </div>
                                        </div>
                                    </div>
<!--                                    <div class="mt-3 position-relative form-check">-->
<!--                                        <input name="check" id="exampleCheck" type="checkbox" class="form-check-input">-->
<!--                                        <label for="exampleCheck" class="form-check-label">Accept our <a href="javascript:void(0);">Terms and Conditions</a>.</label>-->
<!--                                    </div>-->
                                    <div class="mt-4 d-flex align-items-center">
                                        <h5 class="mb-0">
                                            Already have an account?
                                            <router-link  :to="{ name: 'login'}"  class="text-primary">Sign in</router-link>
                                        </h5>
                                        <div class="ml-auto">
                                            <button type="submit" class="btn-wide btn-pill btn-shadow btn-hover-shine btn btn-primary btn-lg">Create Account </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="d-lg-flex d-xs-none col-lg-5">
                        <div class="slider-light">
                            <div class="slick-slider slick-initialized">
                                <div>
                                    <div class="position-relative h-100 d-flex justify-content-center align-items-center bg-premium-dark" tabindex="-1">
                                        <div class="slide-img-bg" style="background-image: url('assets/images/originals/citynights.jpg');"></div>
                                        <div class="slider-content">
                                            <h3>Scalable, Modular, Consistent</h3>
                                            <p>Easily exclude the components you don't require. Lightweight, consistent
                                                Bootstrap based styles across all elements and components
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
import imageCompression from 'browser-image-compression';

export default {
    name: "Register",
    data() {
        return {
            isLoading: false,
            isInitial: true,
            merchant_categories: [],
            register: {
                email: null,
                password: null,
                password_confirmation:null,
                name: null,
                name_merchant: null,
                short_description: null,
                long_description: null,
                category_id: null,
                background: null
            }
        }
    },
    methods: {
        fetchMerchantCategory () {
            this.$set(this,'isLoading',true);
            Api.merchant_category.index().then((res)=>{
                this.$set(this,'merchant_categories', res.data.data);
                this.$set(this,'isLoading',false);
            }).catch((err)=>{
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                this.$set(this,'isLoading',false);
            })
        },
        async readImage(event) {
            this.$set(this,'isLoading',true);
            let photo = event.target.files[0];
            const options = {
                maxSizeMB: 1,
                maxWidthOrHeight: 1024,
                useWebWorker: false
            };
            try {
                this.$set(this.register, 'background', await imageCompression(photo, options)
                    .then(blob => new File([blob], blob.name)));
                this.$set(this,'isLoading',false);
            } catch (error) {
                this.$set(this,'isLoading',false);
            }
            return photo;
        },
        clearForm() {
            this.$set(this.register,'email',null);
            this.$set(this.register,'password',null);
            this.$set(this.register,'password_confirmation',null);
            this.$set(this.register,'name',null);
            this.$set(this.register,'name_merchant',null);
            this.$set(this.register,'short_description',null);
            this.$set(this.register,'long_description',null);
            this.$set(this.register,'category_id',null);
            this.$set(this.register,'background',null);
        },
        convertToFormData: function () {
            let data = new FormData;
            ['email','password','password_confirmation','name','name_merchant','short_description','long_description',
                'category_id','background'].forEach((key) => {
                if (this.register[key]) data.append(`${key}`, this.register[key]);
            });
            return data;
        },
        doRegister() {
            this.$set(this,'isLoading',true);
            let payload = this.convertToFormData();
            Api.auth.register(payload).then((res)=>{
                this.$set(this,'isLoading',false);
                this.clearForm();
                toastr.options.progressBar = true;
                toastr.success('Your merchant has been successfully registered','Successful registration');
                this.$router.push("/login");
            }).catch((err)=>{
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                this.$set(this,'isLoading',false);
            });
        },
    },
    computed: {
        isPending(){
            return this.$store.getters.isPending;
        },
        isError(){
            return this.$store.getters.isError;
        },
        messages(){
            return this.$store.getters.messages;
        }
    },
    mounted() {
        this.fetchMerchantCategory();
    }
}
</script>

<style scoped>
/*@import 'http://tada-api.test/layout_assets/css/auth_style.css';*/
</style>
