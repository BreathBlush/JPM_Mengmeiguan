#!/bin/perl

use strict;
use warnings;
use utf8;

# Open OPF file
open(my $inputfh, "<:utf8", "./contents-gbk.tex")
  or die "Could not open file: content-gbk.tex\n";

open(my $outputfh, ">:utf8", "contents.tex")
  or die "Could not open file: contents.tex\n";

while (my $contents = <$inputfh>) {
  $contents =~ s/【百刂】/㓦/g;
#   $contents =~ s/【髟八】/𩫵/g;
  $contents =~ s/【髟巴】/䯲/g;
  $contents =~ s/【髟狄】/䯼/g;
#   $contents =~ s/【髟己】/𩫻/g;
  $contents =~ s/【艹縻】/䕷/g;
  $contents =~ s/【車兪】/輸/g;
  $contents =~ s/【虫麻】/䗫/g;
#   $contents =~ s/【辶里】/𨓦/g;
  $contents =~ s/【刀口儿丶】/兔/g;
#   $contents =~ s/【革登】/𩍐/g;
  $contents =~ s/【革翁】/䩺/g;
  $contents =~ s/【革占】/䩞/g;
  $contents =~ s/【合手】/㧱/g;
  $contents =~ s/【虍匆】/䖏/g;
#   $contents =~ s/【火川】/𤆑/g;
#   $contents =~ s/【火難】/𤓌/g;
#   $contents =~ s/【火贊】/𤓎/g;
#   $contents =~ s/【火章】/𤍤/g;
#   $contents =~ s/【釒劉】/𨮸/g;
#   $contents =~ s/【口勃】/𠷺/g;
#   $contents =~ s/【口床】/𠳹/g;
  $contents =~ s/【口弟】/㖒/g;
  $contents =~ s/【口東】/㖦/g;
  $contents =~ s/【口忝】/㖭/g;
  $contents =~ s/【婁頁】/䫫/g;
  $contents =~ s/【馬婁】/䮫/g;
#   $contents =~ s/【毛必】/𣭈/g;
  $contents =~ s/【毛參】/毶/g;
#   $contents =~ s/【毛皮】/𣬼/g;
#   $contents =~ s/【毛乍】/𣬿/g;
#   $contents =~ s/【門乍】/𨴃/g;
  $contents =~ s/【木匣】/㭱/g;
#   $contents =~ s/【木匝】/𣐝/g;
#   $contents =~ s/【目慮】/𥌠/g;
#   $contents =~ s/【目罒方】/𥈮/g;
  $contents =~ s/【疒羅】/㿚/g;
  $contents =~ s/【犭忽】/㺀/g;
#   $contents =~ s/【犭聿】/𤝽/g;
#   $contents =~ s/【亻囙】/𪜭/g;
  $contents =~ s/【日良】/㫰/g;
  $contents =~ s/【入日】/㒲/g;
  $contents =~ s/【尸從】/㞞/g;
  $contents =~ s/【十目丄】/直/g;
#   $contents =~ s/【石八】/𥐙/g;
#   $contents =~ s/【石拜】/𪿪/g;
#   $contents =~ s/【石必】/𥑖/g;
#   $contents =~ s/【石古】/𥑮/g;
  $contents =~ s/【石彔】/碌/g;
#   $contents =~ s/【石亡】/𥐞/g;
#   $contents =~ s/【飠鳥】/𪂾/g;
#   $contents =~ s/【扌霸】/𢺞/g;
#   $contents =~ s/【扌扉】/𢵞/g;
  $contents =~ s/【扌衮】/㨰/g;
  $contents =~ s/【扌晃】/㨪/g;
  $contents =~ s/【扌臼】/㧮/g;
#   $contents =~ s/【扌奴】/𢫓/g;
  $contents =~ s/【扌塞】/㩙/g;
#   $contents =~ s/【扌歪】/𢱉/g;
#   $contents =~ s/【扌造】/𢳥/g;
  $contents =~ s/【扌寨】/㩟/g;
  $contents =~ s/【扌隹冏】/㩦/g;
  $contents =~ s/【氵隺】/㴶/g;
  $contents =~ s/【氵口又】/沒/g;
#   $contents =~ s/【氵口又】/𣳚/g;
  $contents =~ s/【糹黾】/䋲/g;
  $contents =~ s/【糹秋】/䋺/g;
  $contents =~ s/【罒離】/䍦/g;
#   $contents =~ s/【王東】/𤦪/g;
  $contents =~ s/【王兪】/瑜/g;
#   $contents =~ s/【王兪】/瑜/g;
  $contents =~ s/【忄亾】/忙/g;
#   $contents =~ s/【忄亾】/𢗅/g;
  $contents =~ s/【吅田】/㽞/g;
#   $contents =~ s/【穴口心】/𥦗/g;
  $contents =~ s/【言兪】/諭/g;
  $contents =~ s/【訁兪】/諭/g;
#   $contents =~ s/【要月】/𦝫/g;
#   $contents =~ s/【衤旋】/𧜽/g;
#   $contents =~ s/【廴囘】/𢌞/g;
#   $contents =~ s/【月荅】/𦞂/g;
#   $contents =~ s/【月幾】/𦠄/g;
  $contents =~ s/【月彔】/䐂/g;
#   $contents =~ s/【月囊】/𦣘/g;
  $contents =~ s/【月豈】/䐩/g;
#   $contents =~ s/【舟光】/𦨻/g;
#   $contents =~ s/【秦】/𥱧/g;
#   $contents =~ s/【茶】/𨃓/g;
  $contents =~ s/【柴】/䠕/g;
#   $contents =~ s/【羅】/𨇽/g;

  # Adjust space
  $contents =~ tr/…─【】．/︙︱〔〕・/;

  print $outputfh $contents;
}

close($inputfh);
close($outputfh);
