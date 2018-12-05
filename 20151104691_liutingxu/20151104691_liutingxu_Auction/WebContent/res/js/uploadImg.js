var imgSrc=[];var imgFile=[];var imgName=[];function imgUpload(obj){var oInput='#'+obj.inputId;var imgBox='#'+obj.imgBox;var btn='#'+obj.buttonId;$(oInput).on("change",function(){var fileImg=$(oInput)[0];var fileList=fileImg.files;for(var i=0;i<fileList.length;i++){var imgSrcI=getObjectURL(fileList[i]);imgName.push(fileList[i].name);imgSrc.push(imgSrcI);imgFile.push(fileList[i]);}
addNewContent(imgBox);})
$(btn).on('click',function(){if(!limitNum(obj.num)){alert("瓒呰繃闄愬埗");return false;}
var fd=new FormData($('#upBox')[0]);for(var i=0;i<imgFile.length;i++){fd.append(obj.data+"[]",imgFile[i]);}
submitPicture(obj.upUrl,fd);})}
function addNewContent(obj){$(imgBox).html("");for(var a=0;a<imgSrc.length;a++){var oldBox=$(obj).html();$(obj).html(oldBox+'<div class="imgContainer"><img title='+imgName[a]+' alt='+imgName[a]+' src='+imgSrc[a]+' onclick="imgDisplay(this)"><p onclick="removeImg(this,'+a+')" class="imgDelete">删除</p></div>');}}
function removeImg(obj,index){imgSrc.splice(index,1);imgFile.splice(index,1);imgName.splice(index,1);var boxId="#"+$(obj).parent('.imgContainer').parent().attr("id");addNewContent(boxId);}
function limitNum(num){if(!num){return true;}else if(imgFile.length>num){return false;}else{return true;}}
function submitPicture(url,data){for(var p of data){console.log(p);}
if(url&&data){$.ajax({type:"post",url:url,async:true,data:data,processData:false,contentType:false,success:function(dat){console.log(dat);}});}else{alert('璇锋墦寮€鎺у埗鍙版煡鐪嬩紶閫掑弬鏁帮紒');}}
function imgDisplay(obj){var src=$(obj).attr("src");var imgHtml='<div style="width: 100%;height: 100vh;overflow: auto;background: rgba(0,0,0,0.5);text-align: center;position: fixed;top: 0;left: 0;z-index: 1000;"><img src='+src+' style="margin-top: 100px;width: 70%;margin-bottom: 100px;"/><p style="font-size: 50px;position: fixed;top: 30px;right: 30px;color: white;cursor: pointer;" onclick="closePicture(this)">脳</p></div>'
$('body').append(imgHtml);}
function closePicture(obj){$(obj).parent("div").remove();}
function getObjectURL(file){var url=null;if(window.createObjectURL!=undefined){url=window.createObjectURL(file);}else if(window.URL!=undefined){url=window.URL.createObjectURL(file);}else if(window.webkitURL!=undefined){url=window.webkitURL.createObjectURL(file);}
return url;}