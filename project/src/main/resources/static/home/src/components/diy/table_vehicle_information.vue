<template>
  <el-main class="bg table_wrap">
    <el-form label-position="right" :model="query" class="form p_4" label-width="120">
      <el-row class="rows row1">

          
                                                                                              <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="车辆名称">
                                                      <el-input v-model="query.vehicle_name"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                      <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
                      <el-form-item label="车辆型号">
                                                      <el-input v-model="query.vehicle_model"></el-input>
                                                </el-form-item>
                    </el-col>
                                                                                                                                                                                                                                                                </el-row>
      <el-row class="rows row2">
      	<el-col :xs="24" :sm="24" :lg="24" class="search_btn_wrap search_btns">
         <el-col :xs="24" :sm="10" :lg="8" class="search_btn_1 search_btn_wrap_1 btns">
                              <el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
                <el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
                                                      <el-button v-if="$check_action('/vehicle_information/table','add') || $check_action('/vehicle_information/view','add')" @click="$router.push('./view?')" class="add">添加</el-button>
            <el-button v-if="$check_action('/vehicle_information/table','del') || $check_action('/vehicle_information/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
                        </el-col>
       
        </el-col>
      </el-row>
    </el-form>
	    <el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
	                <el-table-column fixed type="selection" tooltip-effect="dark" width="55">
            </el-table-column>
                                                  <el-table-column prop="vehicle_no" @sort-change="$sortChange" label="车辆编号"                                v-if="$check_field('get','vehicle_no')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="vehicle_name" @sort-change="$sortChange" label="车辆名称"                                v-if="$check_field('get','vehicle_name')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="vehicle_model" @sort-change="$sortChange" label="车辆型号"                                v-if="$check_field('get','vehicle_model')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="vehicle_brand" @sort-change="$sortChange" label="车辆品牌"                                v-if="$check_field('get','vehicle_brand')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="vehicle_price" @sort-change="$sortChange" label="车辆价格"                                v-if="$check_field('get','vehicle_price')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="vehicle_picture" @sort-change="$sortChange" label="车辆图片"                                v-if="$check_field('get','vehicle_picture')" min-width="200">
                                      <template slot-scope="scope">
                      <el-image style="width: 100px; height: 100px" :src="$fullUrl(scope.row['vehicle_picture'])"
                                :preview-src-list="[$fullUrl(scope.row['vehicle_picture'])]">
                        <div slot="error" class="image-slot">
                          <img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
                        </div>
                      </el-image>
                    </template>
				                </el-table-column>
                                              <el-table-column prop="vehicle_introduction" @sort-change="$sortChange" label="车辆介绍"                                v-if="$check_field('get','vehicle_introduction')" min-width="200">
                                </el-table-column>
                                              <el-table-column prop="vehicle_condition" @sort-change="$sortChange" label="车辆情况"                                v-if="$check_field('get','vehicle_condition')" min-width="200">
                                </el-table-column>
                                                    				        
        
                
      <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
        <template slot-scope="scope">
          {{ $toTime(scope.row["create_time"],"yyyy-MM-dd hh:mm:ss") }}
        </template>
      </el-table-column>

      <el-table-column sortable prop="update_time" label="更新时间" min-width="200">
        <template slot-scope="scope">
          {{ $toTime(scope.row["update_time"],"yyyy-MM-dd hh:mm:ss") }}
        </template>
      </el-table-column>

        
        
        
        
        

                <el-table-column fixed="right" label="操作" min-width="120" v-if="$check_action('/vehicle_information/table','set') || $check_action('/vehicle_information/view','set') || $check_action('/vehicle_information/view','get')
					 ">
        

      <template slot-scope="scope">
        <router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
                     v-if="$check_action('/vehicle_information/table','set') || $check_action('/vehicle_information/view','set') || $check_action('/vehicle_information/view','get')"
                                 :to="'./view?' + field + '=' + scope.row[field]"
                                 size="small">
          <span>详情</span>
        </router-link>
                                                            <router-link v-if="$check_comment('/vehicle_information/table')" class="el-button el-button--small is-plain el-button--primary"
                             :to="'../comment/table?size=10&page=1&source_table=vehicle_information&source_field=' + field + '&source_id=' + scope.row[field]" size="small">
                  查看评论
                </router-link>
                                  		  		        </template>
    </el-table-column>

    </el-table>

    <!-- 分页器 -->
    <div class="mt text_center">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                     :current-page="query.page" :page-sizes="[7, 10, 30, 100]" :page-size="query.size"
                     layout="total, sizes, prev, pager, next, jumper" :total="count">
      </el-pagination>
    </div>
    <!-- /分页器 -->
                                                                                                                                                                  
    <div class="modal_wrap" v-if="showModal">
      <div class="modal_box">
        <!-- <div class="modal_box_close" @click="closeModal">X</div> -->
        <p class="modal_box_title">重要提醒</p>
        <p class="modal_box_text">当前有数据达到预警值！</p>
        <p class="modal_box_text">{{ message }}</p>
        <div class="btn_box">
          <span @click="closeModal">取消</span>
          <span @click="closeModal">确定</span>
        </div>
      </div>
    </div>


  </el-main>
</template>
<script>
  import mixin from "@/mixins/page.js";
  
  export default {
    mixins: [mixin],
    data() {
      return {
        // 弹框
        showModal: false,
        // 获取数据地址
        url_get_list: "~/api/vehicle_information/get_list?like=0",
        url_del: "~/api/vehicle_information/del?",

        // 字段ID
        field: "vehicle_information_id",
        // 查询
        query: {
          "size": 7,
          "page": 1,
                                                                                                  "vehicle_name": "",
                                                                                                          "vehicle_model": "",
                                                                                                                                                                                                                                                                  "login_time": "",
          "create_time": "",
          "orderby": `create_time desc`
        },

                  // 数据
        list: [],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                		  		  message: '',
      }
    },
    methods: {
      // 关闭弹框
      closeModal(){
        this.showModal = false;
      },
        		  /**
		   * @description 获取到列表事件
		   * @param {Object} res 响应结果
		   */
		  get_list_after: function get_list_after(res, func, url) {
		  	let _this = this
																															  },
        
        
                                                                                                                                                                                                                                                                                                                
        
        
        
                                                                                                                                                                                                                                                                                                                                		      deleteRow(index, rows) {
        rows.splice(index, 1);
      },

    },
	    created() {
                                                                                                                                                                                                                                                                                                                            }
  }
</script>

<style type="text/css">
  .bg {
    background: white;
  }

  .form.p_4 {
    padding: 1rem;
  }

  .form .el-input {
    width: initial;
  }

  .mt {
    margin-top: 1rem;
  }

  .text_center {
    text-align: center;
  }

  .float-right {
    float: right;
  }


  .modal_wrap{
    width: 100vw;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    background: rgba(0,0,0,0.5);
    z-index: 9999999999;
  }
  .modal_wrap .modal_box{
    width: 400px;
    height: auto;
    background: url("../../assets/modal_bg.jpg") no-repeat center;
    background-size: cover;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -200px;
    margin-top: -100px;
    border-radius: 10px;
    padding: 10px;
  }
  .modal_wrap .modal_box .modal_box_close{
    font-size: 20px;
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
  }
  .modal_wrap .modal_box .modal_box_title{
    text-align: center;
    font-size: 18px;
    margin: 16px auto;
    color: #fff;
    border-bottom: 1px solid rgba(117, 116, 116,0.5);
    padding-bottom: 16px;
    width: 356px;
  }
  .modal_wrap .modal_box .modal_box_text{
    text-align: center;
    font-size: 14px;
    color: #fff;
    margin: 5px auto;
    width: 90%;
  }
  .modal_wrap .modal_box .btn_box{
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 42px;
  }
  .modal_wrap .modal_box .btn_box span{
    display: inline-block;
    width: 80px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    border: 1px solid #ccc;
    font-size: 14px;
    cursor: pointer;
    color: #fff;
  }
  .modal_wrap .modal_box .btn_box span:nth-child(2){
    background: #409EFF;
    color: #fff;
    border-color: #409EFF;
    margin-left: 15px;
  }
  .el-date-editor .el-range-separator{
  	width: 10% !important;
  }
</style>
