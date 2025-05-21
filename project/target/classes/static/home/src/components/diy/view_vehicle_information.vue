<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
							<el-col v-if="$check_field('get','vehicle_no') || $check_field('add','vehicle_no') || $check_field('set','vehicle_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆编号" prop="vehicle_no">
												<el-input id="vehicle_no" v-model="form['vehicle_no']" placeholder="请输入车辆编号"
							  v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_no')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_no'))" :disabled="disabledObj['vehicle_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_no')">{{form['vehicle_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_name') || $check_field('add','vehicle_name') || $check_field('set','vehicle_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆名称" prop="vehicle_name">
												<el-input id="vehicle_name" v-model="form['vehicle_name']" placeholder="请输入车辆名称"
							  v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_name')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_name'))" :disabled="disabledObj['vehicle_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_name')">{{form['vehicle_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_model') || $check_field('add','vehicle_model') || $check_field('set','vehicle_model')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆型号" prop="vehicle_model">
												<el-input id="vehicle_model" v-model="form['vehicle_model']" placeholder="请输入车辆型号"
							  v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_model')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_model'))" :disabled="disabledObj['vehicle_model_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_model')">{{form['vehicle_model']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_brand') || $check_field('add','vehicle_brand') || $check_field('set','vehicle_brand')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆品牌" prop="vehicle_brand">
												<el-input id="vehicle_brand" v-model="form['vehicle_brand']" placeholder="请输入车辆品牌"
							  v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_brand')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_brand'))" :disabled="disabledObj['vehicle_brand_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_brand')">{{form['vehicle_brand']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_price') || $check_field('add','vehicle_price') || $check_field('set','vehicle_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆价格" prop="vehicle_price">
								<el-input-number id="vehicle_price" v-model.number="form['vehicle_price']"
						v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_price')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_price'))" :disabled="disabledObj['vehicle_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','vehicle_price')">{{form['vehicle_price']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_picture') || $check_field('add','vehicle_picture') || $check_field('set','vehicle_picture')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆图片" prop="vehicle_picture">
								<el-upload :disabled="disabledObj['vehicle_picture_isDisabled']" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_vehicle_picture"
						:show-file-list="false" v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_picture')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_picture'))">
						<img id="vehicle_picture" v-if="form['vehicle_picture']" :src="$fullUrl(form['vehicle_picture'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','vehicle_picture')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['vehicle_picture'])" :preview-src-list="[$fullUrl(form['vehicle_picture'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_introduction') || $check_field('add','vehicle_introduction') || $check_field('set','vehicle_introduction')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆介绍" prop="vehicle_introduction">
								<el-input type="textarea" id="vehicle_introduction" v-model="form['vehicle_introduction']" placeholder="请输入车辆介绍"
						v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_introduction')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_introduction'))" :disabled="disabledObj['vehicle_introduction_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_introduction')">{{form['vehicle_introduction']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_condition') || $check_field('add','vehicle_condition') || $check_field('set','vehicle_condition')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆情况" prop="vehicle_condition">
								<el-input type="textarea" id="vehicle_condition" v-model="form['vehicle_condition']" placeholder="请输入车辆情况"
						v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_condition')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_condition'))" :disabled="disabledObj['vehicle_condition_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_condition')">{{form['vehicle_condition']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','vehicle_details') || $check_field('add','vehicle_details') || $check_field('set','vehicle_details')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
				<el-form-item label="车辆详情" prop="vehicle_details">
					<quill-editor v-model.number="form['vehicle_details']"
						v-if="(form['vehicle_information_id'] && $check_field('set','vehicle_details')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_details')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','vehicle_details')" v-html="form['vehicle_details']"></div>
				</el-form-item>
			</el-col>
						
	
	
		
		
						<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp" v-if="!form['source_user_id'] && 0 > 0">
			  <el-form-item label="预订限次">
				<el-input id="limit_times" v-model="form['vehicle_reservation_limit_times']" placeholder="预订限制次数，0为不限"
						  v-if="$check_option('/vehicle_information/view','can_limits')"
				></el-input>
				<div v-else-if="$check_action('/vehicle_information/view','get')" v-html="form['vehicle_reservation_limit_times']"></div>
			  </el-form-item>
			</el-col>
			
	
	
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/vehicle_information/view','set') || $check_action('/vehicle_information/view','add')">
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
				field: "vehicle_information_id",
				url_add: "~/api/vehicle_information/add?",
				url_set: "~/api/vehicle_information/set?",
				url_get_obj: "~/api/vehicle_information/get_obj?",
				url_upload: "~/api/vehicle_information/upload?",

				query: {
					"vehicle_information_id": 0,
				},

				form: {
								"vehicle_no":  '', // 车辆编号
										"vehicle_name":  '', // 车辆名称
										"vehicle_model":  '', // 车辆型号
										"vehicle_brand":  '', // 车辆品牌
										"vehicle_price":  0, // 车辆价格
										"vehicle_picture":  '', // 车辆图片
										"vehicle_introduction":  '', // 车辆介绍
										"vehicle_condition":  '', // 车辆情况
										"vehicle_details":  '', // 车辆详情
											"vehicle_information_id": 0, // ID
													"vehicle_reservation_limit_times": 0, // 预订限制次数
										},
				disabledObj:{
								"vehicle_no_isDisabled": false,
										"vehicle_name_isDisabled": false,
										"vehicle_model_isDisabled": false,
										"vehicle_brand_isDisabled": false,
					          			"vehicle_price_isDisabled": false,
										"vehicle_picture_isDisabled": false,
										"vehicle_introduction_isDisabled": false,
										"vehicle_condition_isDisabled": false,
										"vehicle_details_isDisabled": false,
										},

	
				
				
				
				
				
				
				
				
			
			}
		},
		methods: {

	
	
			
	
			
	
			
	
			
	
						/**
			 * 上传车辆图片
			 * @param {Object} param 图片参数
			 */
			upload_vehicle_picture(param){
									this.uploadFile(param.file, "vehicle_picture");
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
					bl = this.$check_action('/vehicle_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_information/view','get');
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
