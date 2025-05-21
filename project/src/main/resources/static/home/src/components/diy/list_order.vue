<template>
  <div class="list_order">
    <div class="item_order" v-for="(o, i) in list" :key="i">
      <div class="state">
        {{ o.state }}
      </div>
      <div class="goods_list" v-for="(obj, idx) in o.list" :key="idx">
        <router-link :to="'./details?order_number=' + o.order_number" class="item_goods flex_sbc">
          <div class="img_block">
            <img style="width: 4.5rem; height: 4.5rem" :src="$fullUrl(obj[vm.img])" mode="scaleToFill" />
          </div>
          <div class="middle_info">
            <div class="title">
              {{ obj[vm.title] }}
            </div>
            <div class="description">
              {{ obj[vm.description] }}
            </div>
          </div>
          <div class="right_info">
            <div class="price">￥{{ obj[vm.price] }}</div>
            <div class="num">×{{ obj[vm.num] }}</div>
          </div>
        </router-link>
      </div>
      <div class="sum_price flex_sbc">
        <span>实付：￥{{ o.sum_price.toFixed(2) }}</span>
        <b-button @click="del_order(o.order_number, i)" class="btn_del" type="default" size="mini">
          <b-icon icon="trash"></b-icon>
        </b-button>
      </div>

      <div class='after-sales-style'>
        <el-button @click.stop="cancelOrder(o.order_number, i)" class='cancel-btn' type="primary"
          v-if="o.state == '待付款'">取消订单</el-button>
        <el-button @click.stop="afterSaleOrder(o,i)" class='aftersale-btn' type="primary"
          v-if="o.state == '已付款'">售后申请</el-button>
      </div>

    </div>

    <el-dialog title="售后申请" width="56%" :visible.sync="afterSaleDialogVisible" :close-on-click-modal="false"
      append-to-body :show-close="false">
      <div class="">
        <el-form ref='RefDataForm' :rules="rules" label-position="center" :model="form" class="form p_4"
          label-width="120">

          <el-form-item label="售后类型" prop="type">
            <el-select v-model="form.type">
              <el-option v-for="(o, i) in afterSaleStateArr" :key="i" :value="o.value" :label="o.label"></el-option>
            </el-select>
          </el-form-item>


          <el-form-item label="售后内容" prop="content_desc">
            <el-input type="textarea" 
          v-model="form.content_desc"></el-input>
          </el-form-item>


          <el-form-item label="相关凭证" class="is-required">
            <el-upload :accept="imageAccept" :file-list="imgList" :action="url_upload" :on-success="uploadSuccess"
              :on-remove="handleRemovePic" :show-file-list="true" list-type="picture-card" :multiple="true"
              :class="imgList.length > 4 ? 'hide_box' : 'videoUpload'">
              <i v-if="imgList.length < 5" class="el-icon-plus"></i>
            </el-upload>
          </el-form-item>
          <el-form-item style="text-align:right">
            <el-button type="primary" @click="submitAftersale" class="handin-after-sale-btn">立即提交</el-button>
            <el-button @click="cancelAftersale" class="search_btn_reset">取消</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import host_config from "@/plugins/port_config.js";
export default {
  props: {
    list: {
      type: Array,
      default: function () {
        return [];
      },
    },
    vm: {
      type: Object,
      default: function () {
        return {
          order_number: "order_number",
          title: "title",
          img: "img",
          price: "price",
          price_ago: "price_ago",
          price_count: "price_count",
          num: "num",
          goods_id: "goods_id",
          description: "description",
          contact_name: "contact_name",
          contact_phone: "contact_phone",
          contact_address: "contact_address",
          postal_code: "postal_code",
          user_id: "user_id",
        };
      },
    },
  },
  data() {
    return {
      afterSaleDialogVisible: false,
      afterSaleStateArr: [
        { label: '仅退款', value: '仅退款' },
        { label: '退货退款', value: '退货退款' },
        { label: '其他', value: '其他' },
      ],
      form: {
        type: '',
        content_desc: '',
      },
      rules: {
        type: [
          { required: true, message: "请选择售后类型", trigger: "change" },
        ],
        content_desc: [
          { required: true, message: "请输入售后内容", trigger: "blur" },
        ]
      },
      imageAccept: ".jpg,.jpeg,.png,.gif,.bmp",
      imgList: [],
      url_upload: `${host_config}api/order_after_sale/upload?`,
      order_number:'',
      order_id:'',
      goods_id:'',
      afterSaleIdx:''
    };
  },
  methods: {
    cancelOrder(order_number, i) {
      // 取消订单
      let that = this;
      this.$confirm("是否确认取消订单？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(function () {
          that.$post(
            "~/api/order/set?order_number=" + order_number,
            {
              state: "已取消",
            },
            (res) => {
              that.$toast('取消成功！', 'success');
              that.state = "已取消";
              that.list[i].state = "已取消"
            }
          );
        })
        .catch(function () {

        });
    },
    afterSaleOrder(item,idx) {
      // 订单售后申请
      this.order_number=item.order_number;
      this.order_id=item.list[0].order_id;
      this.goods_id=item.list[0].goods_id;
      this.afterSaleIdx=idx;
      this.afterSaleDialogVisible = true;
    },
    submitAftersale() {
      //提交售后服务填写
      let that = this;
      this.$refs.RefDataForm.validate(valid => {
        if (valid) {
          if (this.imgList.length == 0) {
            return this.$message.warning("请上传凭证图片")
          }
		  var port = '';
          let newImgList = this.imgList.map(item => {
			port = item.url.match(/:\d+/g);
            return item.url.split(port[0])[1];
          })
          let beforeListOneMsg=that.list[Number(that.afterSaleIdx)];
          let queryDatas = Object.assign(this.form, { imgs: JSON.stringify(newImgList),order_number:this.order_number,order_id:this.order_id,goods_id:this.goods_id })
          queryDatas.state=beforeListOneMsg.state;
          queryDatas.merchant_id=beforeListOneMsg.list[0].merchant_id;
          queryDatas.user_id=beforeListOneMsg.list[0].user_id;
		  queryDatas.price_count=beforeListOneMsg.sum_price;
          queryDatas.num=beforeListOneMsg.list[0].num;
          queryDatas.price=beforeListOneMsg.list[0].price;
          if(beforeListOneMsg.list.length > 1){
          	queryDatas.title=beforeListOneMsg.list[0].title + '...等' + beforeListOneMsg.list.length + '件商品'
          }else{
          	queryDatas.title=beforeListOneMsg.list[0].title;
          }
            that.$post('~/api/order_after_sale/add?', queryDatas, (res) => {
            if (res.result) {
              // 修改订单状态
              that.$post(
                "~/api/order/set?order_number=" + that.order_number,
                {
                  state: "售后/退款",
                },
                (result) => {
                  that.$toast("添加成功");
                  that.cancelAftersale()
                  that.list[Number(that.afterSaleIdx)].state = "售后/退款"
                }
              );
              
            }
            else if (res.error) {
              this.$toast(res.error.message);
              console.error(res.error);
            }
          })

        }
      })
    },
    cancelAftersale() {
      //取消售后服务填写
      this.afterSaleDialogVisible = false;
      // 还原form表单的值
      this.form = {
        type: '',
        content_desc: '',
      }
      this.imgList=[];
    },
    uploadSuccess(res, file, fileList) {
      //上传图片
      console.log(fileList)
      let _this = this;
      if (file.status === "success") {
        _this.$message({
          message: '上传成功',
          type: 'success'
        })
        if (fileList.every(item => item.status == "success")) {
          //由于fileList是所有的文件包含之前已上传过的，这里需要做区分（带response的即为新上传的）
          fileList.map(item => {
            item.response && this.imgList.push({ url: _this.$fullUrl(item.response.result.url), uid: item.uid })
          })
        }
      } else {
        if (fileList.length > 0) {
          fileList.filter(o => o.uid != file.uid)
        }
      }
      // this.isVideoShow = true
    },
    handleRemovePic(file) {
      // 删除图片
      this.imgList.filter((item, index) => {
        if (item.uid == file.uid) {
          this.imgList.splice(index, 1);
        }
      });
    },
    /**
     * 删除订单
     * @param { Number } order_number 订单编号
     */
    del_order(order_number, i) {
      this.$get(
        "~/api/order/del",
        {
          order_number,
        },
        (res) => {
          this.list.splice(i, 1);
        }
      );
    }
  }
};
</script>

<style scoped>
.flex_cc {
  display: flex;
  justify-content: center;
  align-items: center;
}

.flex_sbc {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.item_order {
  background-color: #ffffff;
  padding: 0.4rem 0.8rem;
  margin-bottom: 0.8rem;
}

.item_order .state {
  text-align: right;
  color: var(--color_primary);
  border-bottom: 2px solid #f8f8f8;
  padding-bottom: 0.5rem;
}

.goods_list .item_goods {
  align-items: stretch;
  padding: 0.2rem;
  border-bottom: 1px solid #f4f4f4;
}

.goods_list .img_block {
  padding: 0.2rem;
}

.goods_list .middle_info {
  width: calc(100% - 8rem);
}

.goods_list .title {
  font-size: 0.9rem;
  min-height: 1.4rem;
}

.goods_list .description {
  color: var(--color_grey);
  font-size: 0.6rem;
}

.goods_list .right_info {
  display: flex;
  flex-direction: column;
}

.goods_list .price {
  font-size: 0.9rem;
}

.goods_list .num {
  color: var(--color_grey);
  text-align: right;
  font-size: 0.5rem;
}

.sum_price {
  height: 2.5rem;
}

.sum_price>text {
  color: var(--color_red);
}

.btn_del {
  padding: 0 1rem;
  margin: 0;
}

.btn_del:hover {
  background: var(--color_info_b);
  border-color: var(--color_info_b);
}

.goods_list {
  position: relative;
}

.after-sales-style {
  text-align: center;
  position: absolute;
  bottom: 0px;
  right: 10px;
  z-index: 99;
}

.after-sales-style .aftersale-btn,
.after-sales-style .cancel-btn {
  font-size: 12px;
  color: #E13A0C;
  cursor: pointer;
  border: 1px solid #E13A0C;
  border-radius: 2px;
  padding: 4px 6px;
  background: #fff;
}

.after-sales-style .cancel-btn:hover {
  background: #666;
  color: #fff;
}

.after-sales-style .cancel-btn {
  color: #666;
  background: #fff;
  border: 1px solid #666;
}

.after-sales-style .aftersale-btn:hover {
  background: #E13A0C;
  color: #fff;
}

::v-deep.hide_box .el-upload.el-upload--picture-card {
  display: none !important;
}

.handin-after-sale-btn{
  background:#96327d !important;
  border-color:#96327d !important;
}
</style>
