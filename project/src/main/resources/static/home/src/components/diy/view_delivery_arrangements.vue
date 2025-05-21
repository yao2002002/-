<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
							<el-col v-if="$check_field('get','order_number') || $check_field('add','order_number') || $check_field('set','order_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="订单编号" prop="order_number">
												<el-input id="order_number" v-model="form['order_number']" placeholder="请输入订单编号"
							  v-if="(form['delivery_arrangements_id'] && $check_field('set','order_number')) || (!form['delivery_arrangements_id'] && $check_field('add','order_number'))" :disabled="disabledObj['order_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','order_number')">{{form['order_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','car_name') || $check_field('add','car_name') || $check_field('set','car_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车名称" prop="car_name">
												<el-input id="car_name" v-model="form['car_name']" placeholder="请输入汽车名称"
							  v-if="(form['delivery_arrangements_id'] && $check_field('set','car_name')) || (!form['delivery_arrangements_id'] && $check_field('add','car_name'))" :disabled="disabledObj['car_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_name')">{{form['car_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','registered_user') || $check_field('add','registered_user') || $check_field('set','registered_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="注册用户" prop="registered_user">
													<el-select v-if="(form['delivery_arrangements_id'] && $check_field('set','registered_user')) || (!form['delivery_arrangements_id'] && $check_field('add','registered_user'))" id="registered_user" v-model="form['registered_user']" :disabled="disabledObj['registered_user_isDisabled']">
							<el-option v-for="o in list_user_registered_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','registered_user')" id="registered_user" v-model="form['registered_user']" :disabled="true">
							<el-option v-for="o in list_user_registered_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户姓名" prop="user_name">
								<el-select id="user_name" v-model="form['user_name']" @change="select_user_name_field"						v-if="(form['delivery_arrangements_id'] && $check_field('set','user_name')) || (!form['delivery_arrangements_id'] && $check_field('add','user_name'))">
						<el-option v-for="o in list_user_name" :key="o['user_name']" :label="o['user_name']"
							:value="o['user_name']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','contact_information') || $check_field('add','contact_information') || $check_field('set','contact_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系方式" prop="contact_information">
								<el-input id="contact_information" v-model="form['contact_information']"
						v-if="(form['delivery_arrangements_id'] && $check_field('set','contact_information')) || (!form['delivery_arrangements_id'] && $check_field('add','contact_information'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','contact_information')">{{form['contact_information']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','delivery_time') || $check_field('add','delivery_time') || $check_field('set','delivery_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="交付时间" prop="delivery_time">
								<el-date-picker :disabled="disabledObj['delivery_time_isDisabled']" v-if="(form['delivery_arrangements_id'] && $check_field('set','delivery_time')) || (!form['delivery_arrangements_id'] && $check_field('add','delivery_time'))" id="delivery_time"
						v-model="form['delivery_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','delivery_time')">{{form['delivery_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','delivery_location') || $check_field('add','delivery_location') || $check_field('set','delivery_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="交付地点" prop="delivery_location">
												<el-input id="delivery_location" v-model="form['delivery_location']" placeholder="请输入交付地点"
							  v-if="(form['delivery_arrangements_id'] && $check_field('set','delivery_location')) || (!form['delivery_arrangements_id'] && $check_field('add','delivery_location'))" :disabled="disabledObj['delivery_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','delivery_location')">{{form['delivery_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','delivery_arrangements') || $check_field('add','delivery_arrangements') || $check_field('set','delivery_arrangements')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="交付安排" prop="delivery_arrangements">
								<el-input type="textarea" id="delivery_arrangements" v-model="form['delivery_arrangements']" placeholder="请输入交付安排"
						v-if="(form['delivery_arrangements_id'] && $check_field('set','delivery_arrangements')) || (!form['delivery_arrangements_id'] && $check_field('add','delivery_arrangements'))" :disabled="disabledObj['delivery_arrangements_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','delivery_arrangements')">{{form['delivery_arrangements']}}</div>
							</el-form-item>
			</el-col>
						
	
	
		
		
	
	
	
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/delivery_arrangements/view','set') || $check_action('/delivery_arrangements/view','add')">
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
				field: "delivery_arrangements_id",
				url_add: "~/api/delivery_arrangements/add?",
				url_set: "~/api/delivery_arrangements/set?",
				url_get_obj: "~/api/delivery_arrangements/get_obj?",
				url_upload: "~/api/delivery_arrangements/upload?",

				query: {
					"delivery_arrangements_id": 0,
				},

				form: {
								"order_number": '', // 订单编号
										"car_name": '', // 汽车名称
										"registered_user": 0, // 注册用户
										"user_name":  '', // 用户姓名
										"contact_information":  '', // 联系方式
										"delivery_time":  '', // 交付时间
										"delivery_location": '', // 交付地点
										"delivery_arrangements": '', // 交付安排
											"delivery_arrangements_id": 0, // ID
													},
				disabledObj:{
								"order_number_isDisabled": false,
										"car_name_isDisabled": false,
										"registered_user_isDisabled": false,
										"user_name_isDisabled": false,
										"contact_information_isDisabled": false,
										"delivery_time_isDisabled": false,
										"delivery_location_isDisabled": false,
										"delivery_arrangements_isDisabled": false,
										},

	
				
				
					// 用户列表
				list_user_registered_user: [],
												// 用户姓名选项列表
				list_user_name: [""],
	
				
				
				
				
			
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
			 * 获取用户姓名列表
			 */
			async get_list_user_name() {
				var json = await this.$get("~/api/registered_user/get_list?");
				if(json.result && json.result.list){
					this.list_user_name = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
					select_user_name_field(v){
				this.$get('~/api/registered_user/get_obj?user_name='+v,{},(res)=>{
					if(res.result && res.result.obj){
																																																																																		this.form.contact_information = res.result.obj.contact_information;
																																																																	}else{
						console.error(res.error);
					}
				})
			},
					
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
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
											        if (this.form["delivery_time"] && JSON.stringify(this.form["delivery_time"]).indexOf("-")===-1){
            this.form["delivery_time"] = this.$toTime(parseInt(this.form["delivery_time"]),"yyyy-MM-dd hh:mm:ss")
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

																														if(json.result.obj["delivery_time"]=="0000-00-00 00:00:00"){
				  json.result.obj["delivery_time"] = null;
				}
				if(parseInt(json.result.obj["delivery_time"]) > 9999){
					json.result.obj["delivery_time"] = this.$toTime(parseInt(json.result.obj["delivery_time"]),"yyyy-MM-dd hh:mm:ss")
				}
															

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
											if (!param.order_number){
					return "订单编号不能为空";
				}
																	if (!param.car_name){
					return "汽车名称不能为空";
				}
																																																		if (!param.delivery_time){
					return "交付时间不能为空";
				}
																	if (!param.delivery_location){
					return "交付地点不能为空";
				}
																	if (!param.delivery_arrangements){
					return "交付安排不能为空";
				}
																return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/delivery_arrangements/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/delivery_arrangements/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/delivery_arrangements/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/delivery_arrangements/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/delivery_arrangements/view','get');
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
							this.get_list_user_name();
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
