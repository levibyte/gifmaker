#!/bin/bash

#usage should like this :)
#./make_gifik.sh -url https://www.youtube.com/watch?v=ue9Zdhu-1f0 -saveto erjankmexanika -start 01:12:34 -end 01:12:45 -gif heyhey.gif 
#./make_gifik.sh -video /home/levibyte/ddd/erjankmexanika.flv -start 01:12:34 -end 01:12:45 -gif heyhey.gif 

p=`pwd`

function check_status {
  if [ "$?" != "0" ]; then
    echo "fail!"
    if [ "$1" != "continue" ]; then
      echo "see $log"
      echo ""
      exit
    fi
  else
    echo " ok :)"
  fi
}

function parse_args_and_do_what_i_want {  
  #vid_url=https://www.youtube.com/watch?v=WI42op04vvY
  #vid=$p/vids/merbake1
  #out=$p/treasures/banaeleape_revloop.gif
  #start=00:40:38
  #length=3
  #do_reverse=1
  #first_frames_to_del=2
  #last_frames_to_del=3
  #last_frame_repeat=3

  #vid_url=https://www.youtube.com/watch?v=WI42op04vvY
  #vid=$p/vids/merbake1
  #out=$p/treasures/banaeleape_chelava.gif
  #start=00:40:38
  #length=5
  #do_reverse=0
  #first_frames_to_del=2
  #last_frames_to_del=3
  #last_frame_repeat=3


  #vid_url=https://www.youtube.com/watch?v=WI42op04vvY
  #vid=$p/vids/merbake1
  #out=$p/treasures/du_hartageghm_eakes.gif
  #start=0:29:28
  #length=6
  #do_reverse=0
  #first_frames_to_del=12
  #last_frames_to_del=0
  #last_frame_repeat=0
  


  #vid_url=https://www.youtube.com/watch?v=WI42op04vvY
  #vid=$p/vids/merbake1
  #out=$p/treasures/asatryanbocqaylel.gif
  #start=0:51:46
  #length=6
  #first_frames_to_del=8
  #last_frames_to_del=13
  #last_frame_repeat=3
  

  #vid_url=https://www.youtube.com/watch?v=WI42op04vvY
  #vid=$p/vids/merbake1
  #out=$p/treasures/asatryantashtush.gif
  #start=0:51:55
  #length=2
  #last_frame_repeat=1	
  #do_reverse=1	
  #last_frames_to_del=40
  #first_frames_to_del=8

  
  #vid_url=https://www.youtube.com/watch?v=WI42op04vvY
  #vid=$p/vids/merbake1
  #out=$p/treasures/asatryantashtush.gif
  #start=0:51:55
  #length=2
  #last_frame_repeat=1	
  #do_reverse=1	
  #last_frames_to_del=40
  #first_frames_to_del=8


  #vid_url=https://www.youtube.com/watch?v=wiUaMYQf1kU
  #vid=$p/vids/erjmexanika
  #out=$p/treasures/azatgasparianachkq_revloop.gif
  #start=01:11:33
  #length=2
  #do_reverse=1


  #vid_url=https://www.youtube.com/watch?v=l2K232EyNYo
  #vid=$p/vids/hrdeh
  #out=$p/treasures/gnanq_hacutenq2.gif
  #start=01:02:30  
  #length=7
  #first_frames_to_del=30
  #last_frames_to_del=17
  #resize=1
  #no_opt=1

  #vid_url=https://www.youtube.com/watch?v=4L1HcNEwr7U
  #vid=$p/vids/menqmersarere
  #out=$p/treasures/heyeeey.gif
  #start=00:45:27  
  #length=2
  #do_reverse=1
  #first_frames_to_del=25
  #last_frames_to_del=9
  #crop=152,8+156x111
  #resize=1

  #vid_url=https://www.youtube.com/watch?v=4L1HcNEwr7U
  #vid=$p/vids/menqmersarere
  #out=$p/treasures/hndzvorner.gif
  #start=00:19:47  
  #length=4
  #loop=0
  #do_reverse=1
  #first_frames_to_del=5
  #last_frames_to_del=3
  #crop=152,8+156x111
  #resize=1
  #no_opt=1


  #vid=$p/vids/emma.mov
  #out=$p/treasures/emma_hayacq.gif
  #start=00:00:08  
  #length=2
  #do_reverse=1
  #first_frames_to_del=3
  #last_frames_to_del=3
  #resize=1
  #no_opt=1

# #   vid_url=https://www.youtube.com/watch?v=fIQuc1Pv2jA
# #   vid=$p/vids/yurikdzya.mp4
# #   out=$p/treasures/yurikdzya1.gif
# #   start=00:00:41
# #   length=3
# #   loop=1
# #   do_reverse=1
# #   #first_frames_to_del=10
# #   last_frames_to_del=5
# #   #crop=152,8+156x111
# #   #resize=1
# #   no_opt=1

 
#   vid_url=https://www.youtube.com/watch?v=9Iwp6Z1AlD4
#   vid=$p/vids/koracmolorac.mkv
#   out=$p/treasures/shatshatshatvatergicher
#   start=00:23:31
#   length=9
#   loop=1
#   #do_reverse=1
#   #first_frames_to_del=2
#   last_frames_to_del=8
#   #last_frame_repeat=3
#   no_opt=1
#   #resize=1


  vid_url=https://www.youtube.com/watch?v=0q8bzfB7Q9A
  vid=$p/vids/k_vchonmerela.mkv
  out=$p/treasures/cxvac_hayko.gif
  start=00:02:59
  length=3
  loop=1
  do_reverse=1
  first_frames_to_del=10
  last_frames_to_del=4
  #last_frame_repeat=3
  no_opt=1
  #resize=1


  init
  download_and_giffy
  fini
}



#function fixme {
  #vid_url=`echo $url| cut -d'#' -f1`
  #tmp=`echo $url| cut -d'#' -f2`
  #start_t=`echo $tmp| cut -d'=' -f2`
  #d=3600

  #start_hh=`expr $start_t / $d`
  #if [ "$start_hh" -le "10" ]; then
    #$start_hh = "0$start_hh"
  #fi
  
  #p=10
  #start_mm=`expr $start_t / $d`
  #if [ "$start_mm" -eq "$p" ]; then
    #echo "aaa"
    #start_mm="0$start_mm"
  #fi

  #if [ "$start_mm" -ge "60" ]; then
    #start_hh=`expr $start_mm / $d`
    #if [ "$start_hh" -le "10" ]; then
      #$start_hh = "0$start_hh"
    #fi
  #fi

  #1:15:46

  #$(($start_t/$d))
  #echo "$start_t secs"
  #cho "-----"
  #echo "$start_ss s"
  #echo "$start_mm m"
  #echo "$start_hh h"

#}

function init {
  dbg=0
  gifdelay=6
  framerate=20
  osize=1920x1080
  #osize=640x480
  #osize=1024×576 
  #osize=640x480
  #osize=480x320
  #osize=320x240
  #colors=32
  colors=256

  log=$p/giffer.log
  workdir=~/.giffer

  rm -rf log &> /dev/null
  touch $log &> /dev/null
  rm -rf $workdir &>> $log
  mkdir $workdir &>> $log
  cd $workdir
}

function fini {
  chromium-browser $out &>> $log
  rm -rf $workdir &>> $log
  rm -rf $log & > /dev/null
  echo "done."
}

function get_vid {
  echo -ne "getting vid-----"
  if [ -f $vid ]; then
    echo "allready there:)"
  else
    /home/levibyte/gifmaker/youtube-dl $vid_url -o $vid &>> $log
    check_status
  fi
}

#FIXME this bullshit!
#made very quickly , need to think about some soultion :)
function reverse_gifs {
   
    gifcount=`ls | wc -l`
    #FIXME
    lastgif=`ls | sort | tail -1 | sed -e 's/out0\+//'`
    lastgif=`echo $lastgif | sed -e 's/.gif//' `
    lastgif=`expr $lastgif + 1`

    #firstgif=`ls | sort | head -1 | sed -e 's/out//' `
    firstgif=`ls | sort | head -1 | sed -e 's/out0\+//' `
    firstgif=`echo $firstgif | sed -e 's/.gif//' `
    #firstgif=`expr $firstgif + 1`
  
    if [ $dbg == "1" ]; then
      echo
      echo "$firstgif --- $lastgif"
      #exit
    fi
    #exit
    m=$lastgif
    n=$lastgif
    
    maxused=`ls | sort | tail -1 | sed -e 's/[^0]//g'`
    minused=$maxused
    
    maxused1="0$maxused"
    maxused2="0$maxused1"
    maxused3="0$maxused2"

    minused1=`echo $minused  | sed -e 's/.$//'`
    minused2=`echo $minused1 | sed -e 's/.$//'`
    minused3=`echo $minused2 | sed -e 's/.$//'`


    #echo
    while [ "$m" != $firstgif ];
    do
      m=`expr $m - 1 `
      n=`expr $n + 1`

      if [ "$m" -lt "10" ]; then
	maxused=$maxused1
      fi

      if [ "$n" -ge "100" ]; then
	minused=$minused1
      fi

      k=$maxused$m
      q=$minused$n
      #echo "cp out$k.gif out$q.gif"
      #echo "cp $workdir/out$k.gif $workdir/out$q.gif"
      cp $workdir/out$k.gif $workdir/out$q.gif
      #exit

      #echo
done
#exit
}

#FIXME pick a nice name
function cut_gifs
{

#echo
i=0
k=`ls |wc -l`

    if [ "$dbg" == "1" ]; then
      echo
      v=`expr $k - $last_frames_to_del`
      echo "delete 1-$first_frames_to_del , $v-$k"
      #exit
    fi

for gif in ./*; do
  if [ "$gif" != "" ]; then
    i=`expr $i + 1`
    
    if [ "$first_frames_to_del" != "" ]; then
      if [ "$i" -le $first_frames_to_del ]; then
	if [ $dbg == "1" ]; then
	  echo "-> deleting $gif"
	fi
	rm $gif

      fi
    fi 

    #FIXME , second statement . it is hack , don't know what it does
    if [ "$last_frames_to_del" != "" ] && [ "$last_frame_repeat" == "" ]; then
      j=`expr $k - $last_frames_to_del`
      if [ "$i" -gt "$j" ]; then
	if [ $dbg == "1" ]; then
	    echo "<- deleting $gif"
	fi
	rm $gif
      fi
    fi

    lastnum=$k
    if [ "$last_frames_to_del" != "" ]; then
      lastnum=`expr $k - $last_frames_to_del`
    fi
    
    if [ "$i" == "$lastnum" ]; then
      if [ "$last_frame_repeat" != "" ]; then
	#FIMXE use 1 regex
	fname=`echo $gif | sed -e 's/\.\/out//'`
	fname=`echo $fname | sed -e 's/0//g'`
	fname=`echo $fname | sed -e 's/\.gif//'`
	r=0
	while [ "$r" != "$last_frame_repeat" ]; do
	fname=`expr $fname + 1`
	    #FIXME . works only for testing now
	  zeros=0000000
	  if [ "$fname" -ge "100" ]; then
	      zeros=000000
	  fi
	  #echo -ne "cp $gif ./out$zeros$fname.gif"
	  cp $gif ./out$zeros$fname.gif  
	  #echo " -> ok"
	  #exit
	  r=`expr $r + 1`
	done
      fi
    fi

  fi
done  


}

function vid_to_gifs {
  echo -ne "converting vid to many gifs-----"  
  /usr/bin/ffmpegold -t $length -ss "$start" -i $vid -r $framerate $workdir/out%9d.gif &>> $log
  #echo "ffmpeg -t $length -ss "$start" -i $vid -r $framerate out%9d.gif &>> $log"
  check_status
  #exit

  if [ "$last_frame_repeat" != "" ] || [ "$first_frames_to_del" != "" ] || [ "$last_frames_to_del" != "" ]; then
    echo -ne "cuting FIXME some gifs-----"  
    #echo
    cut_gifs 
    #exit
    check_status
  fi
  
  if [ "$do_reverse" == "1" ]; then
    echo -ne "creating reverse gifs-----"  
    #echo
    reverse_gifs 
    #exit
    check_status
  fi
  
}

function vid_to_vid {
  #echo ""
  echo -ne "making vid from vid-----" 
  #FIXME p/mp4name part
  #mp4name=`echo $out_name | cut -d'.' -f1`
  #rm -rf $p/$mp4name.mp4 
  #ffmpeg -t $length -ss "$start" -i $vid $p/$mp4name.mp4 &>> $log
  check_status  
}

function gifs_to_gif {
  echo -ne "converting many gifs to 1 gif-----"  
  loopstr=" -loop 0 "
  if [ "$loop" != "" ] && [ "$loop" == 0 ]; then
    loopstr=""
  #facepalm!
  fi

  tmp="tmp.gif"
  if [ "$no_opt" == "" ]; then
    convert -delay $gifdelay $loopstr out*.gif $tmp &>> $log
    check_status  
    resize_and_crop $tmp resized_croped_$tmp
    optimize resized_croped_$tmp $out
  else
    convert -delay $gifdelay $loopstr out*.gif $tmp &>> $log
    check_status 
    resize_and_crop $tmp $out
  fi

  addwatermark

}

function addwatermark {
  #echo `pwd`
  #exit

  wmark="@cakladno  http://libxelar.so"
  wmarkoverlay="5:H-h+22"
  
  #title="   ապե apeeemihattelevizzr@miacreq eli"
  #titleoverlay="-10:-22"
 

#   echo -ne "creating watermark1-----"
#   convert -size 560x85 xc:transparent -font Arial-Black-Regular -pointsize 22 -fill white -draw "text 20,55 '$title'" test1.png
#   check_status 
# 
#   echo -ne "adding watermark-----"
#   #echo "$out"
#   #FIXME, watermark is in local path
#   mv $out $out.tmp
#   ffmpeg -i $out.tmp -vf "movie=$workdir/test1.png [watermark]; [in][watermark] overlay=$titleoverlay [out]" $out &>> $log
#   check_status 


  echo -ne "creating watermark2-----"
  convert -size 560x85 xc:transparent -font Palatino-Bold -pointsize 12 -fill white -draw "text 20,55 '$wmark'" test2.png
  check_status 

  
  echo -ne "adding watermark2-----"
  mv $out $out.tmp
  ffmpeg -i $out.tmp -vf "movie=$workdir/test2.png [watermark]; [in][watermark] overlay=$wmarkoverlay [out]" $out &>> $log
  check_status 


}

function resize_and_crop {
  echo -ne "resizing and cropping gif-----"
  resize_str=""
  crop_str=""

  if [ "$resize" != "" ] && [ "$resize" == 1 ] ; then 
    resize_str=" --resize $osize "
  fi

  if [ "$crop" != "" ] ; then 
    crop_str=" --crop $crop "
  fi

  gifsicle $1 $resize_str $crop_str -o $2 &>> $log
  check_status 
}


function optimize {
  echo -ne "optimizing gif-----"  
  convert -layers Optimize $1 opt_$1  &>> $log 
  gifsicle -O3 opt_$1 -o $2 &>> $log 	 
  check_status
}

function download_and_giffy {
  get_vid
  vid_to_gifs
  vid_to_vid
  gifs_to_gif
}

function giffy {
  vid_to_gifs
  gifs_to_gif
}

function giffy_and_viddy {
  giffy  
  vid_to_vid
}


function main {
  parse_args_and_do_what_i_want
}


main
