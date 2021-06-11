import Vue from "vue";
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

import VueRouter from 'vue-router';
import router from './router';
import store from './store';
import 'vue-loading-overlay/dist/vue-loading.css';

window.Vue = require('vue');
Vue.use(VueRouter);
window._ = require('lodash');
window.events = new Vue();
Vue.prototype.window = window;

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding pages to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// Vue.component('image-form', require('./pages/ImageForm'));
Vue.component('loading', () => import("vue-loading-overlay"));
// Vue.component('my-vue-select', require('./pages/MyVueSelect'));
// Vue.component('my-date-picker', require('./pages/MyDatePicker'));
// Vue.component('my-company-select', require('./pages/MyCompanySelect'));
Vue.component('layout', () => import("./pages/App"));
Vue.component('navbar', () => import("./pages/layouts/Navbar"));
Vue.component('sidebar', () => import("./pages/layouts/Sidebar"));
// Vue.component('autocomplete', require('./pages/AutoComplete.vue'));

const app = new Vue({
    el: '#app',
    router,
    store,
});

