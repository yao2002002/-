<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
							<el-col v-if="$check_field('get','vehicle_no') || $check_field('add','vehicle_no') || $check_field('set','vehicle_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆编号" prop="vehicle_no">
												<el-input id="vehicle_no" v-model="form['vehicle_no']" placeholder="请输入车辆编号"
							  v-if="(form['vehicle_reservation_id'] && $check_field('set','vehicle_no')) || (!form['vehicle_reservation_id'] && $check_field('add','vehicle_no'))" :disabled="disabledObj['vehicle_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_no')">{{form['vehicle_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_name') || $check_field('add','vehicle_name') || $check_field('set','vehicle_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆名称" prop="vehicle_name">
												<el-input id="vehicle_name" v-model="form['vehicle_name']" placeholder="请输入车辆名称"
							  v-if="(form['vehicle_reservation_id'] && $check_field('set','vehicle_name')) || (!form['vehicle_reservation_id'] && $check_field('add','vehicle_name'))" :disabled="disabledObj['vehicle_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_name')">{{form['vehicle_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_model') || $check_field('add','vehicle_model') || $check_field('set','vehicle_model')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆型号" prop="vehicle_model">
												<el-input id="vehicle_model" v-model="form['vehicle_model']" placeholder="请输入车辆型号"
							  v-if="(form['vehicle_reservation_id'] && $check_field('set','vehicle_model')) || (!form['vehicle_reservation_id'] && $check_field('add','vehicle_model'))" :disabled="disabledObj['vehicle_model_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_model')">{{form['vehicle_model']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_brand') || $check_field('add','vehicle_brand') || $check_field('set','vehicle_brand')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆品牌" prop="vehicle_brand">
												<el-input id="vehicle_brand" v-model="form['vehicle_brand']" placeholder="请输入车辆品牌"
							  v-if="(form['vehicle_reservation_id'] && $check_field('set','vehicle_brand')) || (!form['vehicle_reservation_id'] && $check_field('add','vehicle_brand'))" :disabled="disabledObj['vehicle_brand_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_brand')">{{form['vehicle_brand']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_price') || $check_field('add','vehicle_price') || $check_field('set','vehicle_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆价格" prop="vehicle_price">
								<el-input-number id="vehicle_price" v-model.number="form['vehicle_price']"
						v-if="(form['vehicle_reservation_id'] && $check_field('set','vehicle_price')) || (!form['vehicle_reservation_id'] && $check_field('add','vehicle_price'))" :disabled="disabledObj['vehicle_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','vehicle_price')">{{form['vehicle_price']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','registered_user') || $check_field('add','registered_user') || $check_field('set','registered_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="注册用户" prop="registered_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_registered_user(form['registered_user']) }}
							<el-select v-if="(form['vehicle_reservation_id'] && $check_field('set','registered_user')) || (!form['vehicle_reservation_id'] && $check_field('add','registered_user'))" id="registered_user" v-model="form['registered_user']" :disabled="disabledObj['registered_user_isDisabled']">
								<el-option v-for="o in list_user_registered_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','registered_user')" id="registered_user" v-model="form['registered_user']" :disabled="true">
								<el-option v-for="o in list_user_registered_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="registered_user" v-model="form['registered_user']" :disabled="disabledObj['registered_user_isDisabled']">
							<el-option v-for="o in list_user_registered_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户姓名" prop="user_name">
												<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="(form['vehicle_reservation_id'] && $check_field('set','user_name')) || (!form['vehicle_reservation_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','contact_information') || $check_field('add','contact_information') || $check_field('set','contact_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系方式" prop="contact_information">
												<el-input id="contact_information" v-model="form['contact_information']" placeholder="请输入联系方式"
							  v-if="(form['vehicle_reservation_id'] && $check_field('set','contact_information')) || (!form['vehicle_reservation_id'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_information')">{{form['contact_information']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','booking_quantity') || $check_field('add','booking_quantity') || $check_field('set','booking_quantity')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预订数量" prop="booking_quantity">
								<el-input-number id="booking_quantity" v-model.number="form['booking_quantity']"
						v-if="(form['vehicle_reservation_id'] && $check_field('set','booking_quantity')) || (!form['vehicle_reservation_id'] && $check_field('add','booking_quantity'))" :disabled="disabledObj['booking_quantity_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','booking_quantity')">{{form['booking_quantity']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','reservation_remarks') || $check_field('add','reservation_remarks') || $check_field('set','reservation_remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预订备注" prop="reservation_remarks">
								<el-input type="textarea" id="reservation_remarks" v-model="form['reservation_remarks']" placeholder="请输入预订备注"
						v-if="(form['vehicle_reservation_id'] && $check_field('set','reservation_remarks')) || (!form['vehicle_reservation_id'] && $check_field('add','reservation_remarks'))" :disabled="disabledObj['reservation_remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','reservation_remarks')">{{form['reservation_remarks']}}</div>
							</el-form-item>
			</el-col>
						
	
	
		
		
	
	
	
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/vehicle_reservation/view','set') || $check_action('/vehicle_reservation/view','add')">
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
				<el-form-item v-else>
					<el-button @click="cancel()">返回</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "vehicle_reservation_id",
				url_add: "~/api/vehicle_reservation/add?",
				url_set: "~/api/vehicle_reservation/set?",
				url_get_obj: "~/api/vehicle_reservation/get_obj?",
				url_upload: "~/api/vehicle_reservation/upload?",

				query: {
					"vehicle_reservation_id": 0,
				},

				form: {
								"vehicle_no":  '', // 车辆编号
										"vehicle_name":  '', // 车辆名称
										"vehicle_model":  '', // 车辆型号
										"vehicle_brand":  '', // 车辆品牌
										"vehicle_price":  0, // 车辆价格
										"registered_user": 0, // 注册用户
										"user_name":  '', // 用户姓名
										"contact_information":  '', // 联系方式
										"booking_quantity":  0, // 预订数量
										"reservation_remarks":  '', // 预订备注
											"vehicle_reservation_id": 0, // ID
													},
				disabledObj:{
								"vehicle_no_isDisabled": false,
										"vehicle_name_isDisabled": false,
										"vehicle_model_isDisabled": false,
										"vehicle_brand_isDisabled": false,
					          			"vehicle_price_isDisabled": false,
										"registered_user_isDisabled": false,
										"user_name_isDisabled": false,
										"contact_information_isDisabled": false,
					          			"booking_quantity_isDisabled": false,
										"reservation_remarks_isDisabled": false,
										},

	
				
				
				
				
				
					// 用户列表
				list_user_registered_user: [],
						// 用户组
				group_user_registered_user: "",
						
				
				
				
			
			}
		},
		methods: {

	
	
			
	
			
	
			
	
			
	
			
	
				/**
			 * 获取注册用户用户列表
			 */
			async get_list_user_registered_user() {
                var json = await this.$get("~/api/user/get_list?user_group=注册用户");
                if(json.result && json.result.list){
                    this.list_user_registered_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取注册用户用户组
			 */
			async get_group_user_registered_user() {
							this.form["registered_user"] = this.$store.state.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=注册用户");
				if(json.result && json.result.obj){
					this.group_user_registered_user = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_registered_user(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_registered_user.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["registered_user"] = id
									_this.disabledObj['registered_user' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "registered_user") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_registered_user(id){
				var obj = this.list_user_registered_user.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
								// 获取缓存数据附加
				form = $.db.get("form");
									$.push(this.form ,form);
														if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
								this.form[key] = form[dbKey]
							}
							if(dbKey === "source_table"){
								this.form['source_table'] = form[dbKey];
							}
							if(dbKey === "source_id"){
								this.form['source_id'] = form[dbKey];
							}
							if(dbKey === "source_user_id"){
								this.form['source_user_id'] = form[dbKey];
							}
						})
					})
				}
																								$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){

																																																		

			},

																																																																												async submit(param, func){
				if (!param) {
					param = this.form;
				}
								var pm = this.events("submit_before", Object.assign({}, param)) || param;
				var msg = await this.events("submit_check", pm);
				var ret;
				if (msg) {
					this.$toast(msg, 'danger');
				} else {
																																																																																	ret = this.events("submit_main", pm, func);
				}
				return ret;
			},
			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
						submit_check(param) {
																																																																																																																								return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/vehicle_reservation/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_reservation/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_reservation/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_reservation/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_reservation/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
															this.get_list_user_registered_user();
					this.get_group_user_registered_user();
													},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
	
	.img_multiple{
		overflow: hidden;
	}
	.img_multiple .img_block{
		float: left;
		margin-right: 5px;
		margin-bottom: 5px;
		position: relative;
	}
	.img_multiple .img_block img{
		height: 100px;
		width: auto;
	}
	.img_multiple .img_del{
		position: absolute;
		top: 5px;
		right: 5px;
		width: 20px;
		height: 20px;
		background: #0000008a;
		color: #fff;
		line-height: 20px;
		text-align: center;
		border-radius: 100%;
		cursor: pointer;
	}




</style>
