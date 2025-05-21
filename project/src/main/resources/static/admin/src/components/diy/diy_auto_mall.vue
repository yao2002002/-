<template>
	<el-form ref="form" :rules="rules" :model="form" status-icon label-width="80px">
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
			<el-form-item label="汽车名称" prop="car_name">
						<el-input id="car_name" v-model="form['car_name']" placeholder="请输入汽车名称"
					v-if="(form['auto_mall_id'] && $check_field('set','car_name') ) || $check_field('add','car_name')"></el-input>
				<div v-else-if="$check_field('get','car_name')">{{form['car_name']}}</div>
					</el-form-item>
		</el-col>
				<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
			<el-form-item label="车型" prop="model">
						<el-input id="model" v-model="form['model']" placeholder="请输入车型"
					v-if="(form['auto_mall_id'] && $check_field('set','model') ) || $check_field('add','model')"></el-input>
				<div v-else-if="$check_field('get','model')">{{form['model']}}</div>
					</el-form-item>
		</el-col>
				<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
			<el-form-item label="参数" prop="parameters">
						<el-input id="parameters" v-model="form['parameters']" placeholder="请输入参数"
					v-if="(form['auto_mall_id'] && $check_field('set','parameters') ) || $check_field('add','parameters')"></el-input>
				<div v-else-if="$check_field('get','parameters')">{{form['parameters']}}</div>
					</el-form-item>
		</el-col>
	


		<el-col :xs="24" :sm="24" :lg="24" style="text-align: center;" class="el_form_btn_warp">
			<el-button type="primary" @click="submit()">提交</el-button>
			<el-button @click="cancel()">取消</el-button>
		</el-col>

	</el-form>
</template>

<script>
	import mixin from "../../mixins/component.js";

	export default {
		mixins: [mixin],
		props:{
			query: {
				type: Object,
				default: function(){
					return {
						"auto_mall_id": 0
					}
				}
			},
			form_goods:{
				type: Object,
				default: function(){
					return {}
				}
			},
			func_check:{
				type: Function,
				default: function(fun){
					console.log("调试输出",fun);
				}
			},
			func_submit:{
				type: Function,
				default: function(fun){
					console.log("调试输出",fun);
				}
			}
		},
		data() {
			return {
				field: "auto_mall_id",
				url_add: "~/api/auto_mall/add?",
				url_set: "~/api/auto_mall/set?",
				url_get_obj: "~/api/auto_mall/get_obj?",
				url_upload: "~/api/auto_mall/upload?",

				form: {
						"car_name":  '',
							"model":  '',
							"parameters":  '',
					},

			
				rules: {
					"car_name": [     {required: true,message: '汽车名称不能为空'},  ],
					"model": [     {required: true,message: '车型不能为空'},  ],
					"parameters": [     {required: true,message: '参数不能为空'},  ],
				}

			}
		},
		methods: {

			/**
			 * 请求列表前
			 * @param {Object} param
			 */
			get_list_before(param) {
				var user_group = this.user.user_group;
				if (user_group !== "管理员") {
					switch (user_group) {
															}
				}

				return param;
			},

	
	
		
	
		
	
	
			submit(){
				this.func_check(()=>{
					this.$refs["form"].validate((valid)} => {
						if (valid) {
							this.submit();
						} else {
							console.error('error 提交失败!!');
						}
					});
				})
			},

			submit_after(){
				var source_id = this.form_goods.source_id;
				if(source_id){
					this.func_submit();
				}else{
					this.$get('~/api/auto_mall/get_obj?',this.form,(res)=>{
						if(res.result && res.result.obj){
							this.form_goods.source_id = res.result.obj["auto_mall_id"];
							this.func_submit();
						}else{
							console.error(res.error);
						}

					})
				}
			}
		},
		created() {
					}
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
</style>
