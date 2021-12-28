<?php
$link=preg_replace('/.*shortlink|\/$/',"",$_POST["link"]);//Избавление ссылки от домена
$linkDB = mysqli_connect('localhost', 'root','','shortLink');
if (!$linkDB) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
//Если ссылка в БД уже существует, вернуть ее
//иначе создать новую и вернуть ее 
if ($shortlink=searchLink($link,$linkDB))
    echo $shortlink;
else
    echo createShortLink();

function createShortLink()
{
    global $link,$linkDB;
    $stroka="qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
    $shortLink="MMMMM";
    $LenStroka=strlen($stroka)-1;
        //Поиск Auto_increment
        $sql="SHOW TABLE STATUS LIKE 'links'";
        $result=mysqli_query($linkDB,$sql) or die("Ошибка ".mysqli_error($linkDB));
        $index=$result->fetch_assoc()["Auto_increment"];
    // короткая ссылка состоит из 5 символов, всего символов 52 (записаны все в переменной stroka)
    // максимальное количество ссылок - 51^4+51^4+51^3+51^2+51^1
    // Цикл поразрядно ищет наибольшее число степени, по нему берется символ из stroka
    // если число 51^4 (q) нашлось 51 раз, то это равносильно одной 51^5 (N)
    $indexMAX= pow($LenStroka,5)+pow($LenStroka,4)+pow($LenStroka,3)+pow($LenStroka,2)+pow($LenStroka,1);
    if($index>$indexMAX)
        return "БД переполнена.";

    for($i=5;$i>0;$i--)
    if(($count=intdiv($index,pow($LenStroka,$i-1)))>0)
    {
        if($count>51)//При максимальном приближении к следующему разряду, може выдавать на несколько значений больше
        $count=51;   //Низшие разряды в таком случае остаются пустыми.
        $shortLink[$i-1]=$stroka[$LenStroka-$count];
        $index-=pow($LenStroka,$i-1)*$count;
    }
    $sql ="INSERT INTO `links`(`link`, `shortLink`) 
            VALUES ('".$link."','".$shortLink."')";
    $result=mysqli_query($linkDB,$sql) or die("Ошибка ".mysqli_error($linkDB));
        
return "http://shortlink/".$shortLink;

}
//Поиск ссылки в БД
function searchLink()
{
    global $link,$linkDB;
    $sql ="SELECT * FROM `links`
           WHERE `link` = '".$link."'";
        $result=mysqli_query($linkDB,$sql) or die("Ошибка ".mysqli_error($linkDB));
        $shortlink=$result->fetch_assoc();
if($shortlink)
return "http://shortlink/".$shortlink["shortLink"];
return false;
}
?>