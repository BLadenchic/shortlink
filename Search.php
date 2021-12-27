<?php
//Поиск страницы в БД
    $shortLink=preg_replace('/\//',"",$_GET["shortLink"]);
    $linkDB=mysqli_connect('localhost', 'root','','shortLink');
    $sql ="SELECT * FROM `links`
           WHERE `shortLink` = '".$shortLink."'";
        $result=mysqli_query($linkDB,$sql) or die("Ошибка ".mysqli_error($linkDB));
        $link=$result->fetch_assoc();
    if($link)
        {
            header("Location: http://shortlink".$link["link"],TRUE,301);
            echo "http://shortlink".$link["link"];
        }else
        {echo "Такой страницы не существует.";
        return false;
        }?>