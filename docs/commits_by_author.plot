set terminal png transparent size 640,240
set size 1.0,1.0

set terminal png transparent size 640,480
set output 'commits_by_author.png'
set key left top
set yrange [0:]
set xdata time
set timefmt "%s"
set format x "%Y-%m-%d"
set grid y
set ylabel "Commits"
set xtics rotate
set bmargin 6
plot 'commits_by_author.dat' using 1:2 title "Sage Weil" w lines, 'commits_by_author.dat' using 1:3 title "Kefu Chai" w lines, 'commits_by_author.dat' using 1:4 title "Yehuda Sadeh" w lines, 'commits_by_author.dat' using 1:5 title "Jason Dillaman" w lines, 'commits_by_author.dat' using 1:6 title "Greg Farnum" w lines, 'commits_by_author.dat' using 1:7 title "Samuel Just" w lines, 'commits_by_author.dat' using 1:8 title "Patrick Donnelly" w lines, 'commits_by_author.dat' using 1:9 title "Loic Dachary" w lines, 'commits_by_author.dat' using 1:10 title "John Spray" w lines, 'commits_by_author.dat' using 1:11 title "Josh Durgin" w lines, 'commits_by_author.dat' using 1:12 title "Casey Bodley" w lines, 'commits_by_author.dat' using 1:13 title "Yan, Zheng" w lines, 'commits_by_author.dat' using 1:14 title "Danny Al-Gaaf" w lines, 'commits_by_author.dat' using 1:15 title "Xie Xingguo" w lines, 'commits_by_author.dat' using 1:16 title "Radoslaw Zarzynski" w lines, 'commits_by_author.dat' using 1:17 title "Mykola Golub" w lines, 'commits_by_author.dat' using 1:18 title "David Zafman" w lines, 'commits_by_author.dat' using 1:19 title "Colin P. McCabe" w lines, 'commits_by_author.dat' using 1:20 title "Sebastian Wagner" w lines, 'commits_by_author.dat' using 1:21 title "Alfredo Deza" w lines
