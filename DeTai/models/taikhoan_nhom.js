const db = require('../db');
const table ='taikhoan_nhom';
module.exports={
    all: _ =>{return db.load(`select * from ${table}`);
    },
    add: function(entity){
        return db.add(table,entity);
    },
    single: function(id){
        return db.load(`select * from ${table} where id_tk= ${id} `);
    },
    patch: function(entity){
        const condition={
            ma_tk: entity.ma_tk
        }
        delete entity.ma_tk
        return db.patch(table,entity,condition);
    },
    del: function(id){
        const condition={
            id_tk: id
        }
        delete entity.id_tk
        return db.del(table,condition);
    },
    singlebytkbytennhom:async function(matk){
       const row= await db.load(` select * from ${table} inner join nhom on taikhoan_nhom.id_nhom =  nhom.id_nhom where id_tk= '${matk}' group by tennhom`);
       if(row.length===0){
           return null;
       }
       return row;
    },
    singlebytkbytennhom111:async function(tennhom){
        const row= await db.load(` select * from ${table} inner join taikhoan on taikhoan_nhom.id_tk = taikhoan.ma_tk inner join nhom on taikhoan_nhom.id_nhom =  nhom.id_nhom where tennhom= '${tennhom}'`);
        if(row.length===0){
            return null;
        }
        return row;
     },
     loadidtennhom:async function(tennhom){
        const row= await db.load(` select * from ${table} inner join taikhoan on taikhoan_nhom.id_tk = taikhoan.ma_tk inner join nhom on taikhoan_nhom.id_nhom =  nhom.id_nhom where tennhom= '${tennhom}' group by id_tk`);
        if(row.length===0){
            return null;
        }
        return row;
     },
     loadaddtinnhannhom:async function(id_tk,tennhom){
        const row= await db.load(` select * from ${table} inner join nhom on taikhoan_nhom.id_nhom =  nhom.id_nhom where id_tk=${id_tk} and tennhom= '${tennhom}'`);
        if(row.length===0){
            return null;
        }
        return row;
     },
     loadalltinnhan:async function(tennhom){
        const row= await db.load(` select * from ${table} inner join taikhoan on taikhoan_nhom.id_tk = taikhoan.ma_tk inner join nhom on taikhoan_nhom.id_nhom =  nhom.id_nhom where tennhom= '${tennhom}' order by thoigian asc`);
        if(row.length===0){
            return null;
        }
        return row;
     },
     demsonhom:async function(idtk){
        const row= await db.load(`SELECT* FROM ${table} where id_tk=${idtk} group by id_nhom;
        `);
        if(row.length===0){
            return null;
        }
        return row;
     },
};
