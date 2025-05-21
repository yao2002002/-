<template>
  <el-main class="bg edit_wrap comtable_e">
    <el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
      <el-row class="row_ce">
        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="订单号" prop="order_number">
            <el-input  :disabled="true" id="order_number" v-model="form['order_number']" placeholder="请输入订单号"
            ></el-input>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="商品名称" prop="title">
            <el-input  :disabled="true" id="title" v-model="form['title']" 
            ></el-input>
          </el-form-item>
        </el-col>
        <!--<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="价格" prop="price">
            <el-input  :disabled="true" id="price" v-model="form['price']" placeholder="请输入购买数量"
            ></el-input>
          </el-form-item>
        </el-col>-->
        <!--<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="购买数量" prop="num">
            <el-input  :disabled="true" id="num" v-model="form['num']" placeholder="请输入购买数量"
            ></el-input>
          </el-form-item>
        </el-col>-->
        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="交易总额" prop="price_count">
            <el-input-number  :disabled="true" id="price_count" v-model.number="form['price_count']"
            ></el-input-number>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="卖家" prop="merchant_id">
            <el-select v-model="form.merchant_id" placeholder="请选择" :disabled="true">
              <el-option :key="-1" label="未选择" :value="0">
              </el-option>
              <el-option v-for="(o,i) in list_user" :key="i" :label="o.nickname" :value="o.user_id">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="买家" prop="user_id">
            <el-select v-model="form.user_id" placeholder="请选择" :disabled="true">
              <el-option :key="-1" label="未选择" :value="0">
              </el-option>
              <el-option v-for="(o,i) in list_user" :key="i" :label="o.nickname" :value="o.user_id">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>
  
        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="订单状态" prop="state">
            <el-select id="state" v-model="form.state" :disabled="true"
            >
              <el-option v-for="o in order_state_list" :key="o" :label="o" :value="o">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="售后类型" prop="type">
            <el-select id="type" v-model="form['type']" :disabled="true"
            >
              <el-option v-for="o in after_state_type_list" :key="o.value" :label="o.label" :value="o.value">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="售后内容" prop="content_desc">
            <el-input type="textarea" v-model="form['content_desc']" :disabled="true"></el-input>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :lg="24" class="el_form_item_warp">
          <el-form-item label="售后凭证" prop="imgs">
             <img style="height:100px;margin-right:10px;width:auto;border-radius: 4px;" v-for="(item,index) in form['imgs']" :src="$fullUrl(item)" :key='index' alt="" />
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="售后状态" prop="after_state">
            <el-select id="after_state" v-model="form['after_state']" :disabled="true"
            >
              <el-option v-for="o in list_aftersale_status" :key="o" :label="o" :value="o">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>

        <el-col v-if="form['after_state']!='未审核'" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
          <el-form-item label="售后回复" prop="after_state_reply">
            <el-input type="textarea" v-model="form['after_state_reply']" :disabled="true"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
        <el-form-item v-if="$check_action('/order_after_sale/view','set') || $check_action('/order_after_sale/view','add')">
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
      field: "order_after_sale_id",
      url_add: "~/api/order_after_sale/add?",
      url_set: "~/api/order_after_sale/set?",
      url_get_obj: "~/api/order_after_sale/get_obj?",
      url_upload: "~/api/order_after_sale/upload?",

      query: {
        "order_after_sale_id": 0,
      },

      form: {
        "order_number": '', // 订单号
        "title": '', // 商品名称
        "num": '', // 购买数量
        "price": '', // 单价
        "price_count": '', // 交易总额
        "merchant_id":'',//卖家
        "user_id":'',//买家
        "order_after_sale_id": 0, // ID
        "after_state":"",//售后状态
        "after_state_reply":"",//售后回复
        "content_desc":"",//售后内容
        "imgs":[],
        "type":"",//售后类型
        "state":"",//订单状态
      },
      disabledObj: {
        "order_number_isDisabled": false,
        "title_isDisabled": false,
        "price_isDisabled": false,
        "num_isDisabled": false,
        "price_count_isDisabled": false,
        "merchant_id_isDisabled": false,
        "user_id_isDisabled": false,
      },
      list_user: [],
      after_state_type_list:[  
        { label: '仅退款', value: '1' },
        { label: '退货退款', value: '2' },
        { label: '其他', value: '3' }
      ],
      order_state_list:['待付款','待发货','待签收','已签收','待退款','售后/退款'],
      list_aftersale_status:['未审核','未通过','已通过']

    }
  },
  methods: {
    
      /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
     get_obj_after(json, func) {
  
        if (!this.form["after_state"]) {
          this.form["after_state"] = '未审核';
        }
        if(!!this.form['imgs']){
          this.form["imgs"]=JSON.parse(this.form["imgs"]);
        }
        this.form['user_id']=Number(this.form['user_id'])
        this.form['merchant_id']=Number(this.form['merchant_id'])
        console.log( this.form)
      },
    /**
     * 提交前验证事件
     * @param {Object} 请求参数
     * @return {String} 验证成功返回null, 失败返回错误提示
     */
    submit_check(param) {
      let msg = null
      return msg;
    },

    is_view() {
      var bl = this.user_group == "管理员";

      if (!bl) {
        bl = this.$check_action('/order_after_sale/table', 'add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if (!bl) {
        bl = this.$check_action('/order_after_sale/table', 'set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if (!bl) {
        bl = this.$check_action('/order_after_sale/view', 'add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if (!bl) {
        bl = this.$check_action('/order_after_sale/view', 'set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if (!bl) {
        bl = this.$check_action('/order_after_sale/view', 'get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },
    /**
     * 获取用户
     */
    async get_list_user() {
      var json = await this.$get("~/api/user/get_list?");
      if (json.result) {
        this.list_user = json.result.list;
      } else if (json.error) {
        console.error(json.error);
      }
    }

  },
  created() {
    this.get_list_user()
  },
}
</script>
