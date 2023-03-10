<template>
    <div>
        <p>
            <button v-on:click="add()" class="btn btn-white btn-default btn-round">
                <i class="ace-icon fa fa-edit"></i>
                新增
            </button>
            &nbsp;
            <button v-on:click="list()" class="btn btn-white btn-default btn-round">
                <i class="ace-icon fa fa-refresh"></i>
                刷新
            </button>
        </p>
        <pagination ref="pagination" v-bind:list="list" v-bind:itemCount=5></pagination>
        <table id="simple-table" class="table  table-bordered table-hover">
            <thead>
            <tr><#list fieldList as field>
                    <th>${field.nameCn}</th>
                </#list>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <tr v-for="${domain} in ${domain}s">
                <#list fieldList as field>
                    <th>{{${domain}.${field.nameHump}}}</th>
                </#list>
                <td>
                    <div class="hidden-sm hidden-xs btn-group">

                        <button v-on:click="edit(${domain})" class="btn btn-xs btn-info">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button v-on:click="del(${domain}.id)" class="btn btn-xs btn-danger">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                    </div>

<!--                    <div class="hidden-md hidden-lg">-->
<!--                        <div class="inline pos-rel">-->
<!--                            <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">-->
<!--                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>-->
<!--                            </button>-->

<!--                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">-->
<!--                                <li>-->
<!--                                    <a href="#" class="tooltip-info" data-rel="tooltip" title="View">-->
<!--																			<span class="blue">-->
<!--																				<i class="ace-icon fa fa-search-plus bigger-120"></i>-->
<!--																			</span>-->
<!--                                    </a>-->
<!--                                </li>-->

<!--                                <li>-->
<!--                                    <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">-->
<!--																			<span class="green">-->
<!--																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>-->
<!--																			</span>-->
<!--                                    </a>-->
<!--                                </li>-->

<!--                                <li>-->
<!--                                    <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">-->
<!--																			<span class="red">-->
<!--																				<i class="ace-icon fa fa-trash-o bigger-120"></i>-->
<!--																			</span>-->
<!--                                    </a>-->
<!--                                </li>-->
<!--                            </ul>-->
<!--                        </div>-->
<!--                    </div>-->
                </td>
            </tr>
            <tr>

                <td>123</td>
                <td>test</td>
                <td>1111</td>
                <td>
                    <div class="hidden-sm hidden-xs btn-group">
                        <button class="btn btn-xs btn-info">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button class="btn btn-xs btn-danger">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                    </div>

                    <!--                    <div class="hidden-md hidden-lg">-->
                    <!--                        <div class="inline pos-rel">-->
                    <!--                            <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">-->
                    <!--                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>-->
                    <!--                            </button>-->

                    <!--                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">-->
                    <!--                                <li>-->
                    <!--                                    <a href="#" class="tooltip-info" data-rel="tooltip" title="View">-->
                    <!--																			<span class="blue">-->
                    <!--																				<i class="ace-icon fa fa-search-plus bigger-120"></i>-->
                    <!--																			</span>-->
                    <!--                                    </a>-->
                    <!--                                </li>-->

                    <!--                                <li>-->
                    <!--                                    <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">-->
                    <!--																			<span class="green">-->
                    <!--																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>-->
                    <!--																			</span>-->
                    <!--                                    </a>-->
                    <!--                                </li>-->

                    <!--                                <li>-->
                    <!--                                    <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">-->
                    <!--																			<span class="red">-->
                    <!--																				<i class="ace-icon fa fa-trash-o bigger-120"></i>-->
                    <!--																			</span>-->
                    <!--                                    </a>-->
                    <!--                                </li>-->
                    <!--                            </ul>-->
                    <!--                        </div>-->
                    <!--                    </div>-->
                </td>
            </tr>


            </tbody>
        </table>
        <!--模态框 -->
        <div id="form-modal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">表单</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">

                            <#list fieldList as field>
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">${field.nameCn}</label>
                                    <div class="col-sm-10">
                                        <input  v-model = "${domain}.${field.nameHump}" class="form-control"  >
                                    </div>
                                </div>
                            </#list>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button v-on:click="save()" type="button" class="btn btn-primary">保存</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

    </div>
</template>

<script>
    import Pagination from "../components/pagination"

    export default {
        components: {Pagination},
        name: '${domain}',
        data: function(){
          return {
              ${domain}: {},
              ${domain}s: []
          }

        },
        mounted() {
            // this.$parent.activeSidebar("${module}-${domain}-sidebar")
            let _this = this;
            _this.$refs.pagination.size = 5;
            _this.list(1);
        },

        methods: {
            add(){
                let _this = this;
                _this.${domain} = {};
                $("#form-modal").modal("show");
            },
            list(page){
                let _this = this;
                loading.show();
                // page: page;
                // size: _this.$refs.pagination.size,
                _this.$ajax.post(process.env.VUE_APP_SERVER+'/${module}/admin/${domain}/list',{
                    page:page,
                    size:_this.$refs.pagination.size,}).then((response)=>{
                    console.log("查询大章节列表结果:",response);
                    loading.hide();
                    let resp = response.data;
                    _this.${domain}s = response.data.content.list;
                    _this.$refs.pagination.render(page,resp.content.total)
                })
            },
            edit(${domain}){
                let _this = this;
                _this.${domain} = $.extend({},${domain});

                // page: page;
                // size: _this.$refs.pagination.size,
               $("#form-modal").modal("show");
            },

            save(${domain}){
                let _this = this;
                loading.show();

                //保存之前进行校验
                // page: page;
                // size: _this.$refs.pagination.size,
                _this.$ajax.post(process.env.VUE_APP_SERVER+'/${module}/admin/${domain}/save',_this.${domain}).then((response)=>{
                    loading.hide();
                    console.log("保存大章节列表结果:",response);
                    let resp = response.data;
                    if(resp.success){
                        $("#form-modal").modal("hide")
                        _this.list(1)
                        toast.success("保存成功!");
                    }else {
                        toast.warning(resp.message);
                    }
                })
            },
            del(id){
                let _this = this;
                // page: page;
                // size: _this.$refs.pagination.size,
                // Swal.fire({
                //     title: '确定删除该数据吗?',
                //     text: "删除之后不能恢复,确认删除吗?",
                //     icon: 'warning',
                //     showCancelButton: true,
                //     confirmButtonColor: '#3085d6',
                //     cancelButtonColor: '#d33',
                //     confirmButtonText: '是的,删除!'
                // })
                confirm.show("确定删除吗?????",function () {
                    loading.show();
                    _this.$ajax.post(process.env.VUE_APP_SERVER+'/${module}/admin/${domain}/delete/'+id)
                        .then((response)=>{
                            console.log("删除大章节列表结果:",response);
                            let resp = response.data;
                            if(resp.success){
                                _this.list(1)
                                toast.success("删除成功!!aaa")
                            }
                        })



                })
               //
               // swal.del("确定删除aaa吗?")
               //     .then((result) => {
               //      _this.$ajax.post('http://127.0.0.1:9000/${module}/admin/${domain}/delete/'+id)
               //          .then((response)=>{
               //          console.log("删除大章节列表结果:",response);
               //          let resp = response.data;
               //          if(resp.success){
               //              _this.list(1)
               //          }
               //      })
               //      if (result.isConfirmed) {
               //         toast.success("删除成功!")
               //      }
               //  })

            }
        }
    }
</script>