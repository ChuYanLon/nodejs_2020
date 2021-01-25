/***
 *  所有的类型接口
 **/
const express=require("express")
const mysql=require("mysql")
//
const app=express()
app.use(express.urlencoded({extended:true}))
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
//所有类型接口
app.get("/type",function (req,res) {
       let connection=mysql.createConnection({
           host:"127.0.0.1",
           user:"root",
           password:"A339821a",
           database:"devieo"
       })
    let sql="select * from  video_lable"
    connection.query(sql,function (err,data) {
            if(err){
                console.log(err)
            }else{
                res.send({
                    code:"1",
                    msg:"请求成功！",
                    data:data
                })
                connection.end()
            }
    })
})
// 小类型接口
app.get("/lable",function(req,res){
        if(req.query.atc){
            let conmysql=mysql.createConnection({
                host:"127.0.0.1",
                user:"root",
                password:"A339821a",
                database:"devieo"
            })
            conmysql.connect()
            let sql=`SELECT DISTINCT lable FROM video_all_3 WHERE video_type=${req.query.atc}`
            conmysql.query(sql,function(err,data){
                    if(err){
                        console.log(err)
                    }else{
                        res.send({
                            code:"1",
                            msg:"请求成功！",
                            data:data
                        })
                        conmysql.end()
                    }
            })
        }else{
            res.send({
                code:"1545334",
                msg:"请传入类型ID"
            })
        }
})
//大类型里面的分类接口
app.get("/type/lable",function (req,res) {
        if(req.query.atc===undefined){
            res.send({
                code:"1532154",
                msg:"请传入类型ID"
            })
        }else if(req.query.atc==="1" || req.query.atc==="2" || req.query.atc==="3" || req.query.atc==="4" || req.query.atc==="5" || req.query.atc==="6" || req.query.atc==="7"
        ){
            let conmysql=mysql.createConnection({
                host:"127.0.0.1",
                user:"root",
                password:"A339821a",
                database:"devieo"
            })
            conmysql.connect()
                let sql=`SELECT * FROM video_all_3 where video_type=${req.query.atc} AND region="${req.query.region}" AND lable="${req.query.lable}" and video_time="${req.query.time}" ORDER BY ID ASC LIMIT ${(parseInt(req.query.page)-1)*110},110` 
                conmysql.query(sql,function (err,data) {
                    if(err){
                        res.send({
                            code:"14530021",
                            msg:"传值错误！"
                        })
                    }else{
                        res.send({
                            code:"1",
                            msg:"请求成功！",
                            data:data
                        })
                        conmysql.end()
                    }
                })
        }else{
            res.send({
                code:"156234",
                msg:"传值错误！"
            })
            console.log(req.query)
        }
})
//搜索接口
app.get("/serach",function (req,res) {
       if(req.query.name && req.query.page){
           let conmysql=mysql.createConnection({
               host:"127.0.0.1",
               user:"root",
               password:"A339821a",
               database:"devieo"
           })
           conmysql.connect()
           let sql=`SELECT DISTINCT * FROM video_all_3 WHERE video_type=${req.query.type} and title LIKE "%${req.query.name}%" LIMIT ${(parseInt(req.query.page)-1)*150},150`
           conmysql.query(sql,function (err,data) {
                if(err){
                    console.log(err)
                }else{
                    res.send({
                        code:"1",
                        msg:"请求成功！",
                        data:data
                    })
                    conmysql.end()
                }
           })
       }else{
           res.send({
               code:"1532154",
               msg:"传值错误"
           })
       }
})
// 各种类型精品接口
app.get("/typeBoutique",function(req,res){
        if(req.query.lable && req.query.type){
            let conmysql=mysql.createConnection({
                host:"127.0.0.1",
                user:"root",
                password:"A339821a",
                database:"devieo"
            })
        
            conmysql.connect()
            let sql=`SELECT * FROM video_all_3 WHERE lable="${req.query.lable}" AND video_type=${req.query.type} ORDER BY ID DESC LIMIT 0,10`
            conmysql.query(sql,function(err,data){
                    if(err){
                        res.send({
                            code:"4563154",
                            msg:"传值错误"
                        })
                        console.log(err)
                    }else{
                        res.send({
                            code:"1",
                            msg:"请求成功！",
                            data:data
                        })
                    conmysql.end()
                    }
            })
        }else{
            res.send({
                code:"3265212",
                msg:"lable或type值传递错误！"
            }) 
        }
})
// 轮播图接口
// 热门接口
app.get("/hotMovies",function(req,res){
      if(req.query.type){
        let conmysql=mysql.createConnection({
            host:"127.0.0.1",
            user:"root",
            password:"A339821a",
            database:"devieo"
        })
    
        conmysql.connect()
        let sql=`SELECT * FROM video_all_3 WHERE video_type=${req.query.type} LIMIT 0,5`
        conmysql.query(sql,function(err,data){
            if(err){
                res.send({
                    code:"4546354",
                    msg:"传值错误"
                })
                console.log(err)
            }else{
                res.send({
                    code:"1",
                    msg:"请求成功！",
                    data:data
                })
            conmysql.end()
            }
        })
      }else{
        res.send({
            code:"3256562",
            msg:"type值传递错误！"
        }) 
      }
})
// 登录接口
app.get("/logn",function(req,res){
        if(req.query.username && req.query.password){
              let conmysql=mysql.createConnection({
            host:"127.0.0.1",
            user:"root",
            password:"A339821a",
            database:"user"
        })
        conmysql.connect()
        let sql=`select * from user_all where username=${req.query.username} and userpass=${req.query.password}`
         conmysql.query(sql,function(err,data){
           
            if(err){
                res.send({
                    code:"4544554",
                    msg:"登录失败！"
                })
            }else{
                if(data.length===0){
                    res.send({
                    code:"4544554",
                    msg:"登录失败！"
                })  
                }else{
                    res.send({
                    code:"1",
                    msg:"登录成功！",
                    data:data
                })
                }
               
            conmysql.end()
            }
        })
        }else{
            res.send({
            code:"3256562",
            msg:"值传递错误！"
        }) 
        }
})
// 选项接口
app.get("/type/option",function(req,res){
    
    if(req.query.atc){
        let conmysql=mysql.createConnection({
            host:"127.0.0.1",
            user:"root",
            password:"A339821a",
            database:"devieo"
        })
        conmysql.connect()
        let sql=`SELECT DISTINCT region FROM video_all_3 WHERE video_type=${req.query.atc}`
        conmysql.query(sql,function(err,data){
            if(err){
                res.send({
                    code:"4544554",
                    msg:"传值错误"
                })
                console.log(err)
            }else{
                res.send({
                    code:"1",
                    msg:"请求成功！",
                    data:data
                })
            conmysql.end()
            }
        })
    }else{
        res.send({
            code:"5647562",
            msg:"type值传递错误！"
        }) 
    }
})
// 小类型时间接口
app.get("/type/time",function(req,res){
   if(req.query.atc){
        let conmysql=mysql.createConnection({
            host:"127.0.0.1",
            user:"root",
            password:"A339821a",
            database:"devieo"
        })
        conmysql.connect()
        let sql=`SELECT DISTINCT video_time FROM video_all_3 WHERE video_type=${req.query.atc}`
        conmysql.query(sql,function(err,data){
            if(err){
                res.send({
                    code:"4544554",
                    msg:"传值错误"
                })
                console.log(err)
            }else{
                res.send({
                    code:"1",
                    msg:"请求成功！",
                    data:data
                })
            conmysql.end()
            }
        })
    }else{
        res.send({
            code:"5647562",
            msg:"type值传递错误！"
        }) 
    }

})
app.listen("3000","127.0.0.1",function () {
    console.log(`
            视频后台接口已开启
    `)
})
