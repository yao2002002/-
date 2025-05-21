<template>
  <div class="list_menu diy_menu">
    <router-link
            to="/user_center/index"
            class="menu_item"
            :class="{ selected: this.$route.path=== '/user_center/index'}"
     >
      <span class="left_span">个人首页</span>
      <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
    </router-link>
          <router-link
          to="/registered_user/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/registered_user/table'}"
          v-if="$check_action('/registered_user/table','get')">
        <span class="left_span">注册用户</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/vehicle_information/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/vehicle_information/table'}"
          v-if="$check_action('/vehicle_information/table','get')">
        <span class="left_span">车辆信息</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/vehicle_reservation/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/vehicle_reservation/table'}"
          v-if="$check_action('/vehicle_reservation/table','get')">
        <span class="left_span">车辆预订</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
                  <router-link
          to="/delivery_arrangements/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/delivery_arrangements/table'}"
          v-if="$check_action('/delivery_arrangements/table','get')">
        <span class="left_span">交付安排</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/user_complaints/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/user_complaints/table'}"
          v-if="$check_action('/user_complaints/table','get')">
        <span class="left_span">用户投诉</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
        	<router-link
		to="/logistics_delivery/table"
		class="menu_item"
		:class="{ selected: this.$route.path=== '/logistics_delivery/table'}"
        v-if="$check_action('/logistics_delivery/table')"
	>
		<span class="left_span">订单配送</span>
		<span class="right_span"><b-icon icon="house-fill"></b-icon></span>
	</router-link>
      <router-link
              to="/user/collect"
              class="menu_item"
              :class="{ selected: this.$route.path=== '/user/collect'}"
              v-if="$check_action('/collect/list','get')">
        <span class="left_span">收藏</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
  </router-link>
	<router-link
	            to="/comment/table"
	            class="menu_item"
	            :class="{ selected: this.$route.path=== '/comment/table'}"
	            v-if="$check_action('/comment/table','get')">
	      <span class="left_span">评论管理</span>
	      <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
	</router-link>
  </div>
</template>

<script>
import mixin from "@/mixins/page.js";
export default {
  mixins: [mixin],
  data() {
    return {
    };
  },
  mounted() {
  },
  methods: {
  },

  components: {
  },
};
</script>

<style scoped>
.list_menu {
  flex: 0 0 25%;
  border-bottom: 1px solid #eee;
}
.menu_item {
  display: flex;
  justify-content: space-between;
  padding: 15px 20px;
  border: 1px solid #eee;
  border-bottom: none;
  background-color: #fff;
}
.menu_item.selected {
  background-color: #000;
}
.menu_item.selected span {
  color: #fff ;
}
.content {
  flex: 0 0 74%;
}
</style>
