const express = require('express');
const router = express.Router();
const dangkymodel = require('../../models/dangnhap');
const bcrypt = require('bcryptjs');
const configg = require('../../config/default.json');
require('express-async-errors');
const uuid = require('uuid');
const AWS = require('aws-sdk');

const s3 = new AWS.S3(
  { 
    accessKeyId:'AKIA3GW5TNQ7R7O4MVF7',
    secretAccessKey:'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',
  }
);
//authu
const restrict = require('../../middelwase/auth');
//chat

router.get('/xacthuc', async (req,res)=>{
    res.render('xacthuc');
})
router.get('/',async (req,res)=>{

    res.render('dangNhap');
});
router.get('/dangky',async (req,res)=>{
    res.render('dangky');
});
router.get('/thongtin',async(req,res)=>{
    const soban = await table_banbe.dembanbe(req.session.AuthUser.ma_tk);
    const sonhom = await table_tk_nhom.demsonhom(req.session.AuthUser.ma_tk);
    let a=0;
    for(let i= 0;i<sonhom.length;i++){
        a++
    }
    console.log(a);
    console.log(soban);
    const data={soban:soban,sonhom:a};
    console.log(data);
    res.render('thongtin-user',{data:data});
});
router.get('/suathongtin',async(req,res)=>{
    const soban = await table_banbe.dembanbe(req.session.AuthUser.ma_tk);
    const sonhom = await table_tk_nhom.demsonhom(req.session.AuthUser.ma_tk);
    let a=0;
    for(let i= 0;i<sonhom.length;i++){
        a++
    }
    console.log(a);
    console.log(soban);
    const data={soban:soban,sonhom:a};
    console.log(data);
    res.render('suathongtin',{data:data});
});
router.post('/dangky',async (req,res)=>{
    const pass_hash = bcrypt.hashSync(req.body.matkhau,configg.authentication.saltRounds);
    const entity={
        ten_tk: req.body.ten,
        sdt: req.body.sdt,
        email:req.body.email,
        mat_khau:pass_hash,
        quyen:'cá nhân',
        url:'https://detaizalo.s3.ap-southeast-1.amazonaws.com/anhmacdinh.jpg'
    }
    console.log(entity);
    await dangkymodel.add(entity);
    res.redirect('/');
});

router.post('/',async (req,res)=>{
    const user = await dangkymodel.singlebysdt(req.body.sdt);
    //console.log(user);
    if(user=== null){
         res.render('dangNhap',{
            layout:false,
            err:'Sđt hoặc mật khẩu không đúng'
        });
    };
    
    const rss = bcrypt.compareSync(req.body.password,user.mat_khau);
    if(rss=== false){
        return res.render('dangNhap',{
            layout:false,
            err:'Sđt hoặc mật khẩu không đúng'
        });
    }
    //lay du lieu cho reqqquet khác
    delete user.mat_khau;
    req.session.isAuthenticated = true;
    req.session.AuthUser = user;
    //res.send({rediskey: user});
    const url = req.query.retUrl ||  '/chat';
    res.redirect(url);
    
});

router.post('/dangxuat',restrict,async (req,res)=>{
    req.session.isAuthenticated = false;
    req.session.AuthUser = null;
    res.render('/');
});
router.get('/chat/danhsachbanbe',async (req,res)=>{
    //const session = req.session.AuthUser;
    //console.log(req.session.AuthUser);
 const ds_idbanbe =  await table_banbe.single(req.session.AuthUser.ma_tk);
 var danhsachbanbe = [];
  for(let i=0;i<ds_idbanbe.length;i++){
      const thongtinbanbe = await dangkymodel.single(ds_idbanbe[i].id_banbe);
      danhsachbanbe.push(thongtinbanbe);
  }
 // console.log(danhsachbanbe);
    res.send({ds_banbe:danhsachbanbe});
});
router.get('/chat',restrict,async (req,res)=>{
    //const session = req.session.AuthUser;
    //console.log(req.session.AuthUser);
    res.render('chat');
});
const table_tinnhan = require('../../models/tinnhan');
router.get('/chat/danhsachtinnhan/:id',async (req,res)=>{
    //const id_tinnhanUser = await table_tinnhan.single(req.session.AuthUser.ma_tk);
   // const ten_nguoi_nhan = await dangkymodel.single(req.params.id);
    const danhsachtinnhan = await table_tinnhan.timtatcatinnhan(req.session.AuthUser.ma_tk,req.params.id);
    // const nguoigui = await table_tinnhan.timtinnhan(req.session.AuthUser.ma_tk,req.params.id);
    // const nguoinhan = await table_tinnhan.timtinnhan(req.params.id,req.session.AuthUser.ma_tk);
    //console.log(nguoigui);
   // console.log(nguoinhan);
    //    const mang_tinnhan = {
    //        ten_nguoigui : req.session.AuthUser.ten_tk,
    //        url_nguoigui : req.session.AuthUser.url,
    //        nguoigui: nguoigui,
    //        nguoinhan:nguoinhan,
    //         ten_nguoinhan: ten_nguoi_nhan[0].ten_tk,
    //         url_nguoinhan: ten_nguoi_nhan[0].url,
    //    }
      // console.log(mang_tinnhan);
     res.send({user: danhsachtinnhan});
    // console.log(mang_tinnhan);
});
router.get('/chat/kiemtraketban',async (req,res)=>{
    const userkb = await thongbaoketban.singlebytaikhoan(req.session.AuthUser.ma_tk);
    console.log(userkb);
    //console.log(userkb.length);
    const mang_user = [];
    for(let i=0;i<userkb.length;i++)
    {    
      const userguiketban = await dangkymodel.single(userkb[i].id_nguoigui);
      console.log(userguiketban);
      mang_user[i]=(userguiketban);
    }
        //var arrayToString = JSON.stringify(Object.assign({}, mang_user));  // convert array to string
        //var stringToJsonObject = JSON.parse(mang_user);  // convert string to json object
       // console.log(arrayToString);
     res.send({user: mang_user});
});
const table_banbe = require('../../models/banbe');
router.post('/chat/kiemtraketban',async (req,res)=>{
    const dongy = req.body.dongy_ketban;
    //dongy.toString();
  // console.log(dongy.id_banbe[0])  
    const entity ={
        "id_tk": req.session.AuthUser.ma_tk,
        "id_banbe":dongy.id_banbe[0],
    }
    const entity1 ={
        "id_tk": dongy.id_banbe[0],
        "id_banbe":req.session.AuthUser.ma_tk,
    }
    console.log(entity);
    await table_banbe.add(entity);
    await table_banbe.add(entity1);
    await thongbaoketban.del(req.session.AuthUser.ma_tk);
    console.log(dongy.ten);
    res.send({data:dongy.ten});

});
router.delete('/chat/xoaketban',async (req,res)=>{
    await thongbaoketban.del(req.session.AuthUser.ma_tk);
})
router.get('/chat/themban',async (req,res)=>{
  const user = await dangkymodel.all();
   res.send({users: user});
});
const thongbaoketban = require('../../models/thongbaoketban');
const { system } = require('nodemon/lib/config');
router.post('/chat/themban',async (req,res)=>{
    const yeucauthemban = req.body.idketban;
    console.log(yeucauthemban);
    const entity = {
        "id_tk":yeucauthemban.id_nguoiketban,
        "noidung":yeucauthemban.thongtin,
        "id_nguoigui":yeucauthemban.id_nguoiguiketban,
    }
    const add = await thongbaoketban.add(entity);
    
    res.send('thanhcong');
//res.send({users: user});
  });
router.post('/chat',async (req,res)=>{
    //console.log(req.body.search);
    //console.log(user);
   // res.session.usersdt = user;
   // console.log(res.session.usersdt);
});
//them danh sach group 
const table_nhom = require('../../models/nhom');
const table_tk_nhom = require('../../models/taikhoan_nhom');
const { redirect } = require('express/lib/response');
router.post('/nhomchat',async (req,res)=>{
    const ds_group = req.body.ds_group;
  //  console.log(ds_group.ten_nhom);
    const entity={
        "tennhom":ds_group.ten_nhom
    }
    console.log(entity);
    await table_nhom.add(entity);
    const id_nhom = await table_nhom.single(ds_group.ten_nhom);
    let id_nhomm = id_nhom.map(a=> a.id_nhom);
   // console.log("a"+id_nhomm[0]);
    const add_mygroup={
        "id_tk":req.session.AuthUser.ma_tk,
        "id_nhom":id_nhomm[0],
        "thoigian":ds_group.thoigian,
        "noidung":'Hi',
        "loaitinnhan":'vanban'
    }
    await table_tk_nhom.add(add_mygroup);
    for(let i=0;i<ds_group.id_banbe.length;i++){
    const entity1 = {
        "id_tk":ds_group.id_banbe[i],
        "id_nhom":id_nhomm[0],
        "thoigian":ds_group.thoigian,
        "noidung":'Hi',
        "loaitinnhan":'vanban'
    }
    console.log(entity1);
    await table_tk_nhom.add(entity1);
    }  
    res.send({tennhom: ds_group.ten_nhom});
  });
router.get('/nhomchat',async (req,res)=>{
    const user = await table_tk_nhom.singlebytkbytennhom(req.session.AuthUser.ma_tk);
   // console.log(user);
     res.send({nhomchat: user});
  });
router.get('/danhsachnhantingroup/:tennhom',async (req,res)=>{
    const tennhomm =await table_tk_nhom.loadalltinnhan(req.params.tennhom);  
   res.send({nhomchat: tennhomm});
    
  });  
router.get('/loadhinhanh/:tennhom',async (req,res)=>{
    const all_id = await table_tk_nhom.loadidtennhom(req.params.tennhom);
    res.send({id:all_id})
});  
//cap nhat anh
router.post('/capnhatanh',async (req,res)=>{
    const file = new Buffer.from(req.body.thongtin_update.anh.replace(/^data:image\/\w+;base64,/, ""), 'base64');
    //lay đuôi ảnh
    const type = req.body.thongtin_update.anh.split(';')[0].split('/')[1];
   var id = uuid.v4()+Date.now().toString();
    const filePath=`${id}.${type}`;
   const params = {
     Bucket:'detaizalo',
     Key : filePath,
     Body:file,
     ACL:'public-read',
     ContentEncoding:'base64',
     ContentType:`image/${type}`
   }
   s3.upload(params,function(err,data){
     if(err){
      console.log(err);
      console.log('Error uploading data: ', data); 
    } else {
      console.log('successfully uploaded the image!');
    }
   })
   const duongdanurl = 'https://detaizalo.s3.ap-southeast-1.amazonaws.com/'
   const entity={
       "ma_tk":req.session.AuthUser.ma_tk,
    "ten_tk":req.body.thongtin_update.tentk,
    "sdt":req.body.thongtin_update.sdt,
    "url":`${duongdanurl}${filePath}`,
    "email":req.body.thongtin_update.email
}
 await dangkymodel.patch(entity);
     // res.redirect('/');
});  
module.exports= router;