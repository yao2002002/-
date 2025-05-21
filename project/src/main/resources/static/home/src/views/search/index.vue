<template>
  <div class="page_search search_index">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>
				<!-- 商品搜索结果 -->
			  <list_result_search
				:list="result_goods"
				title="汽车商城"
				source_table="goods"
			  ></list_result_search>

				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="汽车资讯"
				source_table="article"
			  ></list_result_search>


						  <list_result_search
				v-if="$check_action('/registered_user/list', 'get')"
				:list="result_registered_user_user_name"
				title="注册用户用户姓名"
				source_table="registered_user"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/registered_user/list', 'get')"
				:list="result_registered_user_contact_information"
				title="注册用户联系方式"
				source_table="registered_user"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/vehicle_information/list', 'get')"
				:list="result_vehicle_information_vehicle_name"
				title="车辆信息车辆名称"
				source_table="vehicle_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/vehicle_information/list', 'get')"
				:list="result_vehicle_information_vehicle_model"
				title="车辆信息车辆型号"
				source_table="vehicle_information"
			  ></list_result_search>
																														  <list_result_search
				v-if="$check_action('/vehicle_reservation/list', 'get')"
				:list="result_vehicle_reservation_vehicle_name"
				title="车辆预订车辆名称"
				source_table="vehicle_reservation"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/vehicle_reservation/list', 'get')"
				:list="result_vehicle_reservation_vehicle_model"
				title="车辆预订车辆型号"
				source_table="vehicle_reservation"
			  ></list_result_search>
																														  <list_result_search
				v-if="$check_action('/auto_mall/list', 'get')"
				:list="result_auto_mall_car_name"
				title="汽车商城汽车名称"
				source_table="auto_mall"
			  ></list_result_search>
															  <list_result_search
				v-if="$check_action('/delivery_arrangements/list', 'get')"
				:list="result_delivery_arrangements_order_number"
				title="交付安排订单编号"
				source_table="delivery_arrangements"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/delivery_arrangements/list', 'get')"
				:list="result_delivery_arrangements_car_name"
				title="交付安排汽车名称"
				source_table="delivery_arrangements"
			  ></list_result_search>
																														  <list_result_search
				v-if="$check_action('/user_complaints/list', 'get')"
				:list="result_user_complaints_user_name"
				title="用户投诉用户姓名"
				source_table="user_complaints"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/user_complaints/list', 'get')"
				:list="result_user_complaints_complaint_title"
				title="用户投诉投诉标题"
				source_table="user_complaints"
			  ></list_result_search>
												</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_goods": [],
	  "result_article": [],
						"result_registered_user_user_name":[],
								"result_registered_user_contact_information":[],
												"result_vehicle_information_vehicle_name":[],
								"result_vehicle_information_vehicle_model":[],
																														"result_vehicle_reservation_vehicle_name":[],
								"result_vehicle_reservation_vehicle_model":[],
																														"result_auto_mall_car_name":[],
															"result_delivery_arrangements_order_number":[],
								"result_delivery_arrangements_car_name":[],
																														"result_user_complaints_user_name":[],
								"result_user_complaints_complaint_title":[],
										};
  },
  methods: {
	/**
	 * 获取${fmodel.filter.cart_name}
	 */
	get_goods() {
	  this.$get("~/api/goods/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_goods = json.result.list;
		}
	  });
	},
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},

				/**
	 * 获取user_name
	 */
	get_registered_user_user_name(){
		let url = "~/api/registered_user/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_registered_user_user_name = json.result.list;
			result_registered_user_user_name.map(o => o.title = o['user_name'])
	  			this.result_registered_user_user_name = result_registered_user_user_name
		 	}
		});
	},
						/**
	 * 获取contact_information
	 */
	get_registered_user_contact_information(){
		let url = "~/api/registered_user/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "contact_information": this.query.word }, (json) => {
		  if (json.result) {
			var result_registered_user_contact_information = json.result.list;
			result_registered_user_contact_information.map(o => o.title = o['contact_information'])
	  			this.result_registered_user_contact_information = result_registered_user_contact_information
		 	}
		});
	},
										/**
	 * 获取vehicle_name
	 */
	get_vehicle_information_vehicle_name(){
		let url = "~/api/vehicle_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "vehicle_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_vehicle_information_vehicle_name = json.result.list;
			result_vehicle_information_vehicle_name.map(o => o.title = o['vehicle_name'])
	  			this.result_vehicle_information_vehicle_name = result_vehicle_information_vehicle_name
		 	}
		});
	},
						/**
	 * 获取vehicle_model
	 */
	get_vehicle_information_vehicle_model(){
		let url = "~/api/vehicle_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "vehicle_model": this.query.word }, (json) => {
		  if (json.result) {
			var result_vehicle_information_vehicle_model = json.result.list;
			result_vehicle_information_vehicle_model.map(o => o.title = o['vehicle_model'])
	  			this.result_vehicle_information_vehicle_model = result_vehicle_information_vehicle_model
		 	}
		});
	},
																												/**
	 * 获取vehicle_name
	 */
	get_vehicle_reservation_vehicle_name(){
		let url = "~/api/vehicle_reservation/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "vehicle_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_vehicle_reservation_vehicle_name = json.result.list;
			result_vehicle_reservation_vehicle_name.map(o => o.title = o['vehicle_name'])
	  			this.result_vehicle_reservation_vehicle_name = result_vehicle_reservation_vehicle_name
		 	}
		});
	},
						/**
	 * 获取vehicle_model
	 */
	get_vehicle_reservation_vehicle_model(){
		let url = "~/api/vehicle_reservation/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "vehicle_model": this.query.word }, (json) => {
		  if (json.result) {
			var result_vehicle_reservation_vehicle_model = json.result.list;
			result_vehicle_reservation_vehicle_model.map(o => o.title = o['vehicle_model'])
	  			this.result_vehicle_reservation_vehicle_model = result_vehicle_reservation_vehicle_model
		 	}
		});
	},
																												/**
	 * 获取car_name
	 */
	get_auto_mall_car_name(){
		let url = "~/api/auto_mall/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "car_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_auto_mall_car_name = json.result.list;
			result_auto_mall_car_name.map(o => o.title = o['car_name'])
	  			this.result_auto_mall_car_name = result_auto_mall_car_name
		 	}
		});
	},
													/**
	 * 获取order_number
	 */
	get_delivery_arrangements_order_number(){
		let url = "~/api/delivery_arrangements/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "order_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_delivery_arrangements_order_number = json.result.list;
			result_delivery_arrangements_order_number.map(o => o.title = o['order_number'])
	  			this.result_delivery_arrangements_order_number = result_delivery_arrangements_order_number
		 	}
		});
	},
						/**
	 * 获取car_name
	 */
	get_delivery_arrangements_car_name(){
		let url = "~/api/delivery_arrangements/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "car_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_delivery_arrangements_car_name = json.result.list;
			result_delivery_arrangements_car_name.map(o => o.title = o['car_name'])
	  			this.result_delivery_arrangements_car_name = result_delivery_arrangements_car_name
		 	}
		});
	},
																												/**
	 * 获取user_name
	 */
	get_user_complaints_user_name(){
		let url = "~/api/user_complaints/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_user_complaints_user_name = json.result.list;
			result_user_complaints_user_name.map(o => o.title = o['user_name'])
	  			this.result_user_complaints_user_name = result_user_complaints_user_name
		 	}
		});
	},
						/**
	 * 获取complaint_title
	 */
	get_user_complaints_complaint_title(){
		let url = "~/api/user_complaints/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "complaint_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_user_complaints_complaint_title = json.result.list;
			result_user_complaints_complaint_title.map(o => o.title = o['complaint_title'])
	  			this.result_user_complaints_complaint_title = result_user_complaints_complaint_title
		 	}
		});
	},
									
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_goods();
	this.get_article();
					this.get_registered_user_user_name();
							this.get_registered_user_contact_information();
											this.get_vehicle_information_vehicle_name();
							this.get_vehicle_information_vehicle_model();
																													this.get_vehicle_reservation_vehicle_name();
							this.get_vehicle_reservation_vehicle_model();
																													this.get_auto_mall_car_name();
														this.get_delivery_arrangements_order_number();
							this.get_delivery_arrangements_car_name();
																													this.get_user_complaints_user_name();
							this.get_user_complaints_complaint_title();
									  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_goods();
	  this.get_article();
				  this.get_registered_user_user_name();
						  this.get_registered_user_contact_information();
										  this.get_vehicle_information_vehicle_name();
						  this.get_vehicle_information_vehicle_model();
																												  this.get_vehicle_reservation_vehicle_name();
						  this.get_vehicle_reservation_vehicle_model();
																												  this.get_auto_mall_car_name();
													  this.get_delivery_arrangements_order_number();
						  this.get_delivery_arrangements_car_name();
																												  this.get_user_complaints_user_name();
						  this.get_user_complaints_complaint_title();
										},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
