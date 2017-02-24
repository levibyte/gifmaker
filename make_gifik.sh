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


  vid_url=https://www.youtube.com/watch?v=JBEfpVqBJuE
  vid=$p/vids/paxirkamamusnacir.mkv
  out=$p/treasures/qyarttaxi.gif
  start=01:36:07
  length=5
  loop=1
  do_reverse=1
  #first_frames_to_del=10
  #last_frames_to_del=5
  #last_frame_repeat=3
  no_opt=1
  resize=1


  init
  download_and_giffy
  fini
}




function init {
  wmark="@Ցակլադնո http://libxelar.so"
  wmarkfont="DejaVu-Serif-Book"
  #wmarkoverlay="5:H-h+22"
  wmarkoverlay="10:10"
  wmarkfsize="18"

  dbg=0
  gifdelay=6
  framerate=15
  #osize=1920x1080
  #osize=1024×576 
  osize=1280x720
  #osize=640x480
  #osize=480x320
  #osize=320x240
  colors=32
  #colors=256

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
#made very quickly , need to think about some elegant soultion :)
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
  convert -size 560x85 xc:transparent -pointsize $wmarkfsize -font $wmarkfont -fill white -draw "text 20,55 '$wmark'" test2.png
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
