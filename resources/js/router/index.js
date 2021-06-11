import VueRouter from 'vue-router';
// import Item from './components/Item.Vue';
import Dashboard from '../pages/Dashboard.vue';
import Home from '../pages/Home.vue';
import Login from '../pages/auth/Login.vue';
import Register from "../pages/auth/Register";
import EmailValidation from "../pages/auth/EmailValidation";
import IndexVoucher from "../pages/vouchers/IndexVoucher";
import Store from '../store';
import AddEditVoucher from "../pages/vouchers/AddEditVoucher";
import CreateTransaction from "../pages/transactions/CreateTransaction";
import ShowVoucher from "../pages/vouchers/ShowVoucher";

let routes = [
    {
        path: '/',
        component: Home,
        meta: {requiresAuth: true},
        children: [
            {
                path: '/',
                component: Dashboard,
                name: 'dashboard',
                meta: {requiresAuth: true},
            },
            {
                path: '/voucher',
                component: IndexVoucher,
                name: 'indexVoucher',
                meta: {requiresAuth: true},
            },
            {
                path: '/voucher/add',
                component: AddEditVoucher,
                name: 'addVoucher',
                meta: {requiresAuth: true},
            },
            {
                path: '/voucher/edit/:id',
                component: AddEditVoucher,
                name: 'editVoucher',
                meta: {requiresAuth: true},
            },
            {
                path: '/voucher/detail/:id',
                component: ShowVoucher,
                name: 'showVoucher',
                meta: {requiresAuth: true},
            },
            {
                path: '/create_transaction',
                component: CreateTransaction,
                name: 'createTransaction',
                meta: {requiresAuth: true},
            },
            // {
            //     path: 'customer',
            //     component: Customer,
            //     name: 'customer',
            //     meta: {requiresAuth: true},
            // },
            // {
            //     path: 'customer/create',
            //     component: CustomerCreate,
            //     name: 'customer-create',
            //     meta: {requiresAuth: true},
            // },
            // {
            //     path: 'customer/:id',
            //     component: CustomerEdit,
            //     name: 'customer-edit',
            //     meta: {requiresAuth: true},
            //     props: true,
            // },

            // {
            //     path: 'user',
            //     component: User,
            //     name: 'user',
            //     meta: {requiresAuth: true},
            // },
            // {
            //     path: 'user/create',
            //     component: UserCreate,
            //     name: 'user-create',
            //     meta: {requiresAuth: true},
            // },
            // {
            //     path: 'user/:id',
            //     component: UserEdit,
            //     name: 'user-edit',
            //     meta: {requiresAuth: true},
            //     props: true,
            // },
        ],
    },
    {
        path: '/login',
        component: Login,
        name: 'login',
        meta: {requiresAuth: false},
    },
    {
        path: '/register',
        component: Register,
        name: 'register',
        meta: {requiresAuth: false},
    },
    {
        path: '/email_validation',
        component: EmailValidation,
        name: 'emailValidation',
        meta: {requiresAuth: false},
    },
    // {
    //     path: '/company/create',
    //     component: CompanyCreate,
    //     name: 'company-create',
    //     meta: {requiresAuth: true},
    // },
];

const router = new VueRouter({
    routes
});

router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requiresAuth)) {
        if (!Store.getters.isLoggedIn) {
            next({
                path: '/login',
            });
        } else {
            next();
        }
    } else {
        if (Store.getters.isLoggedIn) {
            next({
                path: '/',
            });
        }else{
            next();
        }
    }
});

export default router;
