

/**
 * 接口：
 * 1. 检索接口 /search?name
 * 2. 类型接口    1 2 3 4 5 6 7
 * /type?atc
 */
function http(){
    const express=require("express")
    const mysql=require("mysql")
    let app=express()
    app.all('', function(req, res, next) {
        //设为指定的域
        res.header('Access-Control-Allow-Origin', "");
        res.header("Access-Control-Allow-Headers", "X-Requested-With");
        res.header('Access-Control-Allow-Headers', 'Content-Type');
        res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
        res.header('Access-Control-Allow-Credentials', true);
        res.header("X-Powered-By", ' 3.2.1');
        next();
        });
    //检索接口
    app.get("/search",function (req,res) {
        if(req.query.name===undefined){
            res.send({
                code:"204101",
                msg:"情检查参数是否有误！"
            })
        }else{
            let m=mysql.createConnection({
                host:"127.0.0.1",
                user:"root",
                password:"A339821a",
                database:"raimg"
            })
            m.connect()
            let type=req.query.type
            let sql=""
            if(type!==undefined && type<=7 && type>=0){
                 sql=`select * from imgurl where img_tit LIKE "%${req.query.name}%" and lable=${type}`
            }else{
                sql=`select * from imgurl where img_tit LIKE "%${req.query.name}%"`
            }

            m.query(sql,function (err,data) {
                if(err){
                    console.log(err)
                }else{
                    if(data.length===0){
                        res.send({
                            code:"404",
                            msg:"资源不存在！"
                        })
                    }else{
                        res.send({
                            code:"1",
                            msg:"请求成功！",
                            data:data
                        })
                    }

                }
            })
            m.end()
        }
    })
    //类型接口
    app.get("/type",function (req,res) {
       if(req.query.atc===undefined || req.query.atc===""){
           res.send({
               code:"204101",
               msg:"情检查参数是否有误！"
           })
       }else if(req.query.atc==="1" || req.query.atc==="2" || req.query.atc==="3" || req.query.atc==="4" || req.query.atc==="5" || req.query.atc==="6" || req.query.atc==="7" || req.query.atc==="8"  || req.query.atc==="9" || req.query.atc==="10" || req.query.atc==="11" || req.query.atc==="12" || req.query.atc==="13" || req.query.atc==="14"){
           let m=mysql.createConnection({
               host:"127.0.0.1",
               user:"root",
               password:"A339821a",
               database:"raimg"
           })
           m.connect()
           let sql=`select * from imgurl where lable =${req.query.atc}`
           m.query(sql,function (err,data) {
               if (err) {
                   console.log(err)
               } else {
                   if (data.length === 0) {
                       res.send({
                           code: "404",
                           msg: "资源不存在！"
                       })

                   } else {
                       res.send({
                           code: "1",
                           msg: "查询成功！",
                           data: data
                       })

                   }
               }
           })
       }else{
           res.send({
               code: "10054",
               msg: "错误"
           })
       }
    })
    app.listen("3000","127.0.0.1",function () {
        console.log(`
            后台服务器已开启！
            接口地址：http://127.0.0.1:3000
    `)
    }
    )
}

module.exports={
    http
}
