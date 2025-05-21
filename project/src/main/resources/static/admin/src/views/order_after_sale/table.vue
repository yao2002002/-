<template>
  <el-main class="bg table_wrap comtabel_t">
    <el-form label-position="right" :model="query" class="form p_4" label-width="120">
      <el-row class="rows row1">
        <!-- 订单号，商品名称， -->
        <el-col :xs="24" :sm="12" :lg="6" class="el_form_search_wrap">
          <el-form-item label="订单号">
            <el-input v-model="query.order_number"></el-input>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12" :lg="6" class="el_form_search_wrap">
          <el-form-item label="商品名称">
            <el-input v-model="query.title"></el-input>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
          <el-form-item label="售后状态">
            <el-select v-model="query.after_state">
              <el-option v-for="o in list_after_state" :key="o" :label="o" :value="o">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>


      </el-row>
      <el-row class="rows row2">

        <el-col :xs="24" :sm="24" :lg="24" class="search_btn_wrap search_btns">
          <el-col :xs="24" :sm="10" :lg="8" class="search_btn_1 search_btn_wrap_1 btns">
            <el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
            <el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
            <el-button v-if="user_group == '管理员' || $check_action('/order_after_sale/view', 'del')"
              class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>

          </el-col>
        </el-col>
      </el-row>

    </el-form>
    <el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%"
      id="dataTable" :key="renderTable">
      <el-table-column fixed type="selection" tooltip-effect="dark" width="55">
      </el-table-column>
      <el-table-column prop="order_number" @sort-change="$sortChange" label="订单号" min-width="200">
      </el-table-column>
      <el-table-column prop="title" @sort-change="$sortChange" label="商品名称" min-width="200">
      </el-table-column>
      <!--<el-table-column prop="price" @sort-change="$sortChange" label="价格" min-width="200">
      </el-table-column>
      <el-table-column prop="num" @sort-change="$sortChange" label="购买数量" min-width="200">
      </el-table-column>-->
      <el-table-column prop="price_count" @sort-change="$sortChange" label="交易总额" min-width="200">
      </el-table-column>


      <el-table-column prop="merchant_id" label="商家" sortable min-width="100">
        <template slot-scope="scope">
          <div>
            {{ list_user.getVal("nickname", { "user_id": scope.row.merchant_id }) }}
          </div>
        </template>
      </el-table-column>


      <el-table-column prop="user_id" label="买家" sortable min-width="100">
        <template slot-scope="scope">
          <div>
            {{ list_user.getVal("nickname", { "user_id": scope.row.user_id }) }}
          </div>
        </template>
      </el-table-column>

      <el-table-column prop="state" @sort-change="$sortChange" label="订单状态" min-width="200">
      </el-table-column>
      <el-table-column prop="after_state" @sort-change="$sortChange" label="售后状态" min-width="200">
      </el-table-column>


      <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
        <template slot-scope="scope">
          {{ $toTime(scope.row["create_time"], "yyyy-MM-dd hh:mm:ss") }}
        </template>
      </el-table-column>

      <el-table-column sortable prop="update_time" label="更新时间" min-width="200">
        <template slot-scope="scope">
          {{ $toTime(scope.row["update_time"], "yyyy-MM-dd hh:mm:ss") }}
        </template>
      </el-table-column>


      <el-table-column fixed="right" label="操作" min-width="200">
        <template slot-scope="scope">
          <div class="view_a">
            <button class="e-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
              @click="goTo_('./view?' + field + '=' + scope.row[field])" size="small"
              v-if="user_group == '管理员' || $check_action('/order_after_sale/view', 'get') || $check_action('/order_after_sale/view', 'set')">
              <span>详情</span>
            </button>
            <button
              v-if="scope.row['after_state'] == '未审核' && (user_group == '管理员' || $check_option('/order_after_sale/table', 'examine'))"
              class="e-button el-button--small is-plain el-button--success" size="small" style="margin: 5px !important;"
              @click="changeSigning(scope.row, scope.$index)">
              审核
            </button>
            <!-- 'order_after_sale_id=' + scope.row['order_after_sale_id'], scope.row['after_state'], -->
          </div>
        </template>
      </el-table-column>

    </el-table>

    <!-- 分页器 -->
    <div class="mt text_center">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="query.page"
        :page-sizes="[7, 10, 30, 100]" :page-size="query.size" layout="total, sizes, prev, pager, next, jumper"
        :total="count">
      </el-pagination>
    </div>
    <!-- /分页器 -->

    <el-dialog title="审核" :visible.sync="dialogVisible" width="30%" :show-close="true" :before-close="handleClose">

      <el-form ref="verifyItem" :model="verifyItem">
        <el-form-item label="售后类型">
          <el-select id="state" v-model="verifyItem.type" readonly
            >
              <el-option v-for="o in after_state_type_list" :disabled="true" :key="o.value" :label="o.label" :value="o.value">
              </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="售后内容">
          <el-input v-model="verifyItem.content_desc" readonly></el-input>
        </el-form-item>
        <el-form-item label="售后凭证">
          <img style="width:100px;margin-right:10px;height:auto;border-radius: 4px;" v-for="(item,index) in verifyItem.imgs" :src="$fullUrl(item)" :key='index' alt="" />
        </el-form-item>
      </el-form>

      <el-form ref="verifyForm" :rules="rules" :model="verifyForm">


        <el-form-item label="售后状态" prop="radio">
          <el-radio-group v-model="verifyForm.radio" style="margin-top:12px">
            <el-radio label="通过"></el-radio>
            <el-radio label="不通过"></el-radio>
          </el-radio-group>
        </el-form-item>


        <el-form-item label="售后回复" prop="reply">
          <el-input type="textarea" placeholder="请填写售后回复" v-model="verifyForm.reply"></el-input>
        </el-form-item>

      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="assureVerify">确 定</el-button>
      </span>
    </el-dialog>

  </el-main>
</template>
<script>
import mixin from "@/mixins/page.js";

export default {
  mixins: [mixin],
  data() {
    return {
      // 获取数据地址
      url_get_list: "~/api/order_after_sale/get_list?like=0",
      url_del: "~/api/order_after_sale/del?",

      // 字段ID
      field: "order_after_sale_id",
      dialogVisible: false,
      verifyItem: {},
      verifyIdx: 0,
      // 查询
      query: {
        "size": 7,
        "page": 1,
        "order_number": "",
        "after_state": "",
        "title": "",
        "login_time": "",
        "create_time": "",
        "orderby": `create_time desc`
      },
      verifyForm: {
        radio: '',
        reply: ''
      },
      rules: {
        "radio": [
          { required: true, message: '请选择审核类型', trigger: 'change' },
        ],
      },
      // 数据
      list: [],
      // 售后状态列表
      list_after_state: ['','未审核', '未通过', '已通过'],
      list_user: [],
      renderTable: Number(Math.random().toString().substr(3, 12) + Date.now()).toString(36),
      after_state_type_list:[  
        { label: '仅退款', value: '1' },
        { label: '退货退款', value: '2' },
        { label: '其他', value: '3' }
      ],
    }
  },
  methods: {
    goTo_(url) {
      this.$router.push(url)
    },

    get_list_before(param) {
      var user_group = this.user.user_group;
      if (user_group != "管理员") {
        if (this.$check_option('/goods/table', 'seller')) {
          param["merchant_id"] = this.user.user_id;
        } else {
          param["ordinary_users"] = this.user.user_id
        }
      }
      return param;
    },
    /**
     * 获取用户
     */
    async get_list_user() {
      console.log('laile')
      var json = await this.$get("~/api/user/get_list?");
      if (json.result) {
        this.list_user = json.result.list;
      } else if (json.error) {
        console.error(json.error);
      }
    },
    changeSigning(query, index) {
      let beforeQuery=JSON.parse(JSON.stringify(query));
      if(!!beforeQuery.imgs){
        beforeQuery.imgs = JSON.parse(beforeQuery.imgs);
      }
      this.verifyItem = beforeQuery;
      this.verifyIdx = index;
      this.dialogVisible = true;
    },
    assureVerify() {
      //审核
      let that = this;
      this.$refs["verifyForm"].validate((valid) => {
        if (valid) {
          that.dialogVisible = false;
          var url = "~/api/order_after_sale/set?order_after_sale_id=" + this.verifyItem['order_after_sale_id']
          that.$post(url, { 'after_state': that.verifyForm.radio, 'after_state_reply': that.verifyForm.reply }, (json, status) => {
            if (json.result) {
              that.list[that.verifyIdx]['after_state'] = that.verifyForm.radio;
            }
          })
        }
      })
    },
    handleClose() {
      //取消审核
      this.verifyForm={
        radio: '',
        reply: ''
      }
      this.dialogVisible = false;
    }

  },
  created() {
    this.get_list_user();
    // var url = "~/api/order_after_sale/set?" + query
    //  this.list[index]['after_state'] =  '已签收' : "待签收"
    // this.$post(url, {'after_state': status}, (json, status) => {
    //   if (json.result) {
    //     this.renderTable = Number(Math.random().toString().substr(3, 12) + Date.now()).toString(36)
    //   } else if (json.error) {
    //     this.$toast(json.error.message, 'danger');
    //   } else {
    //     this.$toast("服务器连接失败！", "danger");
    //   }
    // });
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
</style>
