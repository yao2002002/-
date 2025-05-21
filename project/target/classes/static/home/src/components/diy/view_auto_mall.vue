<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce">
	            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="封面图" prop="cart_avatar">
                    <el-upload class="avatar-uploader" drag accept="image/gif, image/jpeg, image/png, image/jpg"
                               action="" :http-request="upload_cart_img" :show-file-list="false">
                        <img id="cart_img" v-if="form.cart_img" :src="$fullUrl(form.cart_img)" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="主图_1" prop="cart_avatar">
                    <el-upload class="avatar-uploader" drag accept="image/gif, image/jpeg, image/png, image/jpg"
                               action="" :http-request="upload_cart_img_1" :show-file-list="false">
                        <img id="cart_img_1" v-if="form.cart_img_1" :src="$fullUrl(form.cart_img_1)" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="主图_2" prop="cart_avatar">
                    <el-upload class="avatar-uploader" drag accept="image/gif, image/jpeg, image/png, image/jpg"
                               action="" :http-request="upload_cart_img_2" :show-file-list="false">
                        <img id="cart_img_2" v-if="form.cart_img_2" :src="$fullUrl(form.cart_img_2)" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="主图_3" prop="cart_avatar">
                    <el-upload class="avatar-uploader" drag accept="image/gif, image/jpeg, image/png, image/jpg"
                               action="" :http-request="upload_cart_img_3" :show-file-list="false">
                        <img id="cart_img_3" v-if="form.cart_img_3" :src="$fullUrl(form.cart_img_3)" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="主图_4" prop="cart_avatar">
                    <el-upload class="avatar-uploader" drag accept="image/gif, image/jpeg, image/png, image/jpg"
                               action="" :http-request="upload_cart_img_4" :show-file-list="false">
                        <img id="cart_img_4" v-if="form.cart_img_4" :src="$fullUrl(form.cart_img_4)" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="主图_5" prop="cart_avatar">
                    <el-upload class="avatar-uploader" drag accept="image/gif, image/jpeg, image/png, image/jpg"
                               action="" :http-request="upload_cart_img_5" :show-file-list="false">
                        <img id="cart_img_5" v-if="form.cart_img_5" :src="$fullUrl(form.cart_img_5)" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="12" class="el_form_item_warp">
                <el-form-item label="标题" prop="cart_title">
                    <el-input v-model="form.cart_title" placeholder="请输入标题"></el-input>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="12" class="el_form_item_warp">
                <el-form-item label="描述" prop="cart_description">
                    <el-input v-model="form.cart_description" placeholder="请输入描述"></el-input>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="原价" prop="cart_price_ago">
                    <el-input-number v-model="form.cart_price_ago"></el-input-number>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="卖价" prop="cart_price">
                    <el-input-number v-model="form.cart_price"></el-input-number>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="库存" prop="cart_inventory">
                    <el-input-number v-model="form.cart_inventory" placeholder="请输入库存"></el-input-number>
                </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
                <el-form-item label="分类" prop="cart_type">
                    <el-select v-model="form.cart_type">
                        <el-option v-for="(o ,i) in list_cart_goods_type" :value="o.name" :key="i"
                                   :label="o.name"></el-option>
                    </el-select>
                </el-form-item>
            </el-col>
							<el-col v-if="$check_field('get','car_name') || $check_field('add','car_name') || $check_field('set','car_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车名称" prop="car_name">
												<el-input id="car_name" v-model="form['car_name']" placeholder="请输入汽车名称"
							  v-if="(form['auto_mall_id'] && $check_field('set','car_name')) || (!form['auto_mall_id'] && $check_field('add','car_name'))" :disabled="disabledObj['car_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_name')">{{form['car_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','model') || $check_field('add','model') || $check_field('set','model')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车型" prop="model">
												<el-input id="model" v-model="form['model']" placeholder="请输入车型"
							  v-if="(form['auto_mall_id'] && $check_field('set','model')) || (!form['auto_mall_id'] && $check_field('add','model'))" :disabled="disabledObj['model_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','model')">{{form['model']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','parameters') || $check_field('add','parameters') || $check_field('set','parameters')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="参数" prop="parameters">
												<el-input id="parameters" v-model="form['parameters']" placeholder="请输入参数"
							  v-if="(form['auto_mall_id'] && $check_field('set','parameters')) || (!form['auto_mall_id'] && $check_field('add','parameters'))" :disabled="disabledObj['parameters_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','parameters')">{{form['parameters']}}</div>
											</el-form-item>
			</el-col>
						
	
	
		
		
	
	
	
	            <el-col :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
                <el-form-item label="正文" prop="cart_content">
                    <quill-editor v-model="form.cart_content">
                    </quill-editor>
                </el-form-item>
            </el-col>
	
	</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/auto_mall/view','set') || $check_action('/auto_mall/view','add')">
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
				field: "auto_mall_id",
				url_add: "~/api/auto_mall/add?",
				url_set: "~/api/auto_mall/set?",
				url_get_obj: "~/api/auto_mall/get_obj?",
				url_upload: "~/api/auto_mall/upload?",

				query: {
					"auto_mall_id": 0,
				},

				form: {
								"car_name":  '', // 汽车名称
										"model":  '', // 车型
										"parameters":  '', // 参数
						                    cart_title: "",
                    cart_img: "",
                    cart_description: "",
                    cart_price_ago: 0,
                    cart_price: 0,
                    cart_inventory: 0,
                    cart_type: '',
                    cart_content: "",
                    cart_img_1: "",
                    cart_img_2: "",
                    cart_img_3: "",
                    cart_img_4: "",
                    cart_img_5: "",
						"auto_mall_id": 0, // ID
													},
				disabledObj:{
								"car_name_isDisabled": false,
										"model_isDisabled": false,
										"parameters_isDisabled": false,
										},

	
				
				
			                list_cart_goods_type: [],
				goods_form:{
					goods_id: 0,
					title: "",
					img: "",
					description: "",
					price_ago: 0,
					price: 0,
					inventory: 0,
					type: '',
					content: "",
					img_1: "",
					img_2: "",
					img_3: "",
					img_4: "",
					img_5: "",
					source_table: "",
					source_field: "",
					source_id: 0,
					user_id:this.$store.state.user.user_id
				},

			}
		},
		methods: {

	
	
			
	
			
	
		
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
					bl = this.$check_action('/auto_mall/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/auto_mall/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/auto_mall/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/auto_mall/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/auto_mall/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
            /**
             * 获取商品分类
             */
            async get_cart_goods_type() {
                var res = await this.$get("~/api/goods_type/get_list?");
                this.list_cart_goods_type = res.result.list;
            },
            /**
             * 上传封面图
             * @param {Object} param
             */
            upload_cart_img(param) {
                this.uploadFile(param.file, "cart_img");
            },

            /**
             * 上传文件
             * @param {Object} param
             */
            upload_cart_img_1(param) {
                this.uploadFile(param.file, "cart_img_1");
            },

            /**
             * 上传文件
             * @param {Object} param
             */
            upload_cart_img_2(param) {
                this.uploadFile(param.file, "cart_img_2");
            },

            /**
             * 上传文件
             * @param {Object} param
             */
            upload_cart_img_3(param) {
                this.uploadFile(param.file, "cart_img_3");
            },

            /**
             * 上传文件
             * @param {Object} param
             */
            upload_cart_img_4(param) {
                this.uploadFile(param.file, "cart_img_4");
            },

            /**
             * 上传文件
             * @param {Object} param
             */
            upload_cart_img_5(param) {
                this.uploadFile(param.file, "cart_img_5");
            },

            submit_after(){
                console.log(this.form[this.field])
                if (this.form[this.field]){
                    this.submit_goods(this.form[this.field],"set");
                } else {
                    let query_form = {
                        cart_title:this.form.cart_title,
                        cart_description:this.form.cart_description
                    }
                    this.$get("~/api/auto_mall/get_obj?",query_form,(res)=>{
                        console.log("商品息res",res);
                        if(res.result && res.result.obj){
                            this.submit_goods(res.result.obj[this.field],"add");
                        }else if(res.error){
                            console.error(res.error);
                            this.$toast(res.error.message,"error");
                        }
                    })
                }
            },
            submit_goods(source_id,add_flag){
				let customize_field = []
							customize_field.push({"field_name":"汽车名称","field_value":this.form.car_name});
									customize_field.push({"field_name":"车型","field_value":this.form.model});
									customize_field.push({"field_name":"参数","field_value":this.form.parameters});
			                this.goods_form = {
                    goods_id: 0,
                    title: this.form.cart_title,
                    img: this.form.cart_img,
                    description: this.form.cart_description,
                    price_ago: this.form.cart_price_ago,
                    price: this.form.cart_price,
                    inventory: this.form.cart_inventory,
                    type: this.form.cart_type,
                    content: this.form.cart_content,
                    img_1: this.form.cart_img_1,
                    img_2: this.form.cart_img_2,
                    img_3: this.form.cart_img_3,
                    img_4: this.form.cart_img_4,
                    img_5: this.form.cart_img_5,
                    source_table: "auto_mall",
                    source_field: this.field,
                    source_id: source_id,
					customize_field: JSON.stringify(customize_field),
					user_id:this.$store.state.user.user_id
                }
                if (add_flag==='set'){
                    delete this.goods_form.goods_id;
					delete this.goods_form.user_id;
                    // 提交事件
                    this.$post("~/api/goods/set?source_table=auto_mall&source_field=" + this.field + "&source_id=" + source_id,this.goods_form,(res)=>{
                        console.log("提交结果：" ,res)
                        if(res.result){
                            this.$toast("修改成功!" ,"success");
                            this.$router.go(-1);
                        }else if(res.error){
                            console.error(res.error);
                            this.$toast(res.error.message,"error");
                        }
                    });
                }else {
                    // 提交事件
                    this.$post("~/api/goods/add?",this.goods_form,(res)=>{
                        console.log("提交结果：" ,res)
                        if(res.result){
                            this.$toast("添加成功!" ,"success");
                            this.$router.go(-1);
                        }else if(res.error){
                            console.error(res.error);
                            this.$toast(res.error.message,"error");
                        }
                    });
                }
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
						            this.get_cart_goods_type();
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
