import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
    // 主页
    {
        path: '/',
        name: 'index',
        component: index,
        meta: {
            index: 0,
            title: '首页'
        }
    },

    // 登录
    {
        path: '/login',
        name: 'login',
        component: login,
        meta: {
            index: 0,
            title: '登录'
        }
    },

    	
	
    // 忘记密码
    {
        path: '/forgot',
        name: "forgot",
        component: forgot,
        meta: {
            index: 0,
            title: '忘记密码'
        }
    },

    // 修改密码
    {
        path: '/user/password',
        name: "password",
        component: () => import("../views/user/password.vue"),
        meta: {
            index: 0,
            title: '修改密码'
        }
    },

    // 视频播放页
    {
        path: "/media/video",
        name: "video",
        component: () => import('../views/media/video.vue'),
        meta: {
            index: 0,
            title: "视频"
        }
    },

    // 音频播放页
    {
        path: "/media/audio",
        name: "audio",
        component: () => import('../views/media/audio.vue'),
        meta: {
            index: 0,
            title: "音频"
        }
    },

            // 权限路由
        {
            path: '/auth/table',
            name: 'auth_table',
            component: () => import('../views/auth/table.vue'),
            meta: {
                index: 0,
                title: '权限列表'
            }
        },
        {
            path: '/auth/view',
            name: 'auth_view',
            component: () => import('../views/auth/view.vue'),
            meta: {
                index: 0,
                title: '权限详情'
            }
        },
    
    
                // 轮播图路由
        {
            path: '/slides/table',
            name: 'slides_table',
            component: () => import('../views/slides/table.vue'),
            meta: {
                index: 0,
                title: '轮播图列表'
            }
        },
        {
            path: '/slides/view',
            name: 'slides_view',
            component: () => import('../views/slides/view.vue'),
            meta: {
                index: 0,
                title: '轮播图详情'
            }
        },
                    // 文章路由
            {
                path: '/article/table',
                name: 'article_table',
                component: () => import('../views/article/table.vue'),
                meta: {
                    index: 0,
                    title: '汽车资讯列表'
                }
            },
            {
                path: '/article/view',
                name: 'article_view',
                component: () => import('../views/article/view.vue'),
                meta: {
                    index: 0,
                    title: '汽车资讯详情'
                }
            },

            // 文章分类路由
            {
                path: '/article_type/table',
                name: 'article_type_table',
                component: () => import('../views/article_type/table.vue'),
                meta: {
                    index: 0,
                    title: '汽车资讯分类列表'
                }
            },
            {
                path: '/article_type/view',
                name: 'article_type_view',
                component: () => import('../views/article_type/view.vue'),
                meta: {
                    index: 0,
                    title: '汽车资讯分类详情'
                }
            },
                            
    
    
            // 公告路由
        {
            path: '/notice/table',
            name: 'notice_table',
            component: () => import('../views/notice/table.vue'),
            meta: {
                index: 0,
                title: '网站公告列表'
            }
        },
        {
            path: '/notice/view',
            name: 'notice_view',
            component: () => import('../views/notice/view.vue'),
            meta: {
                index: 0,
                title: '网站公告详情'
            }
        },
            	            {
            path: '/goods_type/table',
            name: 'goods_type_table',
            component: () => import('../views/goods_type/table.vue'),
            meta: {
                index: 0,
                title: '商品分类列表'
            }
        },
        {
            path: '/goods_type/view',
            name: 'goods_type_view',
            component: () => import('../views/goods_type/view.vue'),
            meta: {
                index: 0,
                title: '商品分类详情'
            }
        },

        // 订单路由
        {
            path: '/order/table',
            name: 'order_table',
            component: () => import('../views/order/table.vue'),
            meta: {
                index: 0,
                title: '订单列表'
            }
        },
        {
            path: '/order/view',
            name: 'order_view',
            component: () => import('../views/order/view.vue'),
            meta: {
                index: 0,
                title: '订单详情'
            }
        },
                // 订单配送路由
        {
            path: '/logistics_delivery/table',
            name: 'logistics_delivery_table',
            component: () => import('../views/logistics_delivery/table.vue'),
            meta: {
                index: 0,
                title: '订单配送列表'
            }
        },
        {
            path: '/logistics_delivery/view',
            name: 'logistics_delivery_view',
            component: () => import('../views/logistics_delivery/view.vue'),
            meta: {
                index: 0,
                title: '订单配送详情'
            }
        },
                                        // 订单售后路由
        {
            path: '/order_after_sale/table',
            name: 'order_after_sale_table',
            component: () => import('../views/order_after_sale/table.vue'),
            meta: {
                index: 0,
                title: '订单售后列表'
            }
        },
        {
            path: '/order_after_sale/view',
            name: 'order_after_sale_view',
            component: () => import('../views/order_after_sale/view.vue'),
            meta: {
                index: 0,
                title: '订单售后详情'
            }
        },
            
            // 评论路由
        {
            path: '/comment/table',
            name: 'comment_table',
            component: () => import('../views/comment/table.vue'),
            meta: {
                index: 0,
                title: '评论列表'
            }
        },
        {
            path: '/comment/view',
            name: 'comment_view',
            component: () => import('../views/comment/view.vue'),
            meta: {
                index: 0,
                title: '评论详情'
            }
        },
        	            // 注册用户路由
        {
            path: '/registered_user/table',
            name: 'registered_user_table',
            component: () => import('../views/registered_user/table.vue'),
            meta: {
                index: 0,
                title: '注册用户列表'
            }
        },
        {
            path: '/registered_user/view',
            name: 'registered_user_view',
            component: () => import('../views/registered_user/view.vue'),
            meta: {
                index: 0,
                title: '注册用户详情'
            }
        },
						            // 车辆信息路由
        {
            path: '/vehicle_information/table',
            name: 'vehicle_information_table',
            component: () => import('../views/vehicle_information/table.vue'),
            meta: {
                index: 0,
                title: '车辆信息列表'
            }
        },
        {
            path: '/vehicle_information/view',
            name: 'vehicle_information_view',
            component: () => import('../views/vehicle_information/view.vue'),
            meta: {
                index: 0,
                title: '车辆信息详情'
            }
        },
						            // 车辆预订路由
        {
            path: '/vehicle_reservation/table',
            name: 'vehicle_reservation_table',
            component: () => import('../views/vehicle_reservation/table.vue'),
            meta: {
                index: 0,
                title: '车辆预订列表'
            }
        },
        {
            path: '/vehicle_reservation/view',
            name: 'vehicle_reservation_view',
            component: () => import('../views/vehicle_reservation/view.vue'),
            meta: {
                index: 0,
                title: '车辆预订详情'
            }
        },
						            // 汽车商城路由
        {
            path: '/auto_mall/table',
            name: 'auto_mall_table',
            component: () => import('../views/auto_mall/table.vue'),
            meta: {
                index: 0,
                title: '汽车商城列表'
            }
        },
        {
            path: '/auto_mall/view',
            name: 'auto_mall_view',
            component: () => import('../views/auto_mall/view.vue'),
            meta: {
                index: 0,
                title: '汽车商城详情'
            }
        },
						            // 交付安排路由
        {
            path: '/delivery_arrangements/table',
            name: 'delivery_arrangements_table',
            component: () => import('../views/delivery_arrangements/table.vue'),
            meta: {
                index: 0,
                title: '交付安排列表'
            }
        },
        {
            path: '/delivery_arrangements/view',
            name: 'delivery_arrangements_view',
            component: () => import('../views/delivery_arrangements/view.vue'),
            meta: {
                index: 0,
                title: '交付安排详情'
            }
        },
						            // 用户投诉路由
        {
            path: '/user_complaints/table',
            name: 'user_complaints_table',
            component: () => import('../views/user_complaints/table.vue'),
            meta: {
                index: 0,
                title: '用户投诉列表'
            }
        },
        {
            path: '/user_complaints/view',
            name: 'user_complaints_view',
            component: () => import('../views/user_complaints/view.vue'),
            meta: {
                index: 0,
                title: '用户投诉详情'
            }
        },
						    	    // 用户路由
    {
        path: '/user/table',
        name: 'user_table',
        component: () => import('../views/user/table.vue'),
        meta: {
            index: 0,
            title: '用户列表'
        }
    },
    {
        path: '/user/view',
        name: 'user_view',
        component: () => import('../views/user/view.vue'),
        meta: {
            index: 0,
            title: '用户详情'
        }
    },
    {
        path: '/user/info',
        name: 'user_info',
        component: () => import('../views/user/info.vue'),
        meta: {
            index: 0,
            title: '个人信息'
        }
    },
    // 用户组路由
    {
        path: '/user_group/table',
        name: 'user_group_table',
        component: () => import('../views/user_group/table.vue'),
        meta: {
            index: 0,
            title: '用户组列表'
        }
    },
    {
        path: '/user_group/view',
        name: 'user_group_view',
        component: () => import('../views/user_group/view.vue'),
        meta: {
            index: 0,
            title: '用户组详情'
        }
    }
]

const router = new VueRouter({
    mode: 'hash',
    base: process.env.BASE_URL,
    routes
})

router.beforeEach((to, from, next) => {
    let token = to.query.token;
    if (token) {
        $.db.set("token", token, 120);
    }
    next();
})

router.afterEach((to, from, next) => {
    let title = "新能源汽车销售系统-admin";
    document.title = title;
})

export default router
