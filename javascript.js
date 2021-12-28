var response= document.getElementById('response');//элемент, куда будет вставлен ответ

document.forms.link_form.onsubmit = function(e){
    e.preventDefault();
    var userInput=document.forms.link_form.link.value;//значение, введенное пользователем
    userInput = userInput.replace(/^\s*|\s*$/g, '');//избавление от пробелов
    if(!check(userInput))
    {
        alert("Проверьте правильность ссылки.");
        return 0;
    }   
    userInput=encodeURIComponent(userInput);
    var request=new XMLHttpRequest();
    request.open('POST','check.php');
    request.setRequestHeader('Contetnt-type','application/x-www-form-urlencoded');
    var data = new FormData(document.forms.link_form);
    request.send(data);
    request.onreadystatechange=function(){
        if(request.readyState===4 &&request.status===200){
            document.getElementById("box-response").style.visibility = "visible";
            response.value=request.responseText;//Вставляем полученную ссылку
            Copy();
        }
    }
};
//Копирование ссылки в буфер обмена
function Copy(){
  var copyText = document.getElementById("response");
  copyText.select();
  document.execCommand("copy");
  response.title = "Ссылка была скопирована.";
}
//Проверка правильности ссылки
function check(userInput){
   if(userInput.search(/^http:\/\/shortlink\/|^shortlink\//)==-1)
   return false;
   return true;

}