set term png medium size 700,500
set output "OUTPUT_PLACEHOLDER"

set ylabel "Operations per second"
set autoscale

set xlabel "Concurrent Threads"
set xrange [1:128]
set logscale x 2 

set title "TITLE_PLACEHOLDER"
set key Left reverse left top

set style data points

plot 'FILE_PLACEHOLDER' using 1:2 with points pointtype 5 title "Google Launcher Mongo Cluster", \
     'FILE_PLACEHOLDER' using 1:3 with points pointtype 5 title "Docker Mongo Cluster on GKE"

