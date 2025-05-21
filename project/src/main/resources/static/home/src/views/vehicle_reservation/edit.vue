<template>
	<div class="diy_edit page_vehicle_reservation" id="vehicle_reservation_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','vehicle_no') || $check_field('add','vehicle_no') || $check_field('get','vehicle_no')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								车辆编号:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_vehicle_no" v-model="form['vehicle_no']" placeholder="请输入车辆编号" v-if="(form['vehicle_no'] && $check_field('set','vehicle_no')) || (!form['vehicle_no'] && $check_field('add','vehicle_no'))"  :disabled="disabledObj['vehicle_no_isDisabled']"/>
							<span v-else-if="$check_field('get','vehicle_no')">{{ form['vehicle_no'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','vehicle_name') || $check_field('add','vehicle_name') || $check_field('get','vehicle_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								车辆名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_vehicle_name" v-model="form['vehicle_name']" placeholder="请输入车辆名称" v-if="(form['vehicle_name'] && $check_field('set','vehicle_name')) || (!form['vehicle_name'] && $check_field('add','vehicle_name'))"  :disabled="disabledObj['vehicle_name_isDisabled']"/>
							<span v-else-if="$check_field('get','vehicle_name')">{{ form['vehicle_name'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','vehicle_model') || $check_field('add','vehicle_model') || $check_field('get','vehicle_model')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								车辆型号:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_vehicle_model" v-model="form['vehicle_model']" placeholder="请输入车辆型号" v-if="(form['vehicle_model'] && $check_field('set','vehicle_model')) || (!form['vehicle_model'] && $check_field('add','vehicle_model'))"  :disabled="disabledObj['vehicle_model_isDisabled']"/>
							<span v-else-if="$check_field('get','vehicle_model')">{{ form['vehicle_model'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','vehicle_brand') || $check_field('add','vehicle_brand') || $check_field('get','vehicle_brand')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								车辆品牌:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_vehicle_brand" v-model="form['vehicle_brand']" placeholder="请输入车辆品牌" v-if="(form['vehicle_brand'] && $check_field('set','vehicle_brand')) || (!form['vehicle_brand'] && $check_field('add','vehicle_brand'))"  :disabled="disabledObj['vehicle_brand_isDisabled']"/>
							<span v-else-if="$check_field('get','vehicle_brand')">{{ form['vehicle_brand'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','vehicle_price') || $check_field('add','vehicle_price') || $check_field('get','vehicle_price')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								车辆价格:
							</span>
						</div>
								<!-- 数字 -->
						<div class="diy_field diy_number">
							<input type="number" id="form_vehicle_price" v-model.number="form['vehicle_price']" placeholder="请输入车辆价格" v-if="(form['vehicle_price'] && $check_field('set','vehicle_price')) || (!form['vehicle_price'] && $check_field('add','vehicle_price'))" :disabled="disabledObj['vehicle_price_isDisabled']" />
							<span v-else-if="$check_field('get','vehicle_price')">{{ form['vehicle_price'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','registered_user') || $check_field('add','registered_user') || $check_field('get','registered_user')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								注册用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_registered_user" :disabled="disabledObj['registered_user_isDisabled']" v-model="form['registered_user']" v-if="(form['registered_user'] && $check_field('set','registered_user')) || (!form['registered_user'] && $check_field('add','registered_user'))" >
								<option v-for="o in list_user_registered_user" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','registered_user')">{{ get_user_info("registered_user", form['registered_user']) }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','user_name') || $check_field('add','user_name') || $check_field('get','user_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								用户姓名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_user_name" v-model="form['user_name']" placeholder="请输入用户姓名" v-if="(form['user_name'] && $check_field('set','user_name')) || (!form['user_name'] && $check_field('add','user_name'))"  :disabled="disabledObj['user_name_isDisabled']"/>
							<span v-else-if="$check_field('get','user_name')">{{ form['user_name'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','contact_information') || $check_field('add','contact_information') || $check_field('get','contact_information')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								联系方式:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_contact_information" v-model="form['contact_information']" placeholder="请输入联系方式" v-if="(form['contact_information'] && $check_field('set','contact_information')) || (!form['contact_information'] && $check_field('add','contact_information'))"  :disabled="disabledObj['contact_information_isDisabled']"/>
							<span v-else-if="$check_field('get','contact_information')">{{ form['contact_information'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','booking_quantity') || $check_field('add','booking_quantity') || $check_field('get','booking_quantity')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								预订数量:
							</span>
						</div>
								<!-- 数字 -->
						<div class="diy_field diy_number">
							<input type="number" id="form_booking_quantity" v-model.number="form['booking_quantity']" placeholder="请输入预订数量" v-if="(form['booking_quantity'] && $check_field('set','booking_quantity')) || (!form['booking_quantity'] && $check_field('add','booking_quantity'))" :disabled="disabledObj['booking_quantity_isDisabled']" />
							<span v-else-if="$check_field('get','booking_quantity')">{{ form['booking_quantity'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','reservation_remarks') || $check_field('add','reservation_remarks') || $check_field('get','reservation_remarks')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								预订备注:
							</span>
						</div>
								<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_reservation_remarks" v-model="form['reservation_remarks']" v-if="(form['reservation_remarks'] && $check_field('set','reservation_remarks')) || (!form['reservation_remarks'] && $check_field('add','reservation_remarks'))" :disabled="disabledObj['reservation_remarks_isDisabled']" />
							<span v-else-if="$check_field('get','reservation_remarks')">{{ form['reservation_remarks'] }}</span>
						</div>
							</div>
	




				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/vehicle_reservation/get_obj?",
				url_add: "~/api/vehicle_reservation/add?",
				url_set: "~/api/vehicle_reservation/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"vehicle_no": "",
							"vehicle_name": "",
							"vehicle_model": "",
							"vehicle_brand": "",
							"vehicle_price": 0,
							"registered_user": 0,
							"user_name": "",
							"contact_information": "",
							"booking_quantity": 0,
							"reservation_remarks": "",
						"vehicle_reservation_id": 0,
				},

				obj: {
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
						"vehicle_reservation_id": 0,
				},

				// 表单字段
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
						"vehicle_reservation_id": 0,
				},
				disabledObj:{
						"vehicle_no_isDisabled": false,
							"vehicle_name_isDisabled": false,
							"vehicle_model_isDisabled": false,
							"vehicle_brand_isDisabled": false,
									"registered_user_isDisabled": false,
							"user_name_isDisabled": false,
							"contact_information_isDisabled": false,
									"reservation_remarks_isDisabled": false,
					},

																					// 用户列表
				list_user_registered_user: [],
														
				// ID字段
				field: "vehicle_reservation_id",

			}
		},
		methods: {
																																																																																						formatDateValue(value) {
		  const date = new Date(value);
		  return `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}`;
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
					async get_user_session_registered_user(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=注册用户");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["registered_user"] = user_id
								_this.disabledObj['registered_user' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "registered_user") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
				
				
				
				
		  		get_user_info(name,id){
				var obj = null;
            				  if (name == 'registered_user'){
					  obj = this.list_user_registered_user.getObj({"user_id":id});
				  }
          				var ret = "";
				if(obj){
				  ret = obj.nickname+"-"+obj.username;
				}
				return ret;
			},
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/vehicle_reservation/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},
			
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file_multiple(files, str) {
				let _this = this;
				var form = new FormData();
				for (var i = 0; i < files.length; i++) {
					form.set("file", files[i]);
					_this.$post("~/api/vehicle_reservation/upload?", form, (res) => {
						if (res.result) {
							if (_this.form[str].length > 0) {
								_this.form[str].push(res.result.url);
							} else {
								_this.form[str] = [res.result.url];
							}
						} else if (res.error) {
							_this.$toast(res.error.message);
						}
					});
				}
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
			  if(arr[i] === "source_table"){
			  	this.form['source_table'] = form[arr[i]]
			  }
			  if(arr[i] === "source_id"){
			  	this.form['source_id'] = form[arr[i]]
			  }
			  if(arr[i] === "source_user_id"){
			  	this.form['source_user_id'] = form[arr[i]]
			  }
            }
          }
        }
																														
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }

				if(func){
					func(json);
				}
			},

		},
		created() {
																				this.get_user_session_registered_user();
					this.get_list_user_registered_user();
															},
	}
</script>

<style>
	.diy_compute{
		line-height: 40px;
	}
	.diy_field.diy_img_multiple{
		margin: 0;
	}
	.diy_field.diy_img_multiple div{
		float: left;
		position: relative;
		margin: 0 10px 10px 0;
	}
	.diy_field.diy_img_multiple img{
		height: 100px;
		width: auto;
	}
	.diy_field.diy_img_multiple span{
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
