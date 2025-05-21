<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
							<el-col v-if="$check_field('get','registered_user') || $check_field('add','registered_user') || $check_field('set','registered_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="注册用户" prop="registered_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_registered_user(form['registered_user']) }}
							<el-select v-if="(form['user_complaints_id'] && $check_field('set','registered_user')) || (!form['user_complaints_id'] && $check_field('add','registered_user'))" id="registered_user" v-model="form['registered_user']" :disabled="disabledObj['registered_user_isDisabled']">
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
							  v-if="(form['user_complaints_id'] && $check_field('set','user_name')) || (!form['user_complaints_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','complaint_title') || $check_field('add','complaint_title') || $check_field('set','complaint_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="投诉标题" prop="complaint_title">
												<el-input id="complaint_title" v-model="form['complaint_title']" placeholder="请输入投诉标题"
							  v-if="(form['user_complaints_id'] && $check_field('set','complaint_title')) || (!form['user_complaints_id'] && $check_field('add','complaint_title'))" :disabled="disabledObj['complaint_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','complaint_title')">{{form['complaint_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','complaint_time') || $check_field('add','complaint_time') || $check_field('set','complaint_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="投诉时间" prop="complaint_time">
								<el-date-picker :disabled="disabledObj['complaint_time_isDisabled']" v-if="(form['user_complaints_id'] && $check_field('set','complaint_time')) || (!form['user_complaints_id'] && $check_field('add','complaint_time'))" id="complaint_time"
						v-model="form['complaint_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','complaint_time')">{{form['complaint_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','complaint_content') || $check_field('add','complaint_content') || $check_field('set','complaint_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="投诉内容" prop="complaint_content">
								<el-input type="textarea" id="complaint_content" v-model="form['complaint_content']" placeholder="请输入投诉内容"
						v-if="(form['user_complaints_id'] && $check_field('set','complaint_content')) || (!form['user_complaints_id'] && $check_field('add','complaint_content'))" :disabled="disabledObj['complaint_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','complaint_content')">{{form['complaint_content']}}</div>
							</el-form-item>
			</el-col>
								<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="(form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())" :disabled="true">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="(form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())" :disabled="true"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
				</el-form-item>
			</el-col>
	
	
	
		
		
	
	
	
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/user_complaints/view','set') || $check_action('/user_complaints/view','add')">
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
				field: "user_complaints_id",
				url_add: "~/api/user_complaints/add?",
				url_set: "~/api/user_complaints/set?",
				url_get_obj: "~/api/user_complaints/get_obj?",
				url_upload: "~/api/user_complaints/upload?",

				query: {
					"user_complaints_id": 0,
				},

				form: {
								"registered_user": 0, // 注册用户
										"user_name":  '', // 用户姓名
										"complaint_title": '', // 投诉标题
										"complaint_time":  '', // 投诉时间
										"complaint_content": '', // 投诉内容
									"examine_state": "未审核",
							"examine_reply": "",
							"user_complaints_id": 0, // ID
													},
				disabledObj:{
								"registered_user_isDisabled": false,
										"user_name_isDisabled": false,
										"complaint_title_isDisabled": false,
										"complaint_time_isDisabled": false,
										"complaint_content_isDisabled": false,
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
							        if (this.form["complaint_time"] && JSON.stringify(this.form["complaint_time"]).indexOf("-")===-1){
            this.form["complaint_time"] = this.$toTime(parseInt(this.form["complaint_time"]),"yyyy-MM-dd hh:mm:ss")
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

																				if(json.result.obj["complaint_time"]=="0000-00-00 00:00:00"){
				  json.result.obj["complaint_time"] = null;
				}
				if(parseInt(json.result.obj["complaint_time"]) > 9999){
					json.result.obj["complaint_time"] = this.$toTime(parseInt(json.result.obj["complaint_time"]),"yyyy-MM-dd hh:mm:ss")
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
																																	if (!param.complaint_title){
					return "投诉标题不能为空";
				}
																	if (!param.complaint_time){
					return "投诉时间不能为空";
				}
																	if (!param.complaint_content){
					return "投诉内容不能为空";
				}
																return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/user_complaints/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/user_complaints/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/user_complaints/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/user_complaints/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/user_complaints/view','get');
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
