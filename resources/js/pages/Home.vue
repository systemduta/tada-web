<template>
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <navbar></navbar>
        <sidebar></sidebar>

<!--        main content-->
        <div class="app-main">
            <router-view></router-view>
        </div>
<!--        end of main content-->
    </div>
</template>

<script>
import Cookie from 'vue-cookie';
export default {
    name: "Home",
    created () {
        axios.interceptors.request.use(
            (config) => {
                // let token = localStorage.getItem("token");
                let token = Cookie.get('token');
                if (token) {
                    config.headers['Authorization'] = 'Bearer ' + token
                }
                return config
            },
            (error) => {
                return Promise.reject(error)
            }
        );
        axios.interceptors.response.use(undefined, function (err) {
            return new Promise(function (resolve, reject) {
                if (err.status === 401 && err.config && !err.config.__isRetryRequest) {
                    this.$store.dispatch('logout');
                    this.$router.push({name: 'login'})
                }
                throw err
            });
        });
    }
}
</script>
